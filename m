Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5981DC49A4A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 23:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C45010E307;
	Mon, 10 Nov 2025 22:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="hXtrP2J9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA5C10E2E6;
 Mon, 10 Nov 2025 19:13:46 +0000 (UTC)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AACwu1b003304;
 Mon, 10 Nov 2025 19:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pp1; bh=bUT5Wbhsonz65SEe4kWodwGb/bDSa4dVmlBXYl7emxw=; b=hXtrP2J9
 ha4JJA6gbyCJlm+FQYls9VZZtpbdnL1gPExARsb32Xo9mxcHxy7XN+2blxwsAwtg
 VRL8Lqcvnt6liuID/dz0AJ5daEPUJW9a5OrSBk5YpIRzL4uNr2fL6EEXpbtV9X9S
 q49vt1YEFGAphWDMZKIvxDsx2p5icZhjYMuntrmiRoOMqO9uasvoBniWMZnzB6F9
 qCO+6SdfHxRPQ02mKhnLEXh/nLNcqObDuuOsIZTOBQ8HTxjqSMX78jtsByNyJZwt
 mL7g4w3dgoN7whlHqNLIPBSnFfSThmd51qYZioduykjT72yimnUm3IRwb5rOnkN6
 YgMOTXk+FdGEGQ==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wgwrrxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Nov 2025 19:13:32 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AAJ7l2w023867;
 Mon, 10 Nov 2025 19:13:31 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012035.outbound.protection.outlook.com
 [40.93.195.35])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wgwrrx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Nov 2025 19:13:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIvgMIoIszOxo4FO7RyKJ7+R6Mq+PRAgY8RNtznMqerWFanQbGrfyJ1nApR+lS0rpE4WDaQdjyLFj8AYsvqN889m7mnAeQaLi4Af9xh4TVk+aJJTVYL5DaEVtLShUf5kmU7lX3c8HnlmCJHheZRjQTfqRfXS45WGObFXLAYUiFzQ4LAEqiSJob4ALWv1R5+2uNn7gWvc0Tbyjldrk9oMVvyUuFmHiPDd7gk69N6CycaAMW8TB4s2THqGNKxjd6L9PwBtgVdwxgWlNz1ZtyTq7eqQ4xWvzSALkj63x+42Vij1vSvv2p17BTSOFt8BxQ+RD+A7JQl7aDU2t0QpxwJVQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUT5Wbhsonz65SEe4kWodwGb/bDSa4dVmlBXYl7emxw=;
 b=wLkpN6wbobPDyZcOwoQB5ptHjdVslMhBSO0gHwZ3aVfFGHEFmRzg44Dnug4ldHfDw+ElvsSwY7zGUH7O5TOKTyssKmjUjoH7Yh7STFjMQOUxkQPZ+G5vKd1SrxcXA9tD/8aGxiUBXozGzKUd94IdDS6sDsBVePueBJFXzce7mTZDgu+2MztDw/tMe82fO6dD4P0wBrnTWA1rk9Su79yrLP8Tf4rq3JNpPhNZEb7pwIOGmLQ9A63QzSBJ/dIGk11gdhjKcpkPBcJXx6T1VbwMxupi5FgBVC5JvnQn/aBLxwIUVpzV4YH40xoaoWFFiVLLSH9qmrKrv8R2O8l2LleZhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SA1PR15MB5819.namprd15.prod.outlook.com (2603:10b6:806:338::8)
 by CO1PR15MB5036.namprd15.prod.outlook.com (2603:10b6:303:eb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 19:13:27 +0000
Received: from SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539]) by SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 19:13:27 +0000
From: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
To: "casey@schaufler-ca.com" <casey@schaufler-ca.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "mani@kernel.org" <mani@kernel.org>, "pmladek@suse.com" <pmladek@suse.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
 "vitaly.lifshits@intel.com" <vitaly.lifshits@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "max.kellermann@ionos.com" <max.kellermann@ionos.com>,
 "kartilak@cisco.com" <kartilak@cisco.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "corey@minyard.net" <corey@minyard.net>, "hverkuil@kernel.org"
 <hverkuil@kernel.org>, "calvin@wbinvd.org" <calvin@wbinvd.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, "linux@treblig.org"
 <linux@treblig.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "matthew.brost@intel.com"
 <matthew.brost@intel.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>,
 "maimon.sagi@gmail.com" <maimon.sagi@gmail.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "tiwai@suse.de" <tiwai@suse.de>, "cassel@kernel.org" <cassel@kernel.org>,
 "robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
CC: "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "jonathan.lemon@gmail.com" <jonathan.lemon@gmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "lumag@kernel.org"
 <lumag@kernel.org>, "andrew@lunn.ch" <andrew@lunn.ch>, "olteanv@gmail.com"
 <olteanv@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "przemyslaw.kitszel@intel.com" <przemyslaw.kitszel@intel.com>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>, "mripard@kernel.org"
 <mripard@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "hca@linux.ibm.com"
 <hca@linux.ibm.com>, "hoeppner@linux.ibm.com" <hoeppner@linux.ibm.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "anthony.l.nguyen@intel.com"
 <anthony.l.nguyen@intel.com>, "mathieu.desnoyers@efficios.com"
 <mathieu.desnoyers@efficios.com>,
 "satishkh@cisco.com" <satishkh@cisco.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "giometti@enneenne.com" <giometti@enneenne.com>,
 "gustavo@padovan.org" <gustavo@padovan.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "vadim.fedorenko@linux.dev"
 <vadim.fedorenko@linux.dev>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "lucas.demarchi@intel.com"
 <lucas.demarchi@intel.com>, "rodrigo.vivi@intel.com"
 <rodrigo.vivi@intel.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "jesszhan0024@gmail.com" <jesszhan0024@gmail.com>, "sean@poorly.run"
 <sean@poorly.run>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "kishon@kernel.org" <kishon@kernel.org>, "konradybcio@kernel.org"
 <konradybcio@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
 "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "gor@linux.ibm.com"
 <gor@linux.ibm.com>, "edumazet@google.com" <edumazet@google.com>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>, "sebaddel@cisco.com"
 <sebaddel@cisco.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "idryomov@gmail.com" <idryomov@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "abhinav.kumar@linux.dev" <abhinav.kumar@linux.dev>,
 "richardcochran@gmail.com" <richardcochran@gmail.com>, "sth@linux.ibm.com"
 <sth@linux.ibm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
 Xiubo Li <xiubli@redhat.com>, "perex@perex.cz" <perex@perex.cz>
Thread-Topic: [EXTERNAL] [PATCH v1 04/23] libceph: Switch to use %ptSp
Thread-Index: AQHcUnLtHkrO2yTLekidutjpf1fZFrTsR0gA
Date: Mon, 10 Nov 2025 19:13:27 +0000
Message-ID: <3c165812702df97243710e1978a816157c697d9e.camel@ibm.com>
References: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
 <20251110184727.666591-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20251110184727.666591-5-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5819:EE_|CO1PR15MB5036:EE_
x-ms-office365-filtering-correlation-id: 24f16261-d306-4d87-ba15-08de208d3a29
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?M0dPZDBHc29PL3ZIczQ5b29FUE9zQzAvSUI2Mk5Lc05ZQ2h4b2Q5M0hHdTJR?=
 =?utf-8?B?bFRJTG5kYXJmU3RzWjRsL1lCNDFEZks5Wk0yNmtOVzNnM2YxaGZrSitWY1Rp?=
 =?utf-8?B?M2VmbTQzeFBPUkY3T2cxQnBMYWFFbGtnUkJQQlNlajhsSHBwTERweWNDU0Qz?=
 =?utf-8?B?K3JDbGh4WUErUC9KV0JIcTk2OU5PRDJ6eElhS2ovK01oSm8ybkhQWUR0cGF4?=
 =?utf-8?B?UzFqamMvZkQzV1BCdEVKUExIRXJUUVM0SzFXWmtOR3dRL0FLVVlIRG5rUFor?=
 =?utf-8?B?MUFXREFJOHN1OHVCaHdRMlF2Njk1WkhFeUhUWlVCUjBEM2k3UGpsaEJaVkN5?=
 =?utf-8?B?NmRZZXhhNjdFTHZyNjIweEZOQUZvRFZBbnBCTW94cW1jcVBJUFFQZVdBMElk?=
 =?utf-8?B?ZjdsbGNOd2c3U2ExWUFqcmJlQmxyWER4QU01clBFY1lWdUdRT1FmNGRFVnpZ?=
 =?utf-8?B?bG92cCs4cUpuMnpLN0NGMlNHOEhXbk40bWk0OVUzbHVwODNtQmxtU29pZ053?=
 =?utf-8?B?RTVvOGE3V29XU1ZFdkVLcHVETlhFTWNuN21uLy9XSi9NMHJSdDZBVHU3aGNk?=
 =?utf-8?B?K1hrcy94OFZOTUdsSEgrczRPeGY2RGFTaW15U0ZoUzlHUm9TNDMzVThiSFd2?=
 =?utf-8?B?RTUxanRKSkoxZ21PdEhCN25xNG5ITm92dU85SE02VmFyTGIwaEJERzhrR0FL?=
 =?utf-8?B?OWJLc20yK3N4ZjcvOUVFemdqNk1CejljUXhTZzlYZFVzeXhoWkJsSkpWcTVy?=
 =?utf-8?B?c00zcFhham10SUROLzJWSlgySFBLTHZaNHZlcDlvdnU3U3VvN2RnZE1CRmJK?=
 =?utf-8?B?WDd3eE9DUEJXc1VySmowSHYxbE1mQUFGWGxjQmtSUUloRHZLTC9pSk43TDcx?=
 =?utf-8?B?RG9PdURqZlRkZWR4MS9CSDFqQmdOQVNxdDBNbWZxM0RIQ2FGVVl1aU1VQUMy?=
 =?utf-8?B?Yys3NzVoc3BIVys3Wk00QUlqaWdQd3RlUDJ4VDF1U0F1ckxKcFY5SjBjL0l4?=
 =?utf-8?B?bkZFOWYvZ1JEdUtOa0xuRCtPR3NqQm9NWkI1M3VjS2k5TkxpMUttSTd3VnJP?=
 =?utf-8?B?cjEzOXhhR0wycmxGR0I4WXZLcEVkTHFSMndiTGFqeFVCYTQ0bCtZU3lLUm5r?=
 =?utf-8?B?b0VJeW1rQ1FSRHIvNVJkR3FSWFRVVXZ2SDN5OTB1czhLVXFueks0Mlk0bzJv?=
 =?utf-8?B?eHNsZzJDZUVEWWdQd1NQTE90dWc4NU9Bb0ZTRnFkMVdjQ2NCbjlhYVRubjI5?=
 =?utf-8?B?Q2hlZE1BSkZSUHl4SUhKc0tUNGM3WENLV0VSakZ5dkt3M3dLZmVpTnpOb28z?=
 =?utf-8?B?SnpScEpnd0FnVHppMkJmbHNJSWp4a1EyeWxOTGIyMGJ4V0lhS3laWTN4VkFy?=
 =?utf-8?B?N1hhNEFkVG1kNXoyTEZuQ2ZDQTZvUEwzb1R0bFRLNHIzUXEyb1pEMmRlOWFI?=
 =?utf-8?B?blM3b3N2cVpzdm5IUWk1WHk1MXZtWkUzcnI5dC9uRDFNd0RDVW0yNWxaaVBT?=
 =?utf-8?B?cDJqRVB6QytkaWF0eExjK2ZUWW5ZVVF1UDBaUVhETDBSdlJmSzgzLzdZaEpz?=
 =?utf-8?B?STJnbUN1ZENKaTRodTRwbDdCK0FRMC9yQWJPa0pZYnZra2NSdXFtNm1DN2s4?=
 =?utf-8?B?OFJQVzdvTGEvdnVxVWR5NUc1UHE4N1o2cGx0SkVTOHY0SUcyUkUydktySkMx?=
 =?utf-8?B?MUxIU2ErSFNON1NaSkdrcUJTcjIvcGRGNjF2M2dtTzFVa2JaTWVJMVYvbmk5?=
 =?utf-8?B?SlQ3RXhiUzYwaExUdlVEZk93SENJeHMwcHhBemRPSU0wQ1V3U3ZJRFV5Njdw?=
 =?utf-8?B?RGpUZCtPalUrN3R2ejE2MGR6OFNHekV5UEpsQTRCQ2xwUlNxOE83eGg4eW1U?=
 =?utf-8?B?c0NIaHAxeTQ1aXpuOHo4WWJ6cHRIU0MwcTFmc2dzc3NHVDhyYWh1UTYvanR1?=
 =?utf-8?B?SGFIaWlGenBlRUhYVjJ3Y0dtODdDSUhqcG1jN2g4dGdONzE2MHEySkdMV0Fz?=
 =?utf-8?B?NTl2Q0dvWU1tY2NpVkhwaUhjS1N0ZTFZc2dKcEF6ZnVIV0NUSmx0RjhtME94?=
 =?utf-8?B?YjhRRzBIenFxNzdlWC9nVCtHRUdkUy9GUDEyUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5819.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2I0ZFh6Y00wMFlDWFpDWHFhbkFCOGhFK1BWOVhKSG8wUmROcURuVWZRQWRz?=
 =?utf-8?B?OHlvVlpadTdpajNXd3R2RW9iNUpCcmpsVGhBN2xzcFRBbXVpWXhNaHFaT3Ft?=
 =?utf-8?B?YjI3NzZ0Z0xtR3RXZkVYbytuVXdLckNjaFh6eDgyaDVyOE1oSlQ5ZzhpL09N?=
 =?utf-8?B?NVlwaHNuZWxpQW8yQkpRU0ZMVmt1OXRYR0pCd2YwdHF3N2VzTnNSb082d200?=
 =?utf-8?B?UVp3KzNEZGUrQUlhM0RtZ3BDM255ZFVmeXBocEI2a2JJVm5WYzg3ZTZrM1l6?=
 =?utf-8?B?VWZzWjFyNSs3T3dkV29yOHhQQVdibUdMaTdMWUI3SVZ5bmsyQ2RFZUh4eEoz?=
 =?utf-8?B?cWpycm1BM0pGZ3JVRlBWaUdISTlqM1hLSSsvRGUyVXMxb0RNcEhiU2IreEZp?=
 =?utf-8?B?SkRYSVZ5cWx2eldXUHNiZC9uMUUvOWZjeGpHSHcrUVpWSUEwNHk5eWxxbDg1?=
 =?utf-8?B?ZlIwNHptUCtOTitaNTZ1ZnNLOWVWbVFtQ2FZWE9LdUFqeml6eFlTd3lLQlgz?=
 =?utf-8?B?bm45VzN3amJDdCtOVHdnUFIrMDFZTEd5MFBhcWhYVm1LcE9NbGxoMk9aVmMw?=
 =?utf-8?B?bk9zNkF4NFNielFLWElUdXF2YllTVzJrR3duYXA5dTJtU3RObkVrQTVxd3lr?=
 =?utf-8?B?TXFvWFdPMHNaM2tOb1RMSGhQbXdsQldQbW93UnBBckVQSGZYb1puWHFKMDRV?=
 =?utf-8?B?NEQrNzBnU2VpZERPM3JoMTd6djhYMWJLenpYaUZjV1F0TnNmcWZ1T093cVVM?=
 =?utf-8?B?K2txY202dVlFSVltNGZNSXNzUWxHbU9hSmVOeGcxTDZyOTQ2R2dVeHdyM2Nx?=
 =?utf-8?B?aHcxejlCZTI5MjdjVWREcDcrVWxWZUZwRGVRbnM5Y1lKRFNYU0tPR0hrN29T?=
 =?utf-8?B?WlRjQVZGRk12aWlpdkEzYmxEZ0Z3R3JzUUY5cDRzYmt4ZDJvSHRIcFcvNGpt?=
 =?utf-8?B?S3NSWUVNdWE4NjVZWTJkeGZiMXRPNFRVN1gxWjgzN0lsa2hHUmZ2THU5UWtF?=
 =?utf-8?B?b05CbDlCNTFRQTRwU2szempBdlZvVUVtaTMyOUJheTdsMkdpcG8vVmFNbkta?=
 =?utf-8?B?OVJSeGIrRElYMlA2U1ZTQmNZdHFEZk84QzE1SXJQdFpxaTE3d25kc1VLODQ1?=
 =?utf-8?B?UGpvM21GMGhmWlF1T2RIb0VDWWhBakgxN1l2OTQrL0czV1Q0dWFoZzZKS1Vn?=
 =?utf-8?B?ZzliaEx1czBHNXg3cmRnbVVRNHJiNDZ2Ujd4YWpsdkhXQ2pMRWZkSk53Y29B?=
 =?utf-8?B?TWkvQlNuSkRmZllzZVBoWGxFYWFBWnZRVUdrQU1vUEp4SXdSdzBoaVlYRDcy?=
 =?utf-8?B?TEdJWHh2ZUlJNCsvNjk4WC9LbWpON1RGc3dOR0oydUYxRnlmRmd0VmlKL2tn?=
 =?utf-8?B?ejFwVHYwdG9oVndDZ1Q1ZDJtODJNYUhRUGQvRFdXd1M5bzJSOE05SjN6cGlB?=
 =?utf-8?B?VHRuOHNGc2VtNVpBTUc3YnM5MVMrQS9uL0lValZQZkttRnV2c1VBR0VtNWIy?=
 =?utf-8?B?VXc0K1FwcEJVbGxpM3RqNEtiNGN6Z1dmUWlwOTVpZU4xTnpOVnBFVjYrVGN5?=
 =?utf-8?B?SkhhQzgzZExrNm9naXJ4WTNhRzdteHY1Zm5zWGp5bzUzRUw1ZlNUblVCSnlC?=
 =?utf-8?B?bEZLOEdTU09kR09XYUxTcVdVVEs3Z1VweUpsYldBc24zeVFJZWpjNUE1cEta?=
 =?utf-8?B?UGM3T3pUWk1pSlFKS0JaZFc5TU9PVXFOTzUyNlpRTFFVakVoOVBZNWtMZ3JL?=
 =?utf-8?B?dGRvRFBKQWtjSnVZbGJNR0MxSHJHR3g3SFBqNUc5UkE3c2ZUbHBXU0RmUU1l?=
 =?utf-8?B?YU8vejZUMjlaY28vWGd1MjBuOE1VTGZRQS9OeG5DNUJ2UGlJeUlyTnVKaHJz?=
 =?utf-8?B?RTlPcFIrQUVCU2c3TC9NeVJyRWsvRllSN05neXp3V3RhYWZYajI3T2tFTFYx?=
 =?utf-8?B?SWdQVzF0UW50QkxxakJYQzNTTitLa0tlMk9TUGJRdk95UHJNdDRjVytMTkFk?=
 =?utf-8?B?TWRCYUl1YWNaMFdURDNIQ3A0b3JSZkJqY3NtNmJsTjNjV3VHOUhoeExDWWVD?=
 =?utf-8?B?VnFoQ2RXZ1ltWDZUbXpiNm1KOU1Mc3V4N1luRzhuRlJ0RTBhMEtuT3BNSVp3?=
 =?utf-8?B?UVJYdXVlNk1NR3VGQzNvUlpMYlQyd0tKUEkvbDkvNVQya2NIOTJyY0FFNEVN?=
 =?utf-8?Q?DsMA+NgWV4S7mPAyIcuNHsI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B73AF28371FA74998D92D64D27A7D0D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5819.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f16261-d306-4d87-ba15-08de208d3a29
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 19:13:27.1241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bU6Y9Ev3N0Ec1shWN6UbaRYKPeMfczb7khvbG139uFnQ/51uPGzDUPuWCF7AqEZsSVsVIDZFRao4wCqj5MvZwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR15MB5036
X-Proofpoint-GUID: TpNN1XGfu5CWV6iBKnpiRDBohMP0e96H
X-Proofpoint-ORIG-GUID: 5rsYCdOfY2Rda0i0F7OauwO9UY6m6Ob-
X-Authority-Analysis: v=2.4 cv=VMPQXtPX c=1 sm=1 tr=0 ts=6912395c cx=c_pps
 a=SAua1AGvvEPKktuR1BOyGQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=DwwgDeOaxWrThdMh4TgA:9 a=QEXdDO2ut3YA:10 a=UhEZJTgQB8St2RibIkdl:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=QOGEsqRv6VhmHaoFNykA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAyMiBTYWx0ZWRfXxWnglRHlettl
 PljuGY21eXoXS7/GjmE/8m2JwOlufCh0QlSyepwPL1xd2+wHlp5gRin7hs72LVaJ9x0V7HR/t2z
 GsrzAr+HMK0n93SuFwha4f9UAh9y9SpJq+ilRxXreLSYwFVjMdEUIx4EZvow1FlceAOiJizmGOr
 PfVE1CpPUmvXF/I+g62nWd2Awp2yajLpbBXLlXouxKKWrvB9m5GBhD3OxdKtZkRRXcsY5NxJaII
 qHnKOmEW4cb7VY1E0Mps4nbHjy0KRHm7GJ5AFRWd7UMg6bqkkyaNpzJFpVMbwQnjYQL784fYQtc
 rEZufMHACmRLkUvX2GMfDiJgtgBTHJn6TIiy0FUYOTKGh/BTl5Rz+swCyXKf9lVZtHSxVnn45v4
 V/TjMsEb8xe2h/qB7pFL/PtB+f0BGQ==
Subject: Re:  [PATCH v1 04/23] libceph: Switch to use %ptSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511080022
X-Mailman-Approved-At: Mon, 10 Nov 2025 22:46:48 +0000
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

T24gTW9uLCAyMDI1LTExLTEwIGF0IDE5OjQwICswMTAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IFVzZSAlcHRTcCBpbnN0ZWFkIG9mIG9wZW4gY29kZWQgdmFyaWFudHMgdG8gcHJpbnQgY29u
dGVudCBvZg0KPiBzdHJ1Y3QgdGltZXNwZWM2NCBpbiBodW1hbiByZWFkYWJsZSBmb3JtYXQuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxp
bnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBuZXQvY2VwaC9tZXNzZW5nZXJfdjIuYyB8IDYgKyst
LS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL25ldC9jZXBoL21lc3Nlbmdlcl92Mi5jIGIvbmV0L2NlcGgvbWVz
c2VuZ2VyX3YyLmMNCj4gaW5kZXggOWUzOTM3OGVkYTAwLi42ZTY3NmUyZDRiYTAgMTAwNjQ0DQo+
IC0tLSBhL25ldC9jZXBoL21lc3Nlbmdlcl92Mi5jDQo+ICsrKyBiL25ldC9jZXBoL21lc3Nlbmdl
cl92Mi5jDQo+IEBAIC0xNTM1LDggKzE1MzUsNyBAQCBzdGF0aWMgaW50IHByZXBhcmVfa2VlcGFs
aXZlMihzdHJ1Y3QgY2VwaF9jb25uZWN0aW9uICpjb24pDQo+ICAJc3RydWN0IHRpbWVzcGVjNjQg
bm93Ow0KPiAgDQo+ICAJa3RpbWVfZ2V0X3JlYWxfdHM2NCgmbm93KTsNCj4gLQlkb3V0KCIlcyBj
b24gJXAgdGltZXN0YW1wICVsbGQuJTA5bGRcbiIsIF9fZnVuY19fLCBjb24sIG5vdy50dl9zZWMs
DQo+IC0JICAgICBub3cudHZfbnNlYyk7DQo+ICsJZG91dCgiJXMgY29uICVwIHRpbWVzdGFtcCAl
cHRTcFxuIiwgX19mdW5jX18sIGNvbiwgJm5vdyk7DQo+ICANCj4gIAljZXBoX2VuY29kZV90aW1l
c3BlYzY0KHRzLCAmbm93KTsNCj4gIA0KPiBAQCAtMjcyOSw4ICsyNzI4LDcgQEAgc3RhdGljIGlu
dCBwcm9jZXNzX2tlZXBhbGl2ZTJfYWNrKHN0cnVjdCBjZXBoX2Nvbm5lY3Rpb24gKmNvbiwNCj4g
IAljZXBoX2RlY29kZV9uZWVkKCZwLCBlbmQsIHNpemVvZihzdHJ1Y3QgY2VwaF90aW1lc3BlYyks
IGJhZCk7DQo+ICAJY2VwaF9kZWNvZGVfdGltZXNwZWM2NCgmY29uLT5sYXN0X2tlZXBhbGl2ZV9h
Y2ssIHApOw0KPiAgDQo+IC0JZG91dCgiJXMgY29uICVwIHRpbWVzdGFtcCAlbGxkLiUwOWxkXG4i
LCBfX2Z1bmNfXywgY29uLA0KPiAtCSAgICAgY29uLT5sYXN0X2tlZXBhbGl2ZV9hY2sudHZfc2Vj
LCBjb24tPmxhc3Rfa2VlcGFsaXZlX2Fjay50dl9uc2VjKTsNCj4gKwlkb3V0KCIlcyBjb24gJXAg
dGltZXN0YW1wICVwdFNwXG4iLCBfX2Z1bmNfXywgY29uLCAmY29uLT5sYXN0X2tlZXBhbGl2ZV9h
Y2spOw0KPiAgDQo+ICAJcmV0dXJuIDA7DQo+ICANCg0KTG9va3MgZ29vZC4gTmljZSBjbGVhbnVw
Lg0KDQpSZXZpZXdlZC1ieTogVmlhY2hlc2xhdiBEdWJleWtvIDxTbGF2YS5EdWJleWtvQGlibS5j
b20+DQoNClRoYW5rcywNClNsYXZhLg0K
