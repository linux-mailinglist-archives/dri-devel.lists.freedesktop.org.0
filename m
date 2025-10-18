Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48329BEDC84
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 00:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49D710E04E;
	Sat, 18 Oct 2025 22:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.b="kbf2gS1i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from iad-out-013.esa.us-east-1.outbound.mail-perimeter.amazon.com
 (iad-out-013.esa.us-east-1.outbound.mail-perimeter.amazon.com
 [34.198.218.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C04210E219;
 Sat, 18 Oct 2025 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1760818072; x=1792354072;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=faTSuBMol+S8aiOV6ICfD5+EPjrZok0AzHQwNcEXMP8=;
 b=kbf2gS1iJ9i+k4x+x7zl+2ec9AyOTjIgaQGEVp0bbeI0q0XS2euIUfJv
 jqULpcvrZOVMpnJR13FgYceDTsDWxtLQgI53STSXcaywtgv4Wk+auddvx
 tgtcWiV+ChFj5UQZpnI3FjDiTDEAJuRtxxecNlLm2isFfykPXenwrrsnm
 MJ7fPhd1cyT600+pq0eDBliD2W8PbAHqQnGbRsXsR3CmwmwSw3K28EyGc
 QyuVAS9aClCyXzurJ/N5OsdvJGlpp1zchuUQKAtaSHUm2L5zX+fQ1zLTq
 7vi9MAQ1YPEUqRfoaPS/CNekq+U4z8ulVn6iQjA5BdJw5cUMVNHxsXt6l g==;
X-CSE-ConnectionGUID: giSIe6tITsSah9GLTxasFw==
X-CSE-MsgGUID: /ziCnTclSdq9KqJpm3qZKw==
X-IronPort-AV: E=Sophos;i="6.18,259,1751241600"; 
   d="scan'208";a="4219831"
Received: from ip-10-4-3-150.ec2.internal (HELO
 smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.3.150])
 by internal-iad-out-013.esa.us-east-1.outbound.mail-perimeter.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 20:07:47 +0000
Received: from EX19MTAUEA002.ant.amazon.com [72.21.196.65:25918]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.61.254:2525]
 with esmtp (Farcaster)
 id b8b370c3-14a3-4401-b9fc-de73221abf88; Sat, 18 Oct 2025 20:07:47 +0000 (UTC)
X-Farcaster-Flow-ID: b8b370c3-14a3-4401-b9fc-de73221abf88
Received: from EX19EXOUEC002.ant.amazon.com (10.252.135.179) by
 EX19MTAUEA002.ant.amazon.com (10.252.134.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Sat, 18 Oct 2025 20:07:43 +0000
Received: from EX19EXOUEC001.ant.amazon.com (10.252.135.173) by
 EX19EXOUEC002.ant.amazon.com (10.252.135.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Sat, 18 Oct 2025 20:07:41 +0000
Received: from BL2PR08CU001.outbound.protection.outlook.com (10.252.134.239)
 by EX19EXOUEC001.ant.amazon.com (10.252.135.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20
 via Frontend Transport; Sat, 18 Oct 2025 20:07:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZ7mquB/NZm0MDovCQCZq0H9RRfMhiK60/biMQw/ewXkMDY4Cfx361IGKxbuvW8w3JiycO1/Jtw1yS6uMhBqIZMhWiWRiq+4Q1xVhASNeFJgKH9IEvmoH5T4kT1SmsGk9bCpW9M8ECVmFNrYJeleC30yJ92IoASJO4TICXjqNnVmCX/+P8ogJQ3oS5/r/zjglQ0nS1ZaaNmttxUSWNEi2rRx3pNaqWMkyiVq54WQmzbEbtx9IHHzH1zPSTaciXKgDp0o0VADhqUINgzQaDa6wBSbIJmGLZeEt7wPViAJcYr7vyXfw43ut+Mn5DTputqhcMo7FjLdYHsRo3QuDzL+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faTSuBMol+S8aiOV6ICfD5+EPjrZok0AzHQwNcEXMP8=;
 b=Y54Kgu/hi7IX+xgSwTP2r/NkBRMFa0L/WWm3WWGGKfKeakm1LBlG3sphEQDRTdKyHBmEah5/ErwPFQLuS9NKCSU/grZJHDgDGZNwgUTtLwGXWoa1A2hhvP+MmuIRAlaDfrnOlDZF1kwWsogifzC0UB9df5fh23JIeiTTwxOlpoALHAGwwkx0jnYEB2Nm23QvW1QUDO4PAqYSfT3eR7PSeC4VeQAn2Rlt9tmcLCS50lR6QSRGIwEd+sZWr7TYqomUXW0J/3cUbqbDUV00EYGl1oJZu3thbLxV2Szhgl1STo8r/Db82rHuY+av++5WHXyrEOuKozg33pVoMR9/B7A+2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from CH0PR18MB5433.namprd18.prod.outlook.com (2603:10b6:610:181::16)
 by PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.14; Sat, 18 Oct
 2025 20:07:33 +0000
Received: from CH0PR18MB5433.namprd18.prod.outlook.com
 ([fe80::1423:ab6b:11cc:7b0]) by CH0PR18MB5433.namprd18.prod.outlook.com
 ([fe80::1423:ab6b:11cc:7b0%7]) with mapi id 15.20.9228.014; Sat, 18 Oct 2025
 20:07:33 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>, "jdike@addtoit.com" <jdike@addtoit.com>,
 "richard@nod.at" <richard@nod.at>, "anton.ivanov@cambridgegreys.com"
 <anton.ivanov@cambridgegreys.com>, "dave.hansen@linux.intel.com"
 <dave.hansen@linux.intel.com>, "luto@kernel.org" <luto@kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
 <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com"
 <hpa@zytor.com>, "tony.luck@intel.com" <tony.luck@intel.com>,
 "qiuxu.zhuo@intel.com" <qiuxu.zhuo@intel.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "james.morse@arm.com" <james.morse@arm.com>,
 "rric@kernel.org" <rric@kernel.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "evan.quan@amd.com"
 <evan.quan@amd.com>, "james.qian.wang@arm.com" <james.qian.wang@arm.com>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>, "mihail.atanassov@arm.com"
 <mihail.atanassov@arm.com>, "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "robdclark@gmail.com" <robdclark@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "jdelvare@suse.com" <jdelvare@suse.com>, 
 "linux@roeck-us.net" <linux@roeck-us.net>, "fery@cypress.com"
 <fery@cypress.com>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
 "agk@redhat.com" <agk@redhat.com>, "snitzer@redhat.com" <snitzer@redhat.com>, 
 "dm-devel@redhat.com" <dm-devel@redhat.com>, "rajur@chelsio.com"
 <rajur@chelsio.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>, "peppe.cavallaro@st.com"
 <peppe.cavallaro@st.com>, "alexandre.torgue@st.com"
 <alexandre.torgue@st.com>, "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "malattia@linux.it"
 <malattia@linux.it>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "intel-linux-scu@intel.com" <intel-linux-scu@intel.com>,
 "artur.paszkiewicz@intel.com" <artur.paszkiewicz@intel.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "sakari.ailus@linux.intel.com"
 <sakari.ailus@linux.intel.com>, "clm@fb.com" <clm@fb.com>,
 "josef@toxicpanda.com" <josef@toxicpanda.com>, "dsterba@suse.com"
 <dsterba@suse.com>, "xiang@kernel.org" <xiang@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "jack@suse.com" <jack@suse.com>, "tytso@mit.edu"
 <tytso@mit.edu>, "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "dushistov@mail.ru" <dushistov@mail.ru>, "luc.vanoostenryck@gmail.com"
 <luc.vanoostenryck@gmail.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "pmladek@suse.com" <pmladek@suse.com>, "sergey.senozhatsky@gmail.com"
 <sergey.senozhatsky@gmail.com>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>, "linux@rasmusvillemoes.dk"
 <linux@rasmusvillemoes.dk>, "minchan@kernel.org" <minchan@kernel.org>,
 "ngupta@vflare.org" <ngupta@vflare.org>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "kuznet@ms2.inr.ac.ru" <kuznet@ms2.inr.ac.ru>,
 "yoshfuji@linux-ipv6.org" <yoshfuji@linux-ipv6.org>, "pablo@netfilter.org"
 <pablo@netfilter.org>, "kadlec@netfilter.org" <kadlec@netfilter.org>,
 "fw@strlen.de" <fw@strlen.de>, "jmaloy@redhat.com" <jmaloy@redhat.com>,
 "ying.xue@windriver.com" <ying.xue@windriver.com>, "willy@infradead.org"
 <willy@infradead.org>, "sashal@kernel.org" <sashal@kernel.org>,
 "ruanjinjie@huawei.com" <ruanjinjie@huawei.com>, "David.Laight@aculab.com"
 <David.Laight@aculab.com>, "herve.codina@bootlin.com"
 <herve.codina@bootlin.com>, "Jason@zx2c4.com" <Jason@zx2c4.com>,
 "keescook@chromium.org" <keescook@chromium.org>, "kbusch@kernel.org"
 <kbusch@kernel.org>, "nathan@kernel.org" <nathan@kernel.org>,
 "bvanassche@acm.org" <bvanassche@acm.org>, "ndesaulniers@google.com"
 <ndesaulniers@google.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-um@lists.infradead.org"
 <linux-um@lists.infradead.org>, "linux-edac@vger.kernel.org"
 <linux-edac@vger.kernel.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-hwmon@vger.kernel.org"
 <linux-hwmon@vger.kernel.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "netfilter-devel@vger.kernel.org"
 <netfilter-devel@vger.kernel.org>, "coreteam@netfilter.org"
 <coreteam@netfilter.org>, "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>, "Farber, Eliav" <farbere@amazon.com>
Subject: RE: [PATCH v2 00/27 5.10.y] Backport minmax.h updates from v6.17-rc7
Thread-Topic: [PATCH v2 00/27 5.10.y] Backport minmax.h updates from v6.17-rc7
Thread-Index: AQHcQGrWt9KuxcR5vUiwU3AnN2A8Rw==
Date: Sat, 18 Oct 2025 20:07:32 +0000
Message-ID: <CH0PR18MB5433BB2E99395D2AC8B0E0FBC6F7A@CH0PR18MB5433.namprd18.prod.outlook.com>
References: <20251017090519.46992-1-farbere@amazon.com>
 <2025101704-rumble-chatroom-60b5@gregkh>
In-Reply-To: <2025101704-rumble-chatroom-60b5@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR18MB5433:EE_|PH0PR18MB4558:EE_
x-ms-office365-filtering-correlation-id: f5d260fd-b8cb-46ea-5ff8-08de0e81f93a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?WVNPOVJSUmdZU1NwaGlDMDRQbXNCdE51WnRZZGN1VHA3MlVSeUxTcWtMV2hO?=
 =?utf-8?B?Y0ZMYVRtaGhnS0IzUk9mMFd2MWpGVTAxY1dRTWV1bHZIK2JGTVRVQS9LSzFn?=
 =?utf-8?B?anE5YzVrWjVvaEdCSjExTDNBZnB1WUVwSVhFeEhJNVZXVWVWL1QrYk1EMmJw?=
 =?utf-8?B?dFBybTVhSmFEWkovWTdzZ0JYcWFQb3VhbnlqRU1oQ2RrOTZuU2tSZldKNGNs?=
 =?utf-8?B?c1FTeklkQnJ4dG1kM1hYMkNQVnNhdXF6elFnQkViZldFWmhITTdGZWRmS2Q4?=
 =?utf-8?B?Nk9sbVJLSSs5c1liOVUzTjN6MGlpOXo4RGtDUjlESUl3eVRySFA5dWFVWXhN?=
 =?utf-8?B?K01KOElma1hrT1BpSzZuNnYveUNwYXZZdmFEc3ZQTTR2alJ1OGVTNlN3QVhu?=
 =?utf-8?B?WmZYT1RiOWlHbzgrdmlvWC90RU51N3hMbzJUeTUzcUpkTHM5UzJncUVCOXEx?=
 =?utf-8?B?OThGMTV0U0xETWptOS9Oa0h4d2RTdzJtK2xuWEUxWUZBMjF5UnBsZmdYU2tv?=
 =?utf-8?B?YWpreSttNk8xV1hxTU9NY1hmQWFNZ2pwTFRrQXk4OGl3NzkvK1JvWEt0b0pk?=
 =?utf-8?B?Uk82emVEV1JLaXh0OEh2QkVoSzFsTE9kTFk5cUdwc3ljTjFpK1p5V2dOdFBK?=
 =?utf-8?B?YjNtSE0xTU5iTXBqd3hsczJoWDRqVy8zS1hOK3JydWJ1UENSYkFuZVdaS3Bs?=
 =?utf-8?B?ZjNOYnI5dkNMc25WYjMwdUZhMm4raVNQTGxXb3VBaGZpOWVuNXllcEE5Y1J0?=
 =?utf-8?B?emU4Wkp6bmNXMVhEcWRzaGdWTm9WMmdFMzBXbDRRZ2ZaTkloZVhvVlhoTWxY?=
 =?utf-8?B?cWJhOU4vZnpkbzR5OFYybFBIMEY4UDFiME1HVFhabC9CWkNDYm5vQm94VFZW?=
 =?utf-8?B?djhqYTJHdjdGSXd2Tys3dDBEbUFHOU8rZEVEcXM5SHpRMjR5RjVxZFVQNnFC?=
 =?utf-8?B?bmxSTEJrVE1ybEcvMkRLbWc1QS9uOC9peWdUOENLb0xFUC9xNms0aC9aRURK?=
 =?utf-8?B?YlB5c1VhOEZ2WkpoWUtQdFltQVZoNXN6c0pJVjVFbE1lNjAvaDRmUTFzK0tB?=
 =?utf-8?B?dEc2TVE2ckczZGhnZVlLbVFXNFRsUk55QmlIbmVGdENnQmttWjRra2dlMFZL?=
 =?utf-8?B?OTBuc2JtMnEzcmlzdUUyYXkvM0hpVHJ4czYxdmdxWFB6alhENFpGbEs3Qll3?=
 =?utf-8?B?YTF4b3lBS3dYQTZsR1lybHREZU45UVRmdXBndFBZUVdEbzJvWTdTcGJEWldx?=
 =?utf-8?B?dllZT1NTSXFYMEZ3ZGh6TEIvRDZNbDRWT2xxUThHZHEvSllFdjk3bElVQUxV?=
 =?utf-8?B?TGN2eEEwZzVnM3lMOGJGNjlxdmJBRS9zMzg4U1hwTjJqR05aZnRrdTlzSzM0?=
 =?utf-8?B?WTBZRGovOTJYZ296RDdTUXNzenhaMzdBcWE0Z0xPZE84UFpyRUVISUgrdFNR?=
 =?utf-8?B?SGM4TmtMeE5nZXB6TDN1RUVUaERGYTdQc3dPS1pIREV6ZjhYNytzOUg3eHdz?=
 =?utf-8?B?Mk1lWWRXNmI4UUlRYVBrTGF3eEpRNXkxQ3o2RkJPemhobVllTVZ4Ukp0RjVW?=
 =?utf-8?B?UG1uV3QvMzBkOFZlMkJ6M2tvalJFSmpKcTQvMWdEb0ZKWTIwLzdRRzRyUE1U?=
 =?utf-8?B?UmpHYVVTclNXeGcvU0VKL0tlUzA0a3lwdWM4MTFFT2lMbHR2cmpDcEcwREhT?=
 =?utf-8?B?eDdkSktnd1ZHZkw3cE1KS2hzellQeThwbjBGMjNyWHRwb1dNcUZ0eDJPTU9l?=
 =?utf-8?B?aUtKQmxvdGtzeFc2enR3S1cvanJHZzZmTE04VUJnd3dGNTIvWG0za3FuekFI?=
 =?utf-8?B?bU56d2ZUTnBDOVZQM3ArUzdWNU1rV25YN3VFY2hSNEkvb2NOdlg2MFo5a3c4?=
 =?utf-8?B?WE80VVlmQ0dlait1djVpeXk2ajY3UjZ1ajg4S2JaNjIzVFVmZmtqcnhZYkpT?=
 =?utf-8?B?QktycVRHVlM5UFg5M3BaeFFpQVB2OUxyMDVYR3A3Q2xyL2R1a0tLRy9tRVlt?=
 =?utf-8?B?TFdUS3VybkNBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR18MB5433.namprd18.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWVhdGxieG1obWpVczZVUEVPMm93cEtvVDhoaHQ1SnZNcTFyZlI5cXhVcFJT?=
 =?utf-8?B?Rk15WjBTSFRkbVEvQVRvR3N3VTJFbi9iQkJXVFA2bGNPVUo3MGc4Y3U4V0Js?=
 =?utf-8?B?MTZtdW92N2J3Tm1ubmx1OXV4RjBzYU1HUDZEK3RqeGdMbDFtNEoyYzdLVFNw?=
 =?utf-8?B?TEZIWFphVE11UXJKN25EMHdMMysyL3ZoYWw5aU5uL2RRdDY4eWlPdEF6aGN2?=
 =?utf-8?B?OEZjQVgxekFwNkk2aEpmQTJ1QWcvWTZia2NEdDdIUHlnMkZONXIxQTAvY3Zz?=
 =?utf-8?B?aXFEODFLcHZkcnpSK0NEd3JQZ0F0UmFlL0hzWWtSOExBaDBzQUFNaFYyV3VL?=
 =?utf-8?B?ZE9LS0dac2t1ekFVTVNYMkl2TTJKWXdpb0ZzbHphUVd4NVUwQTBQOEdDWTlF?=
 =?utf-8?B?cTAzUktCaWVyQjFvRGhhcUc5NlRRMmNzYTg3UDJEKytKU3FVRXBaTk1kRC9N?=
 =?utf-8?B?NzFpN2ZJeGxPMTQwZWkwdWJ1VFZvY2V4Vm4ybDJ5SnlyYmVNRTZ4WkVlcWlG?=
 =?utf-8?B?K3BDYjF5V1NFQTg3L0hra0ZzVWVWSHdWRXhpNDhHdHdZUjZvbVh1TVJNYVlS?=
 =?utf-8?B?d3o5REdrUHZoZjVlT1VJck1haWlnK0ZIb3dxaEhjaC9DZzVxTytQWmNEWGl1?=
 =?utf-8?B?T1ZkNFpLZitmb2FxRjZxdTB3K25JLzFmc3RJTUE4bDhHdkZvOFJLd2k2NjJW?=
 =?utf-8?B?VE9uTEhmdERLRllIR3VQR3RweFVHR2o5Y0tLenlTMTIxSlloVEt0SGpFcFZS?=
 =?utf-8?B?S2QveVk3amJmTjg3S3dyeUN2Vk5kWlB2NkJIOHRQY1Q0d21RMFpidndCbDNH?=
 =?utf-8?B?bGc4Nnh4SWRiY1ZQWFM2TmcvN0ZQeFJCN2hmbURveGJOUS90Qis3Z0htNkpx?=
 =?utf-8?B?dkE2WWpjOFJMOGlYUkpjaTFidWZiK1N4dkJMcGRDMklNTHU1L3p6VGpaUG5Y?=
 =?utf-8?B?TmVXVEtiTnlDRG9nT3BtMzhZMW9mdTJYdWtLbjJ0ZDM0anlZUEprQ1VoaDRF?=
 =?utf-8?B?OGJabXJmcXFYbTJYOEJNRWdFZ1c0UGN2dElVNFN3NU5YUC83bUlOZXN5RWJR?=
 =?utf-8?B?QmUvVHZOdEluY3hOalZRUDczMkZaRGh5MFZtS2Vyd0hENHRnbHI3SVhFYUFV?=
 =?utf-8?B?UlhzMHVxdmU3dWVWUnUzTlVnSlpLSE1HTzRiVEJCMDJ3OGdLM096OWlja0hv?=
 =?utf-8?B?TTZETC9GWjB5aWJBN2paNEhZOHZBNVY4Nk1IaU4rUDdMQmd3Ym9tOEVtU1ZZ?=
 =?utf-8?B?OEFLc01BRW9JSjh4NjF3UW14ZEVNVExaQVl0Nkx2UXNPYVdrMlJvYWhDYkZw?=
 =?utf-8?B?ZjNkMGVZMjNVcUxnQUREV20vM1IrNndEcElCZEc5N2o0dUZ2Y3hIRmNEQnVx?=
 =?utf-8?B?OXpCcjN0bGZIKzAvNTZoRE9XZldTdlk2WE9TTEExc2JXU0syVmlzaHBvY1Zs?=
 =?utf-8?B?MEFHWTg0M3REbTlnWUN3dVQ2eDBVaVNpNVVBaHBEb0VmUE56cHZIblQ3NEtu?=
 =?utf-8?B?RHJpUDVNNEUxRUg0bTBFQ1RDcTlmV21HdXd3aUxmZTczRFJ1WCtxcyt6Q2Fy?=
 =?utf-8?B?cHB5RDIrV2ZDRGozcGVwVlp4UURzbmwzenNoeFlZdmlJQWRDdWR4TnEyU1pR?=
 =?utf-8?B?ckh5ajV1REhiTjBEM05DZzR4MlFVOGpIOWFvbFpSdWNDRkJubHdjQTVsaFkx?=
 =?utf-8?B?aERneHpmMzliWTJDQkZCM3FTU3NqcGlVZSttdTM4MHk2djltWkRwUWdVRHJj?=
 =?utf-8?B?TFVqMmhUTGFCSDh2YkcvcnMxZ0ZYNWxNbnR5RDhqQnJad0Y5NG00UWo1WXc3?=
 =?utf-8?B?aS9QRzF3a2RPUHFoS1gvSWUrcGhZNzVDR1JiVGhFcUh2MFREbUlGbG1Iclhk?=
 =?utf-8?B?d1hoUFRMZUx5VTlDbGhLZ3dCaWVtUkFzQ0kwaHpDSnNFZURiQUhVZXlxdEp4?=
 =?utf-8?B?NXhlRjRJSW90REVmTUwweEo1RHpYdzNyM0VxY1I3NmJwSU9BZVdyU0NhSjh2?=
 =?utf-8?B?N0hYZEJ5bkFkQWtwak0rSnJaQmUxYmtuQ1kvTmZWdDhTWlJlS3o3OGkyUUUr?=
 =?utf-8?B?bWltY243dDNBMVhEUzJ1NVJnNzhSZ3J4VkFkMXljakxwYUNjT3BzbmdGMEFY?=
 =?utf-8?Q?FYN4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR18MB5433.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d260fd-b8cb-46ea-5ff8-08de0e81f93a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2025 20:07:32.8050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+ny1zt614LyeAmtN+QMZX+GivZb18A4g+iLjEgNWGUZ+g/wjXRYpBLk6Oob+KdDOZBbiA6OODP6Limctphz8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB4558
X-OriginatorOrg: amazon.com
X-Mailman-Approved-At: Sat, 18 Oct 2025 22:41:01 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBPbiBGcmksIE9jdCAxNywgMjAyNSBhdCAwOTowNDo1MkFNICswMDAwLCBFbGlhdiBGYXJiZXIg
d3JvdGU6DQo+ID4gVGhpcyBzZXJpZXMgYmFja3BvcnRzIDI3IHBhdGNoZXMgdG8gdXBkYXRlIG1p
bm1heC5oIGluIHRoZSA1LjEwLnkNCj4gPiBicmFuY2gsIGFsaWduaW5nIGl0IHdpdGggdjYuMTct
cmM3Lg0KPiA+DQo+ID4gVGhlIHVsdGltYXRlIGdvYWwgaXMgdG8gc3luY2hyb25pemUgYWxsIGxv
bmctdGVybSBicmFuY2hlcyBzbyB0aGF0IHRoZXkNCj4gPiBpbmNsdWRlIHRoZSBmdWxsIHNldCBv
ZiBtaW5tYXguaCBjaGFuZ2VzLg0KPiA+DQo+ID4gLSA2LjEyLnkgaGFzIGFscmVhZHkgYmVlbiBi
YWNrcG9ydGVkOyB0aGUgY2hhbmdlcyBhcmUgaW5jbHVkZWQgaW4NCj4gPiAgIHY2LjEyLjQ5Lg0K
PiA+IC0gNi42LnkgaGFzIGFscmVhZHkgYmVlbiBiYWNrcG9ydGVkOyB0aGUgY2hhbmdlcyBhcmUg
aW5jbHVkZWQgaW4NCj4gPiAgIHY2LjYuMTA5Lg0KPiA+IC0gNi4xLnkgaGFzIGFscmVhZHkgYmVl
biBiYWNrcG9ydGVkOyB0aGUgY2hhbmdlcyBhcmUgY3VycmVudGx5IGluIHRoZQ0KPiA+ICAgNi4x
LXN0YWJsZSB0cmVlLg0KPiA+IC0gNS4xNS55IGhhcyBhbHJlYWR5IGJlZW4gYmFja3BvcnRlZDsg
dGhlIGNoYW5nZXMgYXJlIGN1cnJlbnRseSBpbiB0aGUNCj4gPiAgIDUuMTUtc3RhYmxlIHRyZWUu
DQo+DQo+IFdpdGggdGhpcyBzZXJpZXMgYXBwbGllZCwgb24gYW4gYXJtNjQgc2VydmVyLCBidWls
ZGluZyAnYWxsbW9kY29uZmlnJywgSQ0KPiBnZXQgdGhlIGZvbGxvd2luZyBidWlsZCBlcnJvci4N
Cj4NCj4gT2RkbHkgSSBkb24ndCBzZWUgaXQgb24gbXkgeDg2IHNlcnZlciwgcGVyaGFwcyBkdWUg
dG8gZGlmZmVyZW50IGNvbXBpbGVyDQo+IHZlcnNpb25zPw0KPg0KPiBBbnkgaWRlYXM/DQoNClRo
aXMgbWFpbmxpbmUgY29tbWl0IGlzIG1pc3Npbmc6DQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0L2RyaXZlcnMv
bmV0L3dpcmVsZXNzL3JhbGluay9ydDJ4MDAvcnQyODAwbGliLmM/aD12Ni4xOC1yYzEmaWQ9NjYw
NjMwMzNmNzdlMTBiOTg1MjU4MTI2YTk3NTczZjg0YmI4ZDNiNA0KDQpUaGlzIGZpeCBhbHJlYWR5
IGV4aXN0cyBpbiA1LjE1Lnk6DQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC9kcml2ZXJzL25ldC93aXJlbGVzcy9y
YWxpbmsvcnQyeDAwL3J0MjgwMGxpYi5jP2g9djUuMTUuMTk0JmlkPTJkM2NlZjNkN2E1ZGYyNjBh
MTRhNjY3OWM0YWNhMGM5N2U1NzBlZTUNCuKApmJ1dCBpcyBtaXNzaW5nIGluIDUuMTAueS4NCg0K
SSBub3cgYmFja3BvcnRlZCBpdCB0byA1LjEwLnkgaGVyZToNCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3N0YWJsZS8yMDI1MTAxODE5NTk0NS4xODgyNS0xLWZhcmJlcmVAYW1hem9uLmNvbS9ULyN1
DQoNClJlZ2FyZHMsIEVsaWF2DQoNCg0KPiBJbiBmdW5jdGlvbiDigJhydDI4MDBfdHhwb3dlcl90
b19kZXbigJksDQo+ICAgICBpbmxpbmVkIGZyb20g4oCYcnQyODAwX2NvbmZpZ19jaGFubmVs4oCZ
IGF0IC4uL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JhbGluay9ydDJ4MDAvcnQyODAwbGliLmM6NDAy
MjoyNToNCj4uLy4uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDozMDk6NDU6IGVycm9y
OiBjYWxsIHRvIOKAmF9fY29tcGlsZXRpbWVfYXNzZXJ0XzExNjjigJkgZGVjbGFyZWQgd2l0aCBh
dHRyaWJ1dGUgZXJyb3I6IGNsYW1wKCkgbG93IGxpbWl0IC03IGdyZWF0ZXIgdGhhbiBoaWdoIGxp
bWl0IDE1DQo+ICAgMzA5IHwgICAgICAgICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwg
bXNnLCBfX2NvbXBpbGV0aW1lX2Fzc2VydF8sIF9fQ09VTlRFUl9fKQ0KPiAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXg0KPi4vLi4vaW5jbHVkZS9s
aW51eC9jb21waWxlcl90eXBlcy5oOjI5MDoyNTogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNy
byDigJhfX2NvbXBpbGV0aW1lX2Fzc2VydOKAmQ0KPiAgIDI5MCB8ICAgICAgICAgICAgICAgICAg
ICAgICAgIHByZWZpeCAjIyBzdWZmaXgoKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwN
Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4NCj4uLy4uL2luY2x1ZGUv
bGludXgvY29tcGlsZXJfdHlwZXMuaDozMDk6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3Jv
IOKAmF9jb21waWxldGltZV9hc3NlcnTigJkNCj4gICAzMDkgfCAgICAgICAgIF9jb21waWxldGlt
ZV9hc3NlcnQoY29uZGl0aW9uLCBtc2csIF9fY29tcGlsZXRpbWVfYXNzZXJ0XywgX19DT1VOVEVS
X18pDQo+ICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+DQo+Li4vaW5jbHVkZS9s
aW51eC9idWlsZF9idWcuaDozOTozNzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGNv
bXBpbGV0aW1lX2Fzc2VydOKAmQ0KPiAgICAzOSB8ICNkZWZpbmUgQlVJTERfQlVHX09OX01TRyhj
b25kLCBtc2cpIGNvbXBpbGV0aW1lX2Fzc2VydCghKGNvbmQpLCBtc2cpDQo+ICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+DQo+Li4v
aW5jbHVkZS9saW51eC9taW5tYXguaDoxODg6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3Jv
IOKAmEJVSUxEX0JVR19PTl9NU0figJkNCj4gICAxODggfCAgICAgICAgIEJVSUxEX0JVR19PTl9N
U0coc3RhdGljYWxseV90cnVlKHVsbyA+IHVoaSksICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwNCj4gICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4NCj4uLi9pbmNsdWRlL2xpbnV4
L21pbm1heC5oOjE5NTo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX19jbGFtcF9v
bmNl4oCZDQo+ICAgMTk1IHwgICAgICAgICBfX2NsYW1wX29uY2UodHlwZSwgdmFsLCBsbywgaGks
IF9fVU5JUVVFX0lEKHZfKSwgX19VTklRVUVfSUQobF8pLCBfX1VOSVFVRV9JRChoXykpDQo+ICAg
ICAgIHwgICAgICAgICBefn5+fn5+fn5+fn4NCj4uLi9pbmNsdWRlL2xpbnV4L21pbm1heC5oOjIx
ODozNjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmF9fY2FyZWZ1bF9jbGFtcOKAmQ0K
PiAgIDIxOCB8ICNkZWZpbmUgY2xhbXBfdCh0eXBlLCB2YWwsIGxvLCBoaSkgX19jYXJlZnVsX2Ns
YW1wKHR5cGUsIHZhbCwgbG8sIGhpKQ0KPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+DQo+Li4vZHJpdmVycy9uZXQvd2lyZWxlc3MvcmFs
aW5rL3J0MngwMC9ydDI4MDBsaWIuYzozOTgwOjI0OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFj
cm8g4oCYY2xhbXBfdOKAmQ0KPiAgMzk4MCB8ICAgICAgICAgICAgICAgICByZXR1cm4gY2xhbXBf
dChjaGFyLCB0eHBvd2VyLCBNSU5fQV9UWFBPV0VSLCBNQVhfQV9UWFBPV0VSKTsNCj4gICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn4NCj4gSW4gZnVuY3Rpb24g4oCYcnQyODAw
X3R4cG93ZXJfdG9fZGV24oCZLA0KPiAgICAgaW5saW5lZCBmcm9tIOKAmHJ0MjgwMF9jb25maWdf
Y2hhbm5lbOKAmSBhdCAuLi9kcml2ZXJzL25ldC93aXJlbGVzcy9yYWxpbmsvcnQyeDAwL3J0Mjgw
MGxpYi5jOjQwMjQ6MjU6DQo+Li8uLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6MzA5
OjQ1OiBlcnJvcjogY2FsbCB0byDigJhfX2NvbXBpbGV0aW1lX2Fzc2VydF8xMTY44oCZIGRlY2xh
cmVkIHdpdGggYXR0cmlidXRlIGVycm9yOiBjbGFtcCgpIGxvdyBsaW1pdCAtNyBncmVhdGVyIHRo
YW4gaGlnaCBsaW1pdCAxNQ0KPiAgIDMwOSB8ICAgICAgICAgX2NvbXBpbGV0aW1lX2Fzc2VydChj
b25kaXRpb24sIG1zZywgX19jb21waWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJfXykNCj4gICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCj4uLy4u
L2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDoyOTA6MjU6IG5vdGU6IGluIGRlZmluaXRp
b24gb2YgbWFjcm8g4oCYX19jb21waWxldGltZV9hc3NlcnTigJkNCj4gICAyOTAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICBwcmVmaXggIyMgc3VmZml4KCk7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcDQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+DQo+Li8u
Li9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6MzA5Ojk6IG5vdGU6IGluIGV4cGFuc2lv
biBvZiBtYWNybyDigJhfY29tcGlsZXRpbWVfYXNzZXJ04oCZDQo+ICAgMzA5IHwgICAgICAgICBf
Y29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBpbGV0aW1lX2Fzc2VydF8s
IF9fQ09VTlRFUl9fKQ0KPiAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fg0KPi4u
L2luY2x1ZGUvbGludXgvYnVpbGRfYnVnLmg6Mzk6Mzc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBt
YWNybyDigJhjb21waWxldGltZV9hc3NlcnTigJkNCj4gICAgMzkgfCAjZGVmaW5lIEJVSUxEX0JV
R19PTl9NU0coY29uZCwgbXNnKSBjb21waWxldGltZV9hc3NlcnQoIShjb25kKSwgbXNnKQ0KPiAg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fg0KPi4uL2luY2x1ZGUvbGludXgvbWlubWF4Lmg6MTg4Ojk6IG5vdGU6IGluIGV4cGFuc2lv
biBvZiBtYWNybyDigJhCVUlMRF9CVUdfT05fTVNH4oCZDQo+ICAgMTg4IHwgICAgICAgICBCVUlM
RF9CVUdfT05fTVNHKHN0YXRpY2FsbHlfdHJ1ZSh1bG8gPiB1aGkpLCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcDQo+ICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+DQo+Li4vaW5j
bHVkZS9saW51eC9taW5tYXguaDoxOTU6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKA
mF9fY2xhbXBfb25jZeKAmQ0KPiAgIDE5NSB8ICAgICAgICAgX19jbGFtcF9vbmNlKHR5cGUsIHZh
bCwgbG8sIGhpLCBfX1VOSVFVRV9JRCh2XyksIF9fVU5JUVVFX0lEKGxfKSwgX19VTklRVUVfSUQo
aF8pKQ0KPiAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+DQo+Li4vaW5jbHVkZS9saW51eC9t
aW5tYXguaDoyMTg6MzY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX2NhcmVmdWxf
Y2xhbXDigJkNCj4gICAyMTggfCAjZGVmaW5lIGNsYW1wX3QodHlwZSwgdmFsLCBsbywgaGkpIF9f
Y2FyZWZ1bF9jbGFtcCh0eXBlLCB2YWwsIGxvLCBoaSkNCj4gICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fg0KPi4uL2RyaXZlcnMvbmV0L3dp
cmVsZXNzL3JhbGluay9ydDJ4MDAvcnQyODAwbGliLmM6Mzk4MDoyNDogbm90ZTogaW4gZXhwYW5z
aW9uIG9mIG1hY3JvIOKAmGNsYW1wX3TigJkNCj4gIDM5ODAgfCAgICAgICAgICAgICAgICAgcmV0
dXJuIGNsYW1wX3QoY2hhciwgdHhwb3dlciwgTUlOX0FfVFhQT1dFUiwgTUFYX0FfVFhQT1dFUik7
DQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+DQo+IEluIGZ1bmN0aW9u
IOKAmHJ0MjgwMF90eHBvd2VyX3RvX2RlduKAmSwNCj4gICAgIGlubGluZWQgZnJvbSDigJhydDI4
MDBfY29uZmlnX2NoYW5uZWzigJkgYXQgLi4vZHJpdmVycy9uZXQvd2lyZWxlc3MvcmFsaW5rL3J0
MngwMC9ydDI4MDBsaWIuYzo0MDI4OjQ6DQo+Li8uLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5
cGVzLmg6MzA5OjQ1OiBlcnJvcjogY2FsbCB0byDigJhfX2NvbXBpbGV0aW1lX2Fzc2VydF8xMTY4
4oCZIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlIGVycm9yOiBjbGFtcCgpIGxvdyBsaW1pdCAtNyBn
cmVhdGVyIHRoYW4gaGlnaCBsaW1pdCAxNQ0KPiAgIDMwOSB8ICAgICAgICAgX2NvbXBpbGV0aW1l
X2Fzc2VydChjb25kaXRpb24sIG1zZywgX19jb21waWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJf
XykNCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF4NCj4uLy4uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDoyOTA6MjU6IG5vdGU6IGlu
IGRlZmluaXRpb24gb2YgbWFjcm8g4oCYX19jb21waWxldGltZV9hc3NlcnTigJkNCj4gICAyOTAg
fCAgICAgICAgICAgICAgICAgICAgICAgICBwcmVmaXggIyMgc3VmZml4KCk7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+DQo+Li8uLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6MzA5Ojk6IG5vdGU6IGlu
IGV4cGFuc2lvbiBvZiBtYWNybyDigJhfY29tcGlsZXRpbWVfYXNzZXJ04oCZDQo+ICAgMzA5IHwg
ICAgICAgICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBpbGV0aW1l
X2Fzc2VydF8sIF9fQ09VTlRFUl9fKQ0KPiAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fn5+fg0KPi4uL2luY2x1ZGUvbGludXgvYnVpbGRfYnVnLmg6Mzk6Mzc6IG5vdGU6IGluIGV4cGFu
c2lvbiBvZiBtYWNybyDigJhjb21waWxldGltZV9hc3NlcnTigJkNCj4gICAgMzkgfCAjZGVmaW5l
IEJVSUxEX0JVR19PTl9NU0coY29uZCwgbXNnKSBjb21waWxldGltZV9hc3NlcnQoIShjb25kKSwg
bXNnKQ0KPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fn5+fg0KPi4uL2luY2x1ZGUvbGludXgvbWlubWF4Lmg6MTg4Ojk6IG5vdGU6IGlu
IGV4cGFuc2lvbiBvZiBtYWNybyDigJhCVUlMRF9CVUdfT05fTVNH4oCZDQo+ICAgMTg4IHwgICAg
ICAgICBCVUlMRF9CVUdfT05fTVNHKHN0YXRpY2FsbHlfdHJ1ZSh1bG8gPiB1aGkpLCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcDQo+ICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
DQo+Li4vaW5jbHVkZS9saW51eC9taW5tYXguaDoxOTU6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9m
IG1hY3JvIOKAmF9fY2xhbXBfb25jZeKAmQ0KPiAgIDE5NSB8ICAgICAgICAgX19jbGFtcF9vbmNl
KHR5cGUsIHZhbCwgbG8sIGhpLCBfX1VOSVFVRV9JRCh2XyksIF9fVU5JUVVFX0lEKGxfKSwgX19V
TklRVUVfSUQoaF8pKQ0KPiAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+DQo+Li4vaW5jbHVk
ZS9saW51eC9taW5tYXguaDoyMTg6MzY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhf
X2NhcmVmdWxfY2xhbXDigJkNCj4gICAyMTggfCAjZGVmaW5lIGNsYW1wX3QodHlwZSwgdmFsLCBs
bywgaGkpIF9fY2FyZWZ1bF9jbGFtcCh0eXBlLCB2YWwsIGxvLCBoaSkNCj4gICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fg0KPi4uL2RyaXZl
cnMvbmV0L3dpcmVsZXNzL3JhbGluay9ydDJ4MDAvcnQyODAwbGliLmM6Mzk4MDoyNDogbm90ZTog
aW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGNsYW1wX3TigJkNCj4gIDM5ODAgfCAgICAgICAgICAg
ICAgICAgcmV0dXJuIGNsYW1wX3QoY2hhciwgdHhwb3dlciwgTUlOX0FfVFhQT1dFUiwgTUFYX0Ff
VFhQT1dFUik7DQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+DQo+IG1h
a2VbNl06ICoqKiBbLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyODY6IGRyaXZlcnMvbmV0L3dp
cmVsZXNzL3JhbGluay9ydDJ4MDAvcnQyODAwbGliLm9dIEVycm9yIDENCj4gbWFrZVs1XTogKioq
IFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjUwMzogZHJpdmVycy9uZXQvd2lyZWxlc3MvcmFs
aW5rL3J0MngwMF0gRXJyb3IgMg0KPiBtYWtlWzRdOiAqKiogWy4uL3NjcmlwdHMvTWFrZWZpbGUu
YnVpbGQ6NTAzOiBkcml2ZXJzL25ldC93aXJlbGVzcy9yYWxpbmtdIEVycm9yIDINCj4gbWFrZVs0
XTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4NCg==
