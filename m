Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290C3C49A50
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 23:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52E810E0A4;
	Mon, 10 Nov 2025 22:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="sMvwPWUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1783910E06D;
 Mon, 10 Nov 2025 19:12:57 +0000 (UTC)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAEiVuL005929;
 Mon, 10 Nov 2025 19:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pp1; bh=kUv3d/PJA8WPa6iavIQEVQdshmFYx0CYQfpCl2kze0M=; b=sMvwPWUD
 hkSbYS98OOIfWYdoY58wFair39hPOE8UnXLgZ1vGCDZAOJ8waIHh9otaoy+42qv1
 D1rZd3Ki3ZIukUwdoasLt8sjwufmkrmolbeDLy7bw3Kf9cCtZfuQZdbacSHQp5NF
 L03awHefUE3qlNR0LTRHeBYYb+lTs0j3m7wlgxHRK7pjQpz2sNKGIysBjFmIW+aN
 So0PFV1ImX5nFsrL5T0Avc0yL5p8M8lfJ1D+pqQ11DoO4WNptRmib4kOnfhQqCh5
 npPzeCbg8S8ltza2nN1bXUY/TrRe2n3pFwZBaJA+ZZ7BYltdDcVL8mpwx2G6wAPW
 SJNvuAEKnmEGsg==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wc71vvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Nov 2025 19:12:43 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AAJ9ldW007231;
 Mon, 10 Nov 2025 19:12:42 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013042.outbound.protection.outlook.com
 [40.93.201.42])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wc71vvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Nov 2025 19:12:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwT8Vb96JX38U0umdWU/Bk+6/gatSPkHpp6Kup3gkRwX5WfHQgmpmJCUux7x1i6/Fi+BX0oFfv5thd7Qh6gcIrvIlWYBfLqQBqGP2VxEPtbS5NUKwHQhOQ03/wqtTjq44NaafEkoEwYfw7QTHWOSz7D/DpWMECYTdPTSI8ge3qOFVqLPqIeHt9GOkxGOqgWBvTpRLT6N47USXFFyaODMpqeNEN/FlCbvqu7bONenlo4oj5IwaaZ8/X2lgIS8VHUhJWK5iKTuw0loFUdZvhfw7OGzrMlwVFIwT7LWNg1nMYwaBnzLyibYnD2arsHiRri28C6cu0dz6QNYMrSzgpheow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUv3d/PJA8WPa6iavIQEVQdshmFYx0CYQfpCl2kze0M=;
 b=NZQ3s3v0iD9lJTaP26NBl3CVuE9ifwlAvh/+Y3+aI6pF0mcci9+NbYVtaS/mZlbshWZWQvUU27tPf5l0eZup0N+LjkWAp262lfYwgwqnZaYc1jf/XkimKv2PW56ofXPZS1ZeXuKWVQ1SBvCi+naTkSgdjL5qJ4xTTGUBP+soC6ApwEkDGuVE8IaaL7rvMco009rottB4XD4VhjrBy1vRBvjRj/rAahIMl1YjeLmfF9qdVvN61jnWQavwTV2qPYzmhPEQhk3v/uaHeV5ccJudo0o3wRetmWvZVOg3YdfdumDrE3WkvnEKv5yJ7G5zXgqds3I2riP6m+E35hPjJvpiCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SA1PR15MB5819.namprd15.prod.outlook.com (2603:10b6:806:338::8)
 by CH0PR15MB6293.namprd15.prod.outlook.com (2603:10b6:610:185::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 19:12:38 +0000
Received: from SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539]) by SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 19:12:38 +0000
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
Thread-Topic: [EXTERNAL] [PATCH v1 03/23] ceph: Switch to use %ptSp
Thread-Index: AQHcUnN3d/v3h0NBK0GprZn6lraKLrTsRwyA
Date: Mon, 10 Nov 2025 19:12:38 +0000
Message-ID: <ba4fd8ffa0468ce1ec2b4c5d6b249922758bc648.camel@ibm.com>
References: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
 <20251110184727.666591-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20251110184727.666591-4-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5819:EE_|CH0PR15MB6293:EE_
x-ms-office365-filtering-correlation-id: bf4f4d4c-2927-476d-5406-08de208d1d06
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7416014|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?WWNUNXRVaGFKUFVkcW5BMER1d3IrRjhIYzN2QmtVYVd5TWRsc09Sb0RycXlt?=
 =?utf-8?B?ZjZOQzFSWkpPTDV3NVhGUUJEdEtibmNEUkFpakJoT1JxZXFMTUNMS3J3RGJ4?=
 =?utf-8?B?NVQxbUJpaFBSZmZ4TEd1UDAyT0ZmL2ZFU2pBTXFsUXdEUXcyRjRyeVhjQWJM?=
 =?utf-8?B?aEZEU0pOU05yYjl2bmNIUGZLdFEwbzVqaFo5Zk03SCtXbFZHVkprUTU0WTRx?=
 =?utf-8?B?KzNudXAydW1GaktqcllQdERsdTUwOVYrQnR0RGNZZm1hYlRoV2plK1lkcjVn?=
 =?utf-8?B?c2NVU1d5cTJxaHd6MHl2M2tlK3dkSFArd1k2cytIMExFeEl2aFcxbVkyK0ZO?=
 =?utf-8?B?UHUxdG1FVGRsd2c2UkZwSWtOYmxYa09xN2UzMU9MNmREWmZ1czlRK25mbGtY?=
 =?utf-8?B?ZzA5THk4T25nblJ0YzArUEU4ZzUyelBER0FUN0Mzclhhd3BvQmRnVGtvOUQx?=
 =?utf-8?B?S2NGeThGVWF4MXRETkRYbjVLdnk4MldkUjlLZVduTkZ4cWVONnkwRVQ5bGFl?=
 =?utf-8?B?dTJrQllWVXJMNzN0Z0ZSem9yS1pHRVhMVG5JYzlLK3Rla0ZQd2NYbUJjS1hx?=
 =?utf-8?B?S3VLa29aVU9QRFBsQ3BjNGR0aVZ6ckdmVDFiaGhBMFpnVFRpd0xqQS85QzE0?=
 =?utf-8?B?dFBoYXAwTUdpSTVqdHpyWlh2NWxuWmpOQmFseCtLY0FWVytyYXJkWnhqaXZ5?=
 =?utf-8?B?amxrNGxTcmpNdmRQZkdQVGVXWXQyWkpXM1RpdEtaVXVBb0JRY1dVNFhxbGkx?=
 =?utf-8?B?YTJxd2pMM3djc05SNHJQamVxcUthcFFweHk0VkxvYy9WcHpydW5zdVFtRjk1?=
 =?utf-8?B?VHNJV1dBRE8vN2hRQVUzOCtTc01QZm85ZmR6SHEvWDJXem4yVmgzK2JZWDlz?=
 =?utf-8?B?Vld2cXdHWFpPWlZsbGtpVWN2eUsvVk1DR0pocG1pRnFrT2Q5TkpMQ2RwZXdS?=
 =?utf-8?B?MDRwRDZDdWVLYTRMU25kTUpHSlVaWlVQNEZtdDdsRmI4NU5Sd2Y4TDZyc3dj?=
 =?utf-8?B?UEFzR3E4NG5KczZpZXpPb3RVZnJBQlNyQWg0R1dGakgzYmRWVFc1N2FNTUVp?=
 =?utf-8?B?TUxubUQ1Q1ZPUTlFUUY0eVR4eFNGQ05xWUoyc2FBV0VmWXg5YndQTnhWSjlU?=
 =?utf-8?B?U3FZTnFOL3JiODVOejhJUFJ1dTFlNXMxK1JSaHVWejBVMUl3SHg0QmlEbjBl?=
 =?utf-8?B?R21sWUNFeUNFM3ZmcmFTVGRPUnNqR253YUJDMmE1R25ETVhDKzR6UUZBaWkx?=
 =?utf-8?B?cHlVcENLY3pOV203WDhPOThxbFJORmZyMHJBUDdrWHhvSWxNeGNRczYwVWJu?=
 =?utf-8?B?c2g5bEhPWXM3cXF6NkQycjRvN05jRVBOWTRXUDE0M1YvbGRRdVB3LzVweHpP?=
 =?utf-8?B?cTNPbTJLTm1SZ2cvZk5MbkNIbjVvVHhXdDFmR1FBV1M0S0ZQcXFjNGQ2Tlh3?=
 =?utf-8?B?QVZlWExwN1lZcnhsVFlJdGJobFo0UEg2WFpxeFBSNS8xVHprU3lvUE5oeG1X?=
 =?utf-8?B?Y0xzdXdMM2ZlTkh4bk5KeWxJYjYvMDFua25SY081SG9uL0Nhd2g2Q1FsOVkw?=
 =?utf-8?B?NFJqZUp3Wko3QTc2OEZzRkVmWW56SlBMTi92UmNuUVNROCtib2lWa0pIV3U2?=
 =?utf-8?B?czdrcUprYW13Y0NUTDg1b1REOVFXZjdUM3JaK2xsb1ZNSTFjVDlYQTVCODlZ?=
 =?utf-8?B?ejlkOTBSWUx3M1E2cjhmRzVDMFROWlNkU2ppNjhyZkMxdy9hcUpNVnM5K01P?=
 =?utf-8?B?Rkd1TmZDc1UvSmJxMmdna1VKK2RGMVYxalZsQmpvaDRBdXNlZ2U0WDhnK3JG?=
 =?utf-8?B?VXBQWEJnUkZQZ2R6RWx1eUVtOXBRMy9pS2tzWnRKZGFCY1A3OVk1SjZMMlVy?=
 =?utf-8?B?cGkra0ZGT0hDZkRLUERlR3RocHExcnlpOHRUa1hMN3EyWmFjdnU3WkJwVjM3?=
 =?utf-8?B?ckVqZHZ5dVlUT05DbUp3TFpQZnllcFBMQytKRnYxaUtDNDM0Uk5uc0ErUUVK?=
 =?utf-8?B?bmkzVjEzcmRueFpDZGE3WllKZjJVeEFPSkJmVzBxWDExMmNETmo0V2ljakZV?=
 =?utf-8?B?bW4xaHlRR0JXT2czQkV1OTRDNlExMWFaNEJ2Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5819.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OU5tdXB4OWhkRUtGYno2d1VUK0E3MDYvVCtjQXcwMWlGdDNYa1BmSTM1QzFu?=
 =?utf-8?B?cEtOS083a0dxMzNWMURFckFhejhwb0hiZVNZTFB1ZE9WQThWOU9PN1RPWnhN?=
 =?utf-8?B?aHpNMWlUbDlRcm95dW15ZTFLcEVsQmlESS9IOUg3c1NLVDlhSTFkaVVlVVR0?=
 =?utf-8?B?RGwrUEl2TFg2MytUTDY5M0k0ZHdESlUrVllWUVVuZGgxeGpTWGhERmM2eTFw?=
 =?utf-8?B?WGZ1cnA3L1YvR2E0eUxEbG5CRkM2RkZwNTdTMDNiQzhXZzFVV1Z0UE5PNGtR?=
 =?utf-8?B?TlVhUWJlOGhzL0NnUWhrUU80RVF0UG5FN25pbVpIcy9jR1FlOHpRNk1iTm9J?=
 =?utf-8?B?WGU4QTV4aUVYSVJSSEkrOGtQRU5vT091bVNESEhlWkF4VmEzWUFBZkdBMm5D?=
 =?utf-8?B?TWtiS0tRdjVyNS9LWkVJWGN2K0h2a2h0OVIvYVI5aW85Y3pIc0EzNmNmM3dn?=
 =?utf-8?B?TE9OTlJlWmlQZkFwdzFNVTZNNEx5Ly9TQS9jaEJLNzVFM0k0eE8rcTZkbjk5?=
 =?utf-8?B?KzNCY3dFK1FOL01mYTNhanRyQ3RwaUpRWk9LTE5PSTFsbnhtQXhJZHBLMVdL?=
 =?utf-8?B?VDVlV1J6emRrWXpxVGNBcmJpRVNoVFZWOTQwYVVtMndPeG1pYVdZSmZPbjJM?=
 =?utf-8?B?dXBtL0lHQ3ljRXBBZGoxS0c1LzVIMWJxVHRVQmdFUkN6cy9acmUvODM2RDZt?=
 =?utf-8?B?SW1nNmtzUENRRVZPVmdSM3RQVXNVUTVOMldTNDJydGxvUmtzZFdtYlZ3TVVj?=
 =?utf-8?B?eWE0aDM2YjhKRE5CZTRKWUVubWhtU2JCYXQyMjlCaGFVN1VHUWFFaW1uRFdJ?=
 =?utf-8?B?dzVDZnVvVHN0REFubkVBdS9JallBMXdLY3dPckk5NnZhYnhML3U5aFhBdmd5?=
 =?utf-8?B?c2xMZFNKSnpGWWdZWUk5U3hsQ0pCNDlkUzkxN3N5NEEzc05kUWF0dVdWdng3?=
 =?utf-8?B?dGw0ZXhDMnp4OGFUZ0t2eU5CcS8ybjNPNjJSQTRKVEpwaWdyZEF4RmhDekds?=
 =?utf-8?B?UnpTdTh3SnUvZ0VWVlNORktILzVianF4RlM4aXVnS0ZGa0ZNQTVreEZvYnNB?=
 =?utf-8?B?VmpYZHJ5NmJqQ1VyRWpTc2xVdDd4bWQ1Y2hIZy9hZ1J6TWo3L2k2YTNsa0kw?=
 =?utf-8?B?RlpmWS81TDdER3V0czJ3T1hvWm9GeXFTSnYycmxNRFEvQ1FKWGJJckhwY0JO?=
 =?utf-8?B?enNtS3lubkhvd05JTVl4bldQeXFLOWlvTmMrZFNvczBqekxqRDNyUXlDNTh2?=
 =?utf-8?B?aWVFMkkrM2tTVWhSY2lSTFd5VHpHeEhqL3RpYURORXFDdjEwZkRmM204TDN3?=
 =?utf-8?B?eTFVb3M0ZkNISEc2U1FzTUtIbVBtb3k1aTdvc0tlcC9MRE1veGprMlBCN0hO?=
 =?utf-8?B?RW5EckxqWi8yN21CU1RPSUxUNnVWcXptdnBjN2tybWhhTmV6UUM3VExSdmZ0?=
 =?utf-8?B?bHV5clZKMlpVOHZJMmxSU2xFM0hkV3Q1Y3pLOHdDYzlzN0RFZHZZZDJmTUcy?=
 =?utf-8?B?MitCSFFxQStIUFdmdFRaa0JPT0s0MDhZV1pLbFJxemJoNGR6dHh0TmtLclpD?=
 =?utf-8?B?RlhuTHp1dG45cklWZk5Rd3FlaUJZL0R5OEJ3YWU4eTk2MzRwM3V2MkdRaXFH?=
 =?utf-8?B?SlViZTQrUzcvNlR1dDVLSllSSWlndGFJSDZVNjEyWGZpL0Q5NEkzOTdHTmRk?=
 =?utf-8?B?YnlSMURqQW9PZlFPYktUTXNUeldnMlhhc2c2ZkxBZlNlMGh5bkVHYjBRWGhh?=
 =?utf-8?B?cFpGbGJIVTl0bStCdVA3SG9hT1F3TzhvUDZmdmhHT0VBNGRvOEpjYmZHUld5?=
 =?utf-8?B?dGQxb3BqbkVRY050QS9Fci82ZE1OM2h1WjNMT01ieDRzNjliWUJ0ZHRYbzZG?=
 =?utf-8?B?RWlVeGwvQVBKQk5aV3J0TFFLQnAvNjRCZW1tR25ma2lROVJ5V1BBMEpOZUtw?=
 =?utf-8?B?UlkwUjl4YVVMR2ZkVHhjSEd0ZVl3WTNYNVBHR1JlSXZ1Ulk2cXBlSGI0d1A5?=
 =?utf-8?B?TGR6UXEzQ3pEditwR2FwN1Q0bzd0ZXJKbFBWdmlSd3Qyamkva2J5c2kzWElM?=
 =?utf-8?B?WU9vVEpYTHVEbDlYM2IxYmFUNzFkdFJLM1ZUYzBkS1hhT3N3blZsYTBrbkI4?=
 =?utf-8?B?WGtjMVFHRkp0c1F6OXFJSzg4UXEvTHBRdXZHV0lDeHpPTTMra2JLVkdGUlR0?=
 =?utf-8?Q?xP9wG6LjVjPF3eYGg3CGAI4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4BBB9553FD6454BB8E0E2552B1E1EA4@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5819.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4f4d4c-2927-476d-5406-08de208d1d06
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 19:12:38.2179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HlFuCtB6ABlzjj6KtTOiN/kt3Qp0KCFKLzFzgUjbwf2zErZ5YElGV6Jq+R/eTDsCLcLccECyWBjA84cx7Lr0KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR15MB6293
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAxOCBTYWx0ZWRfX8DGC+jBv6edf
 as3KrhlqoFJcN+nQwXoynWKBW1q8gmJN/5gC3PepW1H8+s7le/qmZ0Zlt16NhyF0+mH0G1awYhN
 pWZyVKYOK8xbXlbQCybMjjT9S8upVPRBxjRUpL0l70Zpu6o6+B2EO6aSst7ZfbAXvFu6RK6qNFn
 JztijSv53/k39WNa2oXkQaYo1OKX8dXnO2jUFNh8m/jkqhhjtqQp0J0m4HwBONFiKdNhi4de2Xp
 a+u9h7FtPIFkNHZlvlhFz5a5PzAYO9b0y8mKG2LYvHZSC7FBQlcsO6GsCNMo7tiDei6twIR/2I1
 GaBWUWo6S5oMED6U6PVgneIb7+pviDl1pVp+ORwvaaSgstjBpTrY/H6ICuqQwVGauILOoAq0e7L
 aXnO8HU1GxVD8GEnZdgK3fCwmbLRog==
X-Authority-Analysis: v=2.4 cv=GcEaXAXL c=1 sm=1 tr=0 ts=6912392b cx=c_pps
 a=Xv5HOu5WSFZfuBAuS1yumw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=6-j_7sKItp_voF2SmKEA:9 a=QEXdDO2ut3YA:10 a=UhEZJTgQB8St2RibIkdl:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=QOGEsqRv6VhmHaoFNykA:22
X-Proofpoint-GUID: 1L9JRQbmWp7AuhQUetZc888E6fKmcziW
X-Proofpoint-ORIG-GUID: 6t2qwdpe0zaFDm8POsex3js8vGaYTx_n
Subject: Re:  [PATCH v1 03/23] ceph: Switch to use %ptSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080018
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
bnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBmcy9jZXBoL2Rpci5jICAgfCAgNSArKy0tLQ0KPiAg
ZnMvY2VwaC9pbm9kZS5jIHwgNDcgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4gIGZzL2NlcGgveGF0dHIuYyB8ICA2ICsrLS0tLQ0KPiAgMyBmaWxlcyBj
aGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9mcy9jZXBoL2Rpci5jIGIvZnMvY2VwaC9kaXIuYw0KPiBpbmRleCBkMThjMGVhZWY5Yjcu
LmJmNTBjNmU3YTAyOSAxMDA2NDQNCj4gLS0tIGEvZnMvY2VwaC9kaXIuYw0KPiArKysgYi9mcy9j
ZXBoL2Rpci5jDQo+IEBAIC0yMTU1LDcgKzIxNTUsNyBAQCBzdGF0aWMgc3NpemVfdCBjZXBoX3Jl
YWRfZGlyKHN0cnVjdCBmaWxlICpmaWxlLCBjaGFyIF9fdXNlciAqYnVmLCBzaXplX3Qgc2l6ZSwN
Cj4gIAkJCQkiIHJmaWxlczogICAlMjBsbGRcbiINCj4gIAkJCQkiIHJzdWJkaXJzOiAlMjBsbGRc
biINCj4gIAkJCQkicmJ5dGVzOiAgICAlMjBsbGRcbiINCj4gLQkJCQkicmN0aW1lOiAgICAlMTBs
bGQuJTA5bGRcbiIsDQo+ICsJCQkJInJjdGltZTogICAgJXB0U3BcbiIsDQo+ICAJCQkJY2ktPmlf
ZmlsZXMgKyBjaS0+aV9zdWJkaXJzLA0KPiAgCQkJCWNpLT5pX2ZpbGVzLA0KPiAgCQkJCWNpLT5p
X3N1YmRpcnMsDQo+IEBAIC0yMTYzLDggKzIxNjMsNyBAQCBzdGF0aWMgc3NpemVfdCBjZXBoX3Jl
YWRfZGlyKHN0cnVjdCBmaWxlICpmaWxlLCBjaGFyIF9fdXNlciAqYnVmLCBzaXplX3Qgc2l6ZSwN
Cj4gIAkJCQljaS0+aV9yZmlsZXMsDQo+ICAJCQkJY2ktPmlfcnN1YmRpcnMsDQo+ICAJCQkJY2kt
PmlfcmJ5dGVzLA0KPiAtCQkJCWNpLT5pX3JjdGltZS50dl9zZWMsDQo+IC0JCQkJY2ktPmlfcmN0
aW1lLnR2X25zZWMpOw0KPiArCQkJCSZjaS0+aV9yY3RpbWUpOw0KPiAgCX0NCj4gIA0KPiAgCWlm
ICgqcHBvcyA+PSBkZmktPmRpcl9pbmZvX2xlbikNCj4gZGlmZiAtLWdpdCBhL2ZzL2NlcGgvaW5v
ZGUuYyBiL2ZzL2NlcGgvaW5vZGUuYw0KPiBpbmRleCAzN2QzYTI0NzdjMTcuLjZkYjg5NTFkNzll
MCAxMDA2NDQNCj4gLS0tIGEvZnMvY2VwaC9pbm9kZS5jDQo+ICsrKyBiL2ZzL2NlcGgvaW5vZGUu
Yw0KPiBAQCAtODc5LDcgKzg3OSw5IEBAIHZvaWQgY2VwaF9maWxsX2ZpbGVfdGltZShzdHJ1Y3Qg
aW5vZGUgKmlub2RlLCBpbnQgaXNzdWVkLA0KPiAgew0KPiAgCXN0cnVjdCBjZXBoX2NsaWVudCAq
Y2wgPSBjZXBoX2lub2RlX3RvX2NsaWVudChpbm9kZSk7DQo+ICAJc3RydWN0IGNlcGhfaW5vZGVf
aW5mbyAqY2kgPSBjZXBoX2lub2RlKGlub2RlKTsNCj4gKwlzdHJ1Y3QgdGltZXNwZWM2NCBpYXRp
bWUgPSBpbm9kZV9nZXRfYXRpbWUoaW5vZGUpOw0KPiAgCXN0cnVjdCB0aW1lc3BlYzY0IGljdGlt
ZSA9IGlub2RlX2dldF9jdGltZShpbm9kZSk7DQo+ICsJc3RydWN0IHRpbWVzcGVjNjQgaW10aW1l
ID0gaW5vZGVfZ2V0X210aW1lKGlub2RlKTsNCj4gIAlpbnQgd2FybiA9IDA7DQo+ICANCj4gIAlp
ZiAoaXNzdWVkICYgKENFUEhfQ0FQX0ZJTEVfRVhDTHwNCj4gQEAgLTg4OSwzOSArODkxLDI2IEBA
IHZvaWQgY2VwaF9maWxsX2ZpbGVfdGltZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBpbnQgaXNzdWVk
LA0KPiAgCQkgICAgICBDRVBIX0NBUF9YQVRUUl9FWENMKSkgew0KPiAgCQlpZiAoY2ktPmlfdmVy
c2lvbiA9PSAwIHx8DQo+ICAJCSAgICB0aW1lc3BlYzY0X2NvbXBhcmUoY3RpbWUsICZpY3RpbWUp
ID4gMCkgew0KPiAtCQkJZG91dGMoY2wsICJjdGltZSAlbGxkLiUwOWxkIC0+ICVsbGQuJTA5bGQg
aW5jIHcvIGNhcFxuIiwNCj4gLQkJCSAgICAgaWN0aW1lLnR2X3NlYywgaWN0aW1lLnR2X25zZWMs
DQo+IC0JCQkgICAgIGN0aW1lLT50dl9zZWMsIGN0aW1lLT50dl9uc2VjKTsNCj4gKwkJCWRvdXRj
KGNsLCAiY3RpbWUgJXB0U3AgLT4gJXB0U3AgaW5jIHcvIGNhcFxuIiwgJmljdGltZSwgY3RpbWUp
Ow0KPiAgCQkJaW5vZGVfc2V0X2N0aW1lX3RvX3RzKGlub2RlLCAqY3RpbWUpOw0KPiAgCQl9DQo+
ICAJCWlmIChjaS0+aV92ZXJzaW9uID09IDAgfHwNCj4gIAkJICAgIGNlcGhfc2VxX2NtcCh0aW1l
X3dhcnBfc2VxLCBjaS0+aV90aW1lX3dhcnBfc2VxKSA+IDApIHsNCj4gIAkJCS8qIHRoZSBNRFMg
ZGlkIGEgdXRpbWVzKCkgKi8NCj4gLQkJCWRvdXRjKGNsLCAibXRpbWUgJWxsZC4lMDlsZCAtPiAl
bGxkLiUwOWxkIHR3ICVkIC0+ICVkXG4iLA0KPiAtCQkJICAgICBpbm9kZV9nZXRfbXRpbWVfc2Vj
KGlub2RlKSwNCj4gLQkJCSAgICAgaW5vZGVfZ2V0X210aW1lX25zZWMoaW5vZGUpLA0KPiAtCQkJ
ICAgICBtdGltZS0+dHZfc2VjLCBtdGltZS0+dHZfbnNlYywNCj4gKwkJCWRvdXRjKGNsLCAibXRp
bWUgJXB0U3AgLT4gJXB0U3AgdHcgJWQgLT4gJWRcbiIsICZpbXRpbWUsIG10aW1lLA0KPiAgCQkJ
ICAgICBjaS0+aV90aW1lX3dhcnBfc2VxLCAoaW50KXRpbWVfd2FycF9zZXEpOw0KPiAgDQo+ICAJ
CQlpbm9kZV9zZXRfbXRpbWVfdG9fdHMoaW5vZGUsICptdGltZSk7DQo+ICAJCQlpbm9kZV9zZXRf
YXRpbWVfdG9fdHMoaW5vZGUsICphdGltZSk7DQo+ICAJCQljaS0+aV90aW1lX3dhcnBfc2VxID0g
dGltZV93YXJwX3NlcTsNCj4gIAkJfSBlbHNlIGlmICh0aW1lX3dhcnBfc2VxID09IGNpLT5pX3Rp
bWVfd2FycF9zZXEpIHsNCj4gLQkJCXN0cnVjdCB0aW1lc3BlYzY0CXRzOw0KPiAtDQo+ICAJCQkv
KiBub2JvZHkgZGlkIHV0aW1lcygpOyB0YWtlIHRoZSBtYXggKi8NCj4gLQkJCXRzID0gaW5vZGVf
Z2V0X210aW1lKGlub2RlKTsNCj4gLQkJCWlmICh0aW1lc3BlYzY0X2NvbXBhcmUobXRpbWUsICZ0
cykgPiAwKSB7DQo+IC0JCQkJZG91dGMoY2wsICJtdGltZSAlbGxkLiUwOWxkIC0+ICVsbGQuJTA5
bGQgaW5jXG4iLA0KPiAtCQkJCSAgICAgdHMudHZfc2VjLCB0cy50dl9uc2VjLA0KPiAtCQkJCSAg
ICAgbXRpbWUtPnR2X3NlYywgbXRpbWUtPnR2X25zZWMpOw0KPiArCQkJaWYgKHRpbWVzcGVjNjRf
Y29tcGFyZShtdGltZSwgJmltdGltZSkgPiAwKSB7DQo+ICsJCQkJZG91dGMoY2wsICJtdGltZSAl
cHRTcCAtPiAlcHRTcCBpbmNcbiIsICZpbXRpbWUsIG10aW1lKTsNCj4gIAkJCQlpbm9kZV9zZXRf
bXRpbWVfdG9fdHMoaW5vZGUsICptdGltZSk7DQo+ICAJCQl9DQo+IC0JCQl0cyA9IGlub2RlX2dl
dF9hdGltZShpbm9kZSk7DQo+IC0JCQlpZiAodGltZXNwZWM2NF9jb21wYXJlKGF0aW1lLCAmdHMp
ID4gMCkgew0KPiAtCQkJCWRvdXRjKGNsLCAiYXRpbWUgJWxsZC4lMDlsZCAtPiAlbGxkLiUwOWxk
IGluY1xuIiwNCj4gLQkJCQkgICAgIHRzLnR2X3NlYywgdHMudHZfbnNlYywNCj4gLQkJCQkgICAg
IGF0aW1lLT50dl9zZWMsIGF0aW1lLT50dl9uc2VjKTsNCj4gKwkJCWlmICh0aW1lc3BlYzY0X2Nv
bXBhcmUoYXRpbWUsICZpYXRpbWUpID4gMCkgew0KPiArCQkJCWRvdXRjKGNsLCAiYXRpbWUgJXB0
U3AgLT4gJXB0U3AgaW5jXG4iLCAmaWF0aW1lLCBhdGltZSk7DQo+ICAJCQkJaW5vZGVfc2V0X2F0
aW1lX3RvX3RzKGlub2RlLCAqYXRpbWUpOw0KPiAgCQkJfQ0KPiAgCQl9IGVsc2UgaWYgKGlzc3Vl
ZCAmIENFUEhfQ0FQX0ZJTEVfRVhDTCkgew0KPiBAQCAtMjcwMywxMCArMjY5Miw4IEBAIGludCBf
X2NlcGhfc2V0YXR0cihzdHJ1Y3QgbW50X2lkbWFwICppZG1hcCwgc3RydWN0IGlub2RlICppbm9k
ZSwNCj4gIAlpZiAoaWFfdmFsaWQgJiBBVFRSX0FUSU1FKSB7DQo+ICAJCXN0cnVjdCB0aW1lc3Bl
YzY0IGF0aW1lID0gaW5vZGVfZ2V0X2F0aW1lKGlub2RlKTsNCj4gIA0KPiAtCQlkb3V0YyhjbCwg
IiVwICVsbHguJWxseCBhdGltZSAlbGxkLiUwOWxkIC0+ICVsbGQuJTA5bGRcbiIsDQo+IC0JCSAg
ICAgIGlub2RlLCBjZXBoX3Zpbm9wKGlub2RlKSwNCj4gLQkJICAgICAgYXRpbWUudHZfc2VjLCBh
dGltZS50dl9uc2VjLA0KPiAtCQkgICAgICBhdHRyLT5pYV9hdGltZS50dl9zZWMsIGF0dHItPmlh
X2F0aW1lLnR2X25zZWMpOw0KPiArCQlkb3V0YyhjbCwgIiVwICVsbHguJWxseCBhdGltZSAlcHRT
cCAtPiAlcHRTcFxuIiwNCj4gKwkJICAgICAgaW5vZGUsIGNlcGhfdmlub3AoaW5vZGUpLCAmYXRp
bWUsICZhdHRyLT5pYV9hdGltZSk7DQo+ICAJCWlmICghZG9fc3luYyAmJiAoaXNzdWVkICYgQ0VQ
SF9DQVBfRklMRV9FWENMKSkgew0KPiAgCQkJY2ktPmlfdGltZV93YXJwX3NlcSsrOw0KPiAgCQkJ
aW5vZGVfc2V0X2F0aW1lX3RvX3RzKGlub2RlLCBhdHRyLT5pYV9hdGltZSk7DQo+IEBAIC0yNzgw
LDEwICsyNzY3LDggQEAgaW50IF9fY2VwaF9zZXRhdHRyKHN0cnVjdCBtbnRfaWRtYXAgKmlkbWFw
LCBzdHJ1Y3QgaW5vZGUgKmlub2RlLA0KPiAgCWlmIChpYV92YWxpZCAmIEFUVFJfTVRJTUUpIHsN
Cj4gIAkJc3RydWN0IHRpbWVzcGVjNjQgbXRpbWUgPSBpbm9kZV9nZXRfbXRpbWUoaW5vZGUpOw0K
PiAgDQo+IC0JCWRvdXRjKGNsLCAiJXAgJWxseC4lbGx4IG10aW1lICVsbGQuJTA5bGQgLT4gJWxs
ZC4lMDlsZFxuIiwNCj4gLQkJICAgICAgaW5vZGUsIGNlcGhfdmlub3AoaW5vZGUpLA0KPiAtCQkg
ICAgICBtdGltZS50dl9zZWMsIG10aW1lLnR2X25zZWMsDQo+IC0JCSAgICAgIGF0dHItPmlhX210
aW1lLnR2X3NlYywgYXR0ci0+aWFfbXRpbWUudHZfbnNlYyk7DQo+ICsJCWRvdXRjKGNsLCAiJXAg
JWxseC4lbGx4IG10aW1lICVwdFNwIC0+ICVwdFNwXG4iLA0KPiArCQkgICAgICBpbm9kZSwgY2Vw
aF92aW5vcChpbm9kZSksICZtdGltZSwgJmF0dHItPmlhX210aW1lKTsNCj4gIAkJaWYgKCFkb19z
eW5jICYmIChpc3N1ZWQgJiBDRVBIX0NBUF9GSUxFX0VYQ0wpKSB7DQo+ICAJCQljaS0+aV90aW1l
X3dhcnBfc2VxKys7DQo+ICAJCQlpbm9kZV9zZXRfbXRpbWVfdG9fdHMoaW5vZGUsIGF0dHItPmlh
X210aW1lKTsNCj4gQEAgLTI4MDQsMTMgKzI3ODksMTEgQEAgaW50IF9fY2VwaF9zZXRhdHRyKHN0
cnVjdCBtbnRfaWRtYXAgKmlkbWFwLCBzdHJ1Y3QgaW5vZGUgKmlub2RlLA0KPiAgDQo+ICAJLyog
dGhlc2UgZG8gbm90aGluZyAqLw0KPiAgCWlmIChpYV92YWxpZCAmIEFUVFJfQ1RJTUUpIHsNCj4g
KwkJc3RydWN0IHRpbWVzcGVjNjQgaWN0aW1lID0gaW5vZGVfZ2V0X2N0aW1lKGlub2RlKTsNCj4g
IAkJYm9vbCBvbmx5ID0gKGlhX3ZhbGlkICYgKEFUVFJfU0laRXxBVFRSX01USU1FfEFUVFJfQVRJ
TUV8DQo+ICAJCQkJCSBBVFRSX01PREV8QVRUUl9VSUR8QVRUUl9HSUQpKSA9PSAwOw0KPiAtCQlk
b3V0YyhjbCwgIiVwICVsbHguJWxseCBjdGltZSAlbGxkLiUwOWxkIC0+ICVsbGQuJTA5bGQgKCVz
KVxuIiwNCj4gLQkJICAgICAgaW5vZGUsIGNlcGhfdmlub3AoaW5vZGUpLA0KPiAtCQkgICAgICBp
bm9kZV9nZXRfY3RpbWVfc2VjKGlub2RlKSwNCj4gLQkJICAgICAgaW5vZGVfZ2V0X2N0aW1lX25z
ZWMoaW5vZGUpLA0KPiAtCQkgICAgICBhdHRyLT5pYV9jdGltZS50dl9zZWMsIGF0dHItPmlhX2N0
aW1lLnR2X25zZWMsDQo+ICsJCWRvdXRjKGNsLCAiJXAgJWxseC4lbGx4IGN0aW1lICVwdFNwIC0+
ICVwdFNwICglcylcbiIsDQo+ICsJCSAgICAgIGlub2RlLCBjZXBoX3Zpbm9wKGlub2RlKSwgJmlj
dGltZSwgJmF0dHItPmlhX2N0aW1lLA0KPiAgCQkgICAgICBvbmx5ID8gImN0aW1lIG9ubHkiIDog
Imlnbm9yZWQiKTsNCj4gIAkJaWYgKG9ubHkpIHsNCj4gIAkJCS8qDQo+IGRpZmYgLS1naXQgYS9m
cy9jZXBoL3hhdHRyLmMgYi9mcy9jZXBoL3hhdHRyLmMNCj4gaW5kZXggNTM3MTY1ZGI0NTE5Li5h
ZDFmMzBiZWExNzUgMTAwNjQ0DQo+IC0tLSBhL2ZzL2NlcGgveGF0dHIuYw0KPiArKysgYi9mcy9j
ZXBoL3hhdHRyLmMNCj4gQEAgLTI0OSw4ICsyNDksNyBAQCBzdGF0aWMgc3NpemVfdCBjZXBoX3Z4
YXR0cmNiX2Rpcl9yYnl0ZXMoc3RydWN0IGNlcGhfaW5vZGVfaW5mbyAqY2ksIGNoYXIgKnZhbCwN
Cj4gIHN0YXRpYyBzc2l6ZV90IGNlcGhfdnhhdHRyY2JfZGlyX3JjdGltZShzdHJ1Y3QgY2VwaF9p
bm9kZV9pbmZvICpjaSwgY2hhciAqdmFsLA0KPiAgCQkJCQlzaXplX3Qgc2l6ZSkNCj4gIHsNCj4g
LQlyZXR1cm4gY2VwaF9mbXRfeGF0dHIodmFsLCBzaXplLCAiJWxsZC4lMDlsZCIsIGNpLT5pX3Jj
dGltZS50dl9zZWMsDQo+IC0JCQkJY2ktPmlfcmN0aW1lLnR2X25zZWMpOw0KPiArCXJldHVybiBj
ZXBoX2ZtdF94YXR0cih2YWwsIHNpemUsICIlcHRTcCIsICZjaS0+aV9yY3RpbWUpOw0KPiAgfQ0K
PiAgDQo+ICAvKiBkaXIgcGluICovDQo+IEBAIC0zMDcsOCArMzA2LDcgQEAgc3RhdGljIGJvb2wg
Y2VwaF92eGF0dHJjYl9zbmFwX2J0aW1lX2V4aXN0cyhzdHJ1Y3QgY2VwaF9pbm9kZV9pbmZvICpj
aSkNCj4gIHN0YXRpYyBzc2l6ZV90IGNlcGhfdnhhdHRyY2Jfc25hcF9idGltZShzdHJ1Y3QgY2Vw
aF9pbm9kZV9pbmZvICpjaSwgY2hhciAqdmFsLA0KPiAgCQkJCQlzaXplX3Qgc2l6ZSkNCj4gIHsN
Cj4gLQlyZXR1cm4gY2VwaF9mbXRfeGF0dHIodmFsLCBzaXplLCAiJWxsZC4lMDlsZCIsIGNpLT5p
X3NuYXBfYnRpbWUudHZfc2VjLA0KPiAtCQkJCWNpLT5pX3NuYXBfYnRpbWUudHZfbnNlYyk7DQo+
ICsJcmV0dXJuIGNlcGhfZm10X3hhdHRyKHZhbCwgc2l6ZSwgIiVwdFNwIiwgJmNpLT5pX3NuYXBf
YnRpbWUpOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgc3NpemVfdCBjZXBoX3Z4YXR0cmNiX2NsdXN0
ZXJfZnNpZChzdHJ1Y3QgY2VwaF9pbm9kZV9pbmZvICpjaSwNCg0KTG9va3MgZ29vZC4gTmljZSBj
bGVhbnVwLg0KDQpSZXZpZXdlZC1ieTogVmlhY2hlc2xhdiBEdWJleWtvIDxTbGF2YS5EdWJleWtv
QGlibS5jb20+DQoNClRoYW5rcywNClNsYXZhLg0K
