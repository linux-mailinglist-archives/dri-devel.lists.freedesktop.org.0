Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32384BECA97
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 10:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B6510E3B2;
	Sat, 18 Oct 2025 08:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.b="IjNIezMb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com
 (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com
 [34.218.115.239])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E145210EBCB;
 Fri, 17 Oct 2025 12:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1760703392; x=1792239392;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gYDnavJxgHF2BtLIfegCkhALowUX2Q2vhSCtPw4pBrM=;
 b=IjNIezMb6XRPNgiscb20x7PWd9Bnon15/2W76a+lWlF4HJWgall4QiwZ
 sdA6/OhZlr0C0AvKQ733/U5xqe0n0z/9ANJLgkz98vIR7HFV0GycbxynO
 2XPDlxq3f29DTILXoRXp55joUxfiWdSsZ92JcAhIE9GryxgSuHvf5I7rY
 0rBr/H4k3wnPOKp8wmIREx4jIUliP0fEKcrlSeq1lLanBZQvaQ59Rznty
 qdSmQcXp80rwJ8WWcpwP5m4neW3j0z8fOw4JsqusbRK99UF9iPzMicdCL
 XBYFrH6A41o8ZRY71Vnm3Rbv5fb+AcMezCdi471Co6d7lyQESAM7i66AI g==;
X-CSE-ConnectionGUID: xk2V0bb5TGGEVvbYDEK81w==
X-CSE-MsgGUID: s7hY6NBYR+6Hk5G5Syn5xg==
X-IronPort-AV: E=Sophos;i="6.19,236,1754956800"; 
   d="scan'208";a="4891580"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO
 smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
 by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 12:16:30 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:1691]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.196:2525]
 with esmtp (Farcaster)
 id 257d7c5b-5790-4a99-ae2b-36fb774eccc3; Fri, 17 Oct 2025 12:16:30 +0000 (UTC)
X-Farcaster-Flow-ID: 257d7c5b-5790-4a99-ae2b-36fb774eccc3
Received: from EX19EXOUWA001.ant.amazon.com (10.250.64.209) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 17 Oct 2025 12:16:29 +0000
Received: from EX19EXOUWB001.ant.amazon.com (10.250.64.229) by
 EX19EXOUWA001.ant.amazon.com (10.250.64.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 17 Oct 2025 12:16:29 +0000
Received: from PH0PR07CU006.outbound.protection.outlook.com (10.250.64.206) by
 EX19EXOUWB001.ant.amazon.com (10.250.64.229) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20
 via Frontend Transport; Fri, 17 Oct 2025 12:16:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbwhkxny5R8fdLaKd/VtBFCpv4FItEDUGYYw83CT1YGw7QS88We0f+dOIyqI1vxzcd48TsaDprHGplgQ9K/ukiQjy2PXZ1UkGuCWbx5uj9QVcNQLp5S6CDeTadIePUaKzTWOfYcXfcChz4nUV56O9W1AzXmxGwz5Vk8m99Wt0NbIsFqkhANLSbPKxGiS9X887Xg8sLTAaVy0TPdGrTnGGIBkUe1KqPPJQHnJAjOuqLZVhSdkb9FzFMrOWQTNdHTPEZ7U1Xc7YxVHbLUQpPF+NIIDp9VwIYS1hXMM3Dkfxf3AXXCXU7sV5hb4pS9q9TzxTN3YJJfvewzcI0xsWr/vfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYDnavJxgHF2BtLIfegCkhALowUX2Q2vhSCtPw4pBrM=;
 b=e7y4PgWP8o/nTyV48Cp+sg3y1/2H63nTYam4EgYbJ9GRKUXQaBua6WVzXd6hnP/jVLtw4SawnwUWxVsLK3jpYII1I+vcI5yvrpDrONpTJgn1JIXZaUMZ/LuoY7bRRdsKDi3K0+Hly7DM7v9D/iTZjaLM/W8bgg4TjX/uUgsrmmHnV9WZI0Cawc823IzzqGE8dEq7xThLIN/9O5zBjpbfm5JoIIUmhvgqMbswFKmJBEbfy8rwjcVsUdf2MJ2K3Fprd6V5EUO5L7tJYy0fqcZugMuT3EDLwJCek0EBE6aPwpIqmaiaN39AdYw3drLSFB88Rd0PmZ3FEyFVsfW8IHP39w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from CH0PR18MB5433.namprd18.prod.outlook.com (2603:10b6:610:181::16)
 by SJ0PR18MB3898.namprd18.prod.outlook.com (2603:10b6:a03:2e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 12:16:27 +0000
Received: from CH0PR18MB5433.namprd18.prod.outlook.com
 ([fe80::1423:ab6b:11cc:7b0]) by CH0PR18MB5433.namprd18.prod.outlook.com
 ([fe80::1423:ab6b:11cc:7b0%7]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 12:16:27 +0000
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
 <tipc-discussion@lists.sourceforge.net>, Arnd Bergmann <arnd@arndb.de>, "Dan
 Williams" <dan.j.williams@intel.com>, Eric Dumazet <edumazet@google.com>,
 Isabella Basso <isabbasso@riseup.net>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Sander Vanheule
 <sander@svanheule.net>, Vlastimil Babka <vbabka@suse.cz>, Yury Norov
 <yury.norov@gmail.com>
Subject: RE: [PATCH v2 01/27 5.10.y] overflow, tracing: Define the
 is_signed_type() macro once
Thread-Topic: [PATCH v2 01/27 5.10.y] overflow, tracing: Define the
 is_signed_type() macro once
Thread-Index: AQHcP1/cJJbWkEozCEifWbQxPnjh1Q==
Date: Fri, 17 Oct 2025 12:16:27 +0000
Message-ID: <CH0PR18MB54337BD648C23CBE40C1060CC6F6A@CH0PR18MB5433.namprd18.prod.outlook.com>
References: <20251017090519.46992-1-farbere@amazon.com>
 <20251017090519.46992-2-farbere@amazon.com>
 <2025101708-obtuse-ellipse-e355@gregkh>
In-Reply-To: <2025101708-obtuse-ellipse-e355@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR18MB5433:EE_|SJ0PR18MB3898:EE_
x-ms-office365-filtering-correlation-id: d2272b9f-112f-46df-aed1-08de0d76ff4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?oH/lX6LqDPomk/HqyEBHvVh+yzsjtGo9hP4/6Jrv9HjvkWW+/Cw94zLGUlq+?=
 =?us-ascii?Q?WXEbxqDHRuXFrAfy15DECKN4MaBm6jI/AENOLxYizRuFg8EoKKUfQ/TO9tlP?=
 =?us-ascii?Q?ascSWkQ3fHQqjojnu7uhejFQc3h0LSF98BHo6l/LPvbQImfuECjNiMP/rKYi?=
 =?us-ascii?Q?bKY8edVhiZB2utV8Kix18D5LcRj8hHcp9KvX6JzO7PBKw+rcy+tp07Yco0WU?=
 =?us-ascii?Q?B7YKutFmS9oW35V7QUsxpH2GtlrACZzgbt9vPp4hi7L+WJNfQWn1+vrqLzNH?=
 =?us-ascii?Q?gQu9TxvBfQHCvZwOdYTHK7R4apLvBEIwGQ2w0ZtobEolS2PUaEsL7bPLzNY5?=
 =?us-ascii?Q?c9lftgwng+x2YwsuHnKFPlChTZWQvFRJstgD20qvO3tXbaHlJQ1XmgiVbYAV?=
 =?us-ascii?Q?PWxHF7KCfxptWQJIczRE1LS2xxtqwM7HvcV2bgT4fUG9ycZyK2X5UffIETcD?=
 =?us-ascii?Q?kQu7jmM8ppf4wfULJXrNy2SL2MjzuL7ncX30Sa1dzWB8/eHRGVGuVemfedVe?=
 =?us-ascii?Q?0ylz3AA46fkT31HNbSfxvL9p2mRkfOvt+XQdbVeXsFGlJc9MKw8dCsh0P/JR?=
 =?us-ascii?Q?QeWm73yiV/OmuEPURqXvGh7mkatKvbTXvUh2fHhU8PkwyA1oFaSF3q87FPUG?=
 =?us-ascii?Q?P0PaVH7Hb0CtrWnxdsu2p4Y9+GhX08KlLa/ayz0GLBDRKRfCQOm5D6FJI5kW?=
 =?us-ascii?Q?pF7t8QIPzRFsV3AOcHKxAsgO9kSz3QaermZXFrG61CwnWwpyXCBrz3uD6f8Y?=
 =?us-ascii?Q?M4zUcf035ipqPXEX6pjtn1Rkvqvnji/xWBKsx9+GpMPD9iLyOTvMjjw5bmFR?=
 =?us-ascii?Q?iMMLQ9nTGE0fw72wZ6k/h56MT2ZTkIdOmutKPdiVqwpXum2Y0JHzrovZF/f0?=
 =?us-ascii?Q?+AXk+iLmY22bM9c45oq/wKiqdqfh2DLS6gKYtNikrI2ZZAptnSl+K44PS09e?=
 =?us-ascii?Q?yO9hjd0Yq06hjmmo0EIyvcB9+I5wWEcpdBpAK4yH5v2GEr1XwpN8F0bR17oX?=
 =?us-ascii?Q?bhqd+xynobSgtGtbvBNBtenBlyM1/xRnsfHrPgQQLh+lVdXlwxG/LPNNG+LM?=
 =?us-ascii?Q?QdU6nsqnJvaRnlkE1Y04Oi/6YDEdcnDN3Pacv/ojVWZBXQ39f93cJ9MyYTFN?=
 =?us-ascii?Q?IpkLbAt+Yq+emScZEehGhGe+C/9gWoI0zKQBthrcZkiWNm0cSJnjg6qKe4Vs?=
 =?us-ascii?Q?aBQ6iXiEYxqvoOuQ5noDHzRIEZgbuj4b6bE6UeXSx4/WnVl/wPZ5kO04A3Ez?=
 =?us-ascii?Q?cgjGZJ0ryDcI+b5XXhO3yqQ465fHhjQaaB9796rQSyhcQaNOuhpSYCFRKYJO?=
 =?us-ascii?Q?ovwD33+FC5KiEekhb7c7OAhI6gLEFY5SiulAvfXQGKICSY+lujz90x1pbNkw?=
 =?us-ascii?Q?i1MOM+ZEI+oUaqX6bs70awvDBgSZVCbFWFiNmlsQQTOo8kNVAa7cAi8TLnN0?=
 =?us-ascii?Q?PpbXd99+RuaSNFedrephLqmAyFcQf99DewCmZF4n0SbyyfYzwl0UDx3r0ks/?=
 =?us-ascii?Q?8VRWCFBuNR70vYhOn1jVggu6pJCcWqwa+aRPam+H+hgGk9iPdFzEs4YXOg?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR18MB5433.namprd18.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2zWhqfqzxCe5eoq47fdxbmsimpshmvLNqwawP56Ucuc1Qibdfysb3A8mGU5S?=
 =?us-ascii?Q?y4i2Ss1cnYpE51JvwhzSlzEz6r29K2K6BafFiizKoMBYXim8L9LUr9NJiQUR?=
 =?us-ascii?Q?tZWATgYUG2LxG2xUn57BmF6o7cWGdtNNPnf3pGG9gw6Dzyv9nzUqNm5HL+0F?=
 =?us-ascii?Q?thXqbLJxmaLy/sg504YeXDqSwmAudkovXc+jy9iANUCvRTFuqjfRU7thZKHw?=
 =?us-ascii?Q?dSa/lCNymR2vcvO/4g0xvUusQGFuIEanQh+cPqAlGtzIgcaHNBBufDIXu8gF?=
 =?us-ascii?Q?tZXjI41HOKsRDSRxjGj1GRMv6d4ogaiEJ4CUZA0+4iH+jKNe4R+wNwZkY0eA?=
 =?us-ascii?Q?6doVAg9Io4YsoaCE95D9GCK4rCvh0WWf7RXSxIFZVNkjcM1qV2fpxdpOkUDT?=
 =?us-ascii?Q?aFlk50SEHiEtH8/FJRhFbdNY0ZVJuvmkBib1V2iUUuPbtm6svbF2WefX/oyf?=
 =?us-ascii?Q?G6OHPIZi7icoH83Cf4AyIZt8sIEK9+tkH5DSt+SlSb4zfcaZjlBhlCtrnDTD?=
 =?us-ascii?Q?8rAjIpuC6j62kHX0lE/ApoH/XcBFgaXb4PO7TwoIACCgMOYcFOhfetiakVen?=
 =?us-ascii?Q?wQ7ujDCtkpo8q05EqUy3dmQ7IHp2rb31GZ5tbsIwLgDdc4pe92ovL7f99TJz?=
 =?us-ascii?Q?Qvj00h5Jpr9v9ye760tPCc7c6/iF2p54QJDNxIIxokGa+TR5hW8+X7+x7w+e?=
 =?us-ascii?Q?XJrJmQJT/U0yFrjPZUOSk4B0IJEHDvk2dQrjAca+n4V9+C8XDq/xtwo9doIi?=
 =?us-ascii?Q?HtfgEXnWII8zUHWMFwfxVwxRly74kNBkq0MvuRXll6ufr0XNP3s1qw0rK0GC?=
 =?us-ascii?Q?3dDA/hA9PcZF12UcClbpU1eWA88m00WWNeQGnNKNjzBjvlYYINBSGNPwj9Kh?=
 =?us-ascii?Q?eOmSW7WmGTprnV16AZzA+hZXfpWv6P//2zcdaiDcrz0YMU8Wmnx0QtETH8XI?=
 =?us-ascii?Q?PKTm1GhK4y+yS44FPlgAL0/alULYDMJp6oVjXPtvuvB4W1fwM3jQGhIbeFyK?=
 =?us-ascii?Q?PkaqZMERQ0TR2Thc8aQOvG3YaSVLIu7qLCIAAfkzMheszcUkqrWD9kLQi7cz?=
 =?us-ascii?Q?ql0MSBPpNykuAMiSjpC6WJisQcScptp0YewoVtWrkvkvk6fK9k5eL1QSyDLh?=
 =?us-ascii?Q?MP64r9Ri1FzO7Eb/Sxrt893yrgGX6nyYQH/1v/uwTyEv/WXiYo419IHYysQe?=
 =?us-ascii?Q?GNY8apfrczf/AasDOzPhS4MbB4oVUJLZVtGwUT7L9mhYqmdPPjgzjpz+36Vs?=
 =?us-ascii?Q?/W7USOXU9GiZQ0jR7e0rPPZBp841ldBEkZeRyFDCXHWMCzGqV5Hm/+9W27b0?=
 =?us-ascii?Q?wVAtL+F6aa/PEVGNFDEbklQusrqFLaVTmijzdXufvnC/bvZeAzaaee6l74fu?=
 =?us-ascii?Q?jDa59Cfj6hGXGHPR3961DD51Az+PL/KRYptIRBnTtEJPYK3brWViToqz8QW+?=
 =?us-ascii?Q?bfpxyVLTi+rK2N5UiYH3XM8LxTpQhKukDcPZGYBLbjKkARks09VTTJhUUV/+?=
 =?us-ascii?Q?1X01j8icWASygDmTgvlNdEQ2Qfx4nIQze4VnvUuU5LTynDL+BJ9rW2ZQZfJ5?=
 =?us-ascii?Q?OQbktRJIGxKTNGVwvGQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR18MB5433.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2272b9f-112f-46df-aed1-08de0d76ff4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 12:16:27.3648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dlwakfkWPrCmyP4L3IyDhJEw/yKNGU9QXvfsoNPKhTM6UNmbIhyzw+PR2eLVNiKu9ws6u8cCmvnwkBI8/yMn8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB3898
X-OriginatorOrg: amazon.com
X-Mailman-Approved-At: Sat, 18 Oct 2025 08:38:36 +0000
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

> On Fri, Oct 17, 2025 at 09:04:53AM +0000, Eliav Farber wrote:
> > From: Bart Van Assche <bvanassche@acm.org>
> >
> > [ Upstream commit 92d23c6e94157739b997cacce151586a0d07bb8a ]
>
> This isn't in 5.15.y, why is it needed in 5.10.y?

This is the mainline commit:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/i=
nclude/linux/overflow.h?h=3Dv6.18-rc1&id=3D92d23c6e94157739b997cacce151586a=
0d07bb8a

The commit hash is 92d23c6e94157739b997cacce151586a0d07bb8a, which is
the one I used for the backport.

And here is the corresponding commit in the 5.15.y branch:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/inc=
lude/linux/overflow.h?h=3Dv5.15.194&id=3Ded6e37e30826b12572636c6bbfe6319233=
690c90
However, the commit message there references a different hash:
a49a64b5bf195381c09202c524f0f84b5f3e816f.

---
Regards, Eliav
