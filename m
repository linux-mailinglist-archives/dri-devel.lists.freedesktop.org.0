Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 908739F5FFF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 09:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E885410EAE5;
	Wed, 18 Dec 2024 08:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="ao0GrP4a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353BA10E2F2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 12:19:48 +0000 (UTC)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHBdgho025795;
 Tue, 17 Dec 2024 04:19:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 s2048-2021-q4; bh=7PhX5+gAyT+SuAHokI7gYmLvSRCIT6LH6p/xGnoyraY=; b=
 ao0GrP4a0neACxaJgRt6AIdjNgsmOF6pihlsS3t3tejofmPVRHdl2n+VJprTNSEf
 9DqTuxfR2HXsqvdfQcFlc2hy2q6jonuq3TDiZXc12hOigMR9us6QxRAqmNcQVrLM
 ysSDY5YDgvysQxJKh/xsvrJV6bGRpn8bLJnH+xQovThyY8ARGXGww16tALhIK/e8
 ykHKdkytrM3LhV8sMHliaftmzwEy9dDN8ssSbwpbCHtfdKt+PekO5i9EPuoiOitN
 Y+N44oXYD+x/y1cJrfI55/0Qcr8qVxhuL8wZ1tPWnEoVWrMYsFcDYuyY1vjLqZIE
 +QxJOcFdUP519S4UG0Tjmg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 43k80a0cus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 04:19:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ri02mZaX17lVahVopvEyapePkm1YxpXQy8sISrZ8sE83T7Gg3WAA/4KdygPeXlN4WHR7KeMC/qbcI8nWaRTI9KIxYhuKLE7RrqGS3vPN2WOXsHUB/CeFz91hlkq4bOYHR6cKB5qxCA1EZnXWRFn4TcqUuhRbDOkUJcVfENv/79DSr4v3tVkzgcvg2tE3/ty9MY5dPqTnOPeL2b0AREUe3kDVqSaDctVafvYVKyL7zfrw9o2wEZax66gNK0q5K/ZNoZikwJjbxM1hW4Czc9sTFr4JeZOC16H58FsqT5f8ICLI4RbBnWhs37dT4veMB+wt2Zdx/K79qE6+9i+DyOEE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDAWTkzs725ZwSElirwfGYQpPSay644swGxAyIDOWvM=;
 b=fgj8RTLMsRjJUcdMlMYicCj6YbJR3HxGk7+pk8OpAbxhXBnJy4FbzAGTsUL20VU27zGSStYvV5ePItiRLHkBJy+pWLYcGbcnL2/tycAx5zlUmH+SFc5jyFCeEVc4dO7SUxuS6sJJE7klQPpDE6LDHqHaup1veLW19REO5xcFSntBkMDRmondNH+c1pR/F3TiiimGdk3Nkg8O+kPJpMrtYEWZhLPrsrOc/l56KmcllvACNI/zT5zKos41KyzxbK2y8pQGRZJcrGlsWfpNM51C1exfjJQbwn6Ey1TW+A5fhv4w6VUKtB9T007KfdywvTbFeNs+5vZiYcXi7lx988ef1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SA1PR15MB5258.namprd15.prod.outlook.com (2603:10b6:806:22a::12)
 by PH0PR15MB4815.namprd15.prod.outlook.com (2603:10b6:510:ac::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Tue, 17 Dec
 2024 12:19:36 +0000
Received: from SA1PR15MB5258.namprd15.prod.outlook.com
 ([fe80::a29e:a332:eb15:993c]) by SA1PR15MB5258.namprd15.prod.outlook.com
 ([fe80::a29e:a332:eb15:993c%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 12:19:36 +0000
From: Wei Lin Guay <wguay@meta.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
CC: Wei Lin Guay <wguay@meta.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>, Dag Moxnes
 <dagmoxnes@meta.com>, "kbusch@kernel.org" <kbusch@kernel.org>, Nicolaas
 Viljoen <nviljoen@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, Leon Romanovsky <leon@kernel.org>, Maor
 Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Topic: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Index: AQHbT6O5Loc/d/3VGEWjEKeLiKCgu7LpIlYAgAE6MQA=
Date: Tue, 17 Dec 2024 12:19:36 +0000
Message-ID: <924671F4-E8B5-4007-BE5D-29ED58B95F46@meta.com>
References: <20241216095920.237117-1-wguay@fb.com>
 <IA0PR11MB7185FDD56CFDD0A2B8D21468F83B2@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7185FDD56CFDD0A2B8D21468F83B2@IA0PR11MB7185.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5258:EE_|PH0PR15MB4815:EE_
x-ms-office365-filtering-correlation-id: f69ba188-a026-42b4-fe4a-08dd1e95124a
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OFYrUEhZNzZJNHBYUXhLR3YzUHY1dEl1bitKWk1pODVWY0Fsa0o1VktFNndz?=
 =?utf-8?B?WWFJVSsrSFdFWkZ1R3JxNEhTUHpMQlFtcnU4K3o1b3B3UXMyekVTMzRQeDln?=
 =?utf-8?B?S1hqWHVobk1iS1RrNEJuY05XZUovVlhqcWVoaHEyS3hmT1F4NnRuK0puZ1F3?=
 =?utf-8?B?T3ZpZFJ5bnVJT0Y4T29ycGZVcmlEVUVZTnYvcjBuT3FYbjY0U0tSRm5pamQ0?=
 =?utf-8?B?SmFwZDVhb2dVdVJSZzBMdERPZWVtRStQbDJOSWZhSmQybmJmcG9wR3gyNlUw?=
 =?utf-8?B?WFZNellLYUdpMzRsM3Y2Z1FoTGFlQzVOdzFwVUJaMmNyczQ1eVZoMGFmOTNx?=
 =?utf-8?B?WVJZWjFpaEJJNTErbHhKNlVMWHRZTmNBYmZORmpPZ1ZXWEtjOWpKZU9qWStZ?=
 =?utf-8?B?RHowdWlCUFN2L05lK201cEpkSDMrNSsyNk0xSVlSUEppekdlUkNuN1JvQ3hs?=
 =?utf-8?B?ZG5Vd0tzN0tKekZIc0pRcmJtREVPeEhSQW5SeFNKMG9EbUFsRmlMUTg0NHUv?=
 =?utf-8?B?QWg1dEduSHJVRU5BYmpVcmgwQ1k4UEd5NUZkUXJnU09jY3E3aHNsL0JHQ0hF?=
 =?utf-8?B?UmRlVDJHRTZhZHl2ODZ6WFV3Z2Rvd0c2LzA1Q2pJazhXWkkrYnA0WlFCYVNv?=
 =?utf-8?B?OHd2RTB2VkN2WjFJNmd6YXJLcG90ckJ3bHFXeXZFZk02K2dpaTRLVUpKRlM0?=
 =?utf-8?B?QjFaaFlLQWhQbWhKM1JtZzdvWG9ncDRBN1Vpay9YcTZYWWlqNzdhVDc3dUVI?=
 =?utf-8?B?emtBanJpZG9KSEVLcFgyVjhGZlRmVzJyOGxZVmxvc0hYdmJGYXBUN1BVZEk1?=
 =?utf-8?B?TkM2K2o5WDRHVW03cVRXdGJkNk1qVUxaSEVzNzVseGxmaEM3aHEvY0FUNll4?=
 =?utf-8?B?NW5OUTVHb3ZvRzJpSG1WUXEvQzRrb2R4WjFhTks5RDBrL2tHSG1IZjVQemF1?=
 =?utf-8?B?R2tLR3pjQy9JczhTcVUxQXJ2ZktaYU9SSytoWEcyK0JvQUhMc1BGemlGMitn?=
 =?utf-8?B?MDNRZzkwUTlvQ0hURkNtb0YzZ3YyWCtnN3k4VFMyMmRIVGMxcUN4NE54c0Jp?=
 =?utf-8?B?YzFvWXZkWWdCejZtUzRXWDcvQmxXZXVROWJPNzNVVDlmWVM3eVpydTdCSVdL?=
 =?utf-8?B?THg1U0ZNUnB1alEwNzVUTWJadVlRYXpwNlQrcjE4NUY5NnErN2ZuZjhVOG40?=
 =?utf-8?B?VXhiczd6YjUrU1FHUjFxY2lNcUFUVTBqRm8xY1lEN0xBMHFEVUlCN0hab1BO?=
 =?utf-8?B?RU4xanRlSzY3bDBLRGFFNW5FNTZzbmExaEVUTEtjTjdHRjZwd3RFa1BvT3ZJ?=
 =?utf-8?B?TjBEblZiRGhBaytmeDhVajVQelU2bkNoT1ArMUI5ODYzejZtWUwvbGFZN2ky?=
 =?utf-8?B?ZldURXg3RmxRNnA1ZGxlb0tVendSQWtZR3o4S3Q3azE4UFlzb0RlRzgxNGdh?=
 =?utf-8?B?eGZDNjdvenZuNjEyaklZMkxncC85K2kza1RUcGd5S0RaRjF0YVFOL3NyZ05L?=
 =?utf-8?B?Yk8yL003MVptcGRuaXhDZ1pSN1J5bEYxNngvSHVaRXFjQ2R4ZHV1UHM1b2Rk?=
 =?utf-8?B?QXRYeU9IbVIwT1BQVENNTnY0QkJ2TWpBNUM4UFBLRVpyZW54emJUSzFwdHNw?=
 =?utf-8?B?T1k1MDVzUEY2ZHp2eGlxZ1BBSWZFUnhqZWlEREZXd05VdUpHKzJXZzNUQ2RQ?=
 =?utf-8?B?bUFNM3RmWDRoR1JaMVgvWkpIVVRvb0tSc3ErMFNNbUlFL3pzbHN4UHMwejVk?=
 =?utf-8?B?Z3N2UWFlWThGRjFMNVdyZk1xR3JNVktSaDJwSHlzbGIwYktjTHRlaEFtTC9u?=
 =?utf-8?B?YzRkdGI5eUI4dHVOS3p3aXJmQUhNeUpNenBMS0hDRkk3a2JLd053L2JoK0N3?=
 =?utf-8?B?VmhFTkZndVhaYnphQ0pkQWl4b05NdmdvY1NjbTd5djVDSjVuRnhUallCdW1I?=
 =?utf-8?Q?3cOMzZT6pNMxxgjcNd1Um8yIvBj+h0Xt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5258.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFgzS1VaU1ZOZWVrYzVkY1hWa1ZQeUF0Vy82ZWc4UjZsSm5RS2JzbjU2WjN0?=
 =?utf-8?B?eUxIbncxa3JIcHRoVDl6TUw1QTJIem5iWmpldVR4MlJVdTA4aXZrNUpKL2pS?=
 =?utf-8?B?U3E1M1ZrU01SSnlDcU1XT0hscDk1M2FBeG03WTBXMmpVOWxPSGJQbVg1Q2s5?=
 =?utf-8?B?b3RrbGM0cmdTUEZicjRJTGladGE2bEppUFgyb3pLc3M3ZWlSa0JJME5JZFNG?=
 =?utf-8?B?aTlBSFBtcENQQlZsenA2c2dyKzVMS3JneUxraDNVUCtZRVg1WG9jMVdGbkVZ?=
 =?utf-8?B?NTk2RGZlSThKMzgxc3pVcFpRYXYrMVdGQWRoWjYveWljK0cxbUJ5M2hRRXdo?=
 =?utf-8?B?d1E4eWVOOTFSakttVXJJWksxRnozYjRNRkVzMVdOWWs3TVcrVmNLc0hXMzdK?=
 =?utf-8?B?RmQxejgyNlE1RUY3dForNGw3N3pTczhHeHZiZVpEZ1ZuTitsWUxweWdibENp?=
 =?utf-8?B?QU1xNXVDOXdIbU5xMVpBcHYxTk1ydEN1NWEvYllQS2szUGNETW8zOHBWVFFp?=
 =?utf-8?B?MGhsYnFpUTVUR3RVeFlyNVo0QzB1UytadUVMRHFmNGVCREFHNFhQeTUzeUNt?=
 =?utf-8?B?WStJNUNoTlF6bmpHTHZHWjJmWkp6MzhIeTU1Yko1REhMRExKdGtwREhOemFu?=
 =?utf-8?B?TUVZTW1zVDUvVGJJL2FFU2RHNzJ6RVRQakM5Q295S3ZGTElVdnVxOVFDSmxO?=
 =?utf-8?B?SXBHd2FiZzR3cnpNd292SFNpOS9US2JnMS9wZldqRnVuYkprNjMvREtteE5X?=
 =?utf-8?B?aXpRUy9GcDk3R0J1dENzUDJFVUV6ek5XQm5jamNOdVJabVN4NlQ2Qm9PTW9Z?=
 =?utf-8?B?SWRrRlAzMGI3VzFrb2pIRU0xL002TE94Ym92aFBmcEZ0MjZTNSsxNTJDbVdP?=
 =?utf-8?B?dFpiOXRSMkNlQzgvcGZTYkFITEEwMUxrS3hhcnlIRDc4QU1CR1ZwZ1crendH?=
 =?utf-8?B?SFBjS2c0cGlrT2RvNmZNTUhvRnpEcjlPd0tRV1p1c3JUQ21zRkl4Rk12MUxN?=
 =?utf-8?B?R1VoSGZsUWJnb2ZHT0ttY1R2T3p0U0JNS2dsVVV0TDFpc25SM0tLeXg5SnIv?=
 =?utf-8?B?aE45TVlRRU0xL2ZVdFJXRW55cUJhSEVIZXpxREpOeFRsaS9wb1FjVjRTelFF?=
 =?utf-8?B?Qm5pNGVQNTMvcmZkcnp3Qk8xR00zMnhGYTB6d1ovUEtMa2tZb3JNVWxpR3hm?=
 =?utf-8?B?RVpIUGJyUjBkMWJ2MzM4NTBnUzA3NXltR3BkSUthSUJTSVBkaW5MSFFJVml6?=
 =?utf-8?B?SFlKUWJvbHZDZFdEME1qaTlDcW5wRlFDTGdKR1hNYnk1VFZqa1BXUTFyRUJl?=
 =?utf-8?B?U1ExNG9VSFdCNFpvZTJocndQSzArK3RCR3QyZnVQUXdTWUdhL2FYaDJyWVo1?=
 =?utf-8?B?NlB0TXlCT3BsMTQ1bGRlVUMrT0tlcFh0VU5uaGRpQXpmbzByZmZlVnFrYzl0?=
 =?utf-8?B?RE9JRVlabWhiNFVDVFAySldKWG44YUoxZUdQVlJwVmZpbXpTRnR0RXFWNkhB?=
 =?utf-8?B?Tldsc2NmQ2FHcGdQNjd3RHpzVUdYNVBKbEV0K2NrbUhpc1lnaHdlN3BpRWdH?=
 =?utf-8?B?eHk1cG9QMURvaDJsbGpSMTR1LzJJeWRTYjg2S3JEazVMUTM3RzgvTnl2NHhB?=
 =?utf-8?B?UkdxRU9rc0s1TFRnM0t5TE5QdlM3K2FuekdSakwrY1R2TGhLa1hnMzFOR3pS?=
 =?utf-8?B?VkNHUHZ6MEhRNUlyaktPdFBkZnQzOU5DQmp2VVJKV24yNU1FTnc2VWkvU01V?=
 =?utf-8?B?R01NYldjUlpsMTZCQmJzMjBXOG51c1lZdjdIMFhSN1ZrajVSTkpsNlArR1F3?=
 =?utf-8?B?bDlzSHJiOGRuOVJiNnVOTHU5RWs5V3pMd0k5TVJQQzhZWDJmSWhHcFRZZERj?=
 =?utf-8?B?QmkyQk51dnBiTk9ycWJEQi9OYndBZVpOTzZndTJtSDg2MlNKY3Y2dTBkRE0w?=
 =?utf-8?B?QmlDa0FaV2s2ZjVSV3YyMzNqcGs4T1dZeGQ4Z0NKR3F4TENwMWkvMXJVSmRK?=
 =?utf-8?B?UlI4S0haWGFHSEpOWTRZUzNmajJzbHBJRkFxZ25NQlNUYXRpaEJ4NVA4Z1M3?=
 =?utf-8?B?akxQRFk1L3JWWVVaalptVHJLdUlIVmxQVVFNQVZMTWNTOURPRzF0OE5qdmtp?=
 =?utf-8?B?L1F3MU9KbU5STTlyNlNBRWRRQTZMakpGUThPcXdWenZGVit5S1RZaWJxT3hi?=
 =?utf-8?B?Vmc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5258.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f69ba188-a026-42b4-fe4a-08dd1e95124a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 12:19:36.2096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yB8+puUbr6xKLvVrz2XWgK0hsZKwv4qVOjd+3Gtc5VJ+2hPECSs0VQHuTB8kgdV7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB4815
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-ID: <5208929DDE666848BE3848801C422EF4@namprd15.prod.outlook.com>
X-Proofpoint-ORIG-GUID: LR39ZpS5ymYRCPKwrscUlKhkgwF8pPQs
X-Proofpoint-GUID: LR39ZpS5ymYRCPKwrscUlKhkgwF8pPQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-05_03,2024-10-04_01,2024-09-30_01
X-Mailman-Approved-At: Wed, 18 Dec 2024 08:18:11 +0000
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

Hi Vivek,=20

> On 16 Dec 2024, at 18:34, Kasireddy, Vivek <vivek.kasireddy@intel.com> wr=
ote:
>=20
> >=20
> Hi Wei Lin,
>=20
>> Subject: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
>> through dmabuf
>>=20
>> From: Wei Lin Guay <wguay@meta.com>
>>=20
>> This is another attempt to revive the patches posted by Jason
>> Gunthorpe and Vivek Kasireddy, at
>> https://patchwork.kernel.org/project/linux-media/cover/0-v2-
>> 472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com/
>> https://urldefense.com/v3/__https://lwn.net/Articles/970751/__;!!Bt8RZUm=
9aw!5uPrlSI9DhXVIeRMntADbkdWcu4YYhAzGN0OwyQ2NHxrN7bYE9f1eQBXUD8xHHPxiJorSkY=
hNjIRwdG4PsD2$
> v2: https://lore.kernel.org/dri-devel/20240624065552.1572580-1-vivek.kasi=
reddy@intel.com/
> addresses review comments from Alex and Jason and also includes the abili=
ty
> to create the dmabuf from multiple ranges. This is really needed to futur=
e-proof
> the feature.=20

The good thing is that your patch series addressed Christian=E2=80=99s conc=
erns of adding dma_buf_try_get().

However, several questions regarding your v2 patch: =20
- The dma-buf still support redundant mmap handler? (One of review comments=
 from v1?)=20
- Rather than handle different regions within a single dma-buf, would vfio-=
user open multiple distinct file descriptors work?
For our specific use case, we don't require multiple regions and prefer Jas=
on=E2=80=99s original patch.

>=20
> Also, my understanding is that this patchset cannot proceed until Leon's =
series is merged:
> https://lore.kernel.org/kvm/cover.1733398913.git.leon@kernel.org/

Thanks for the pointer.=20
I will rebase my local patch series on top of that.=20

Thanks,
Wei Lin

>=20
>=20
> Thanks,
> Vivek
>=20
>>=20
>> In addition to the initial proposal by Jason, another promising
>> application is exposing memory from an AI accelerator (bound to VFIO)
>> to an RDMA device. This would allow the RDMA device to directly access
>> the accelerator's memory, thereby facilitating direct data
>> transactions between the RDMA device and the accelerator.
>>=20
>> Below is from the text/motivation from the orginal cover letter.
>>=20
>> dma-buf has become a way to safely acquire a handle to non-struct page
>> memory that can still have lifetime controlled by the exporter. Notably
>> RDMA can now import dma-buf FDs and build them into MRs which allows
>> for
>> PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
>> from PCI device BARs.
>>=20
>> This series supports a use case for SPDK where a NVMe device will be own=
ed
>> by SPDK through VFIO but interacting with a RDMA device. The RDMA device
>> may directly access the NVMe CMB or directly manipulate the NVMe device's
>> doorbell using PCI P2P.
>>=20
>> However, as a general mechanism, it can support many other scenarios with
>> VFIO. I imagine this dmabuf approach to be usable by iommufd as well for
>> generic and safe P2P mappings.
>>=20
>> This series goes after the "Break up ioctl dispatch functions to one
>> function per ioctl" series.
>>=20
>> v2:
>> - Name the new file dma_buf.c
>> - Restore orig_nents before freeing
>> - Fix reversed logic around priv->revoked
>> - Set priv->index
>> - Rebased on v2 "Break up ioctl dispatch functions"
>> v1: https://lore.kernel.org/r/0-v1-9e6e1739ed95+5fa-
>> vfio_dma_buf_jgg@nvidia.com
>> Cc: linux-rdma@vger.kernel.org
>> Cc: Oded Gabbay <ogabbay@kernel.org>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Leon Romanovsky <leon@kernel.org>
>> Cc: Maor Gottlieb <maorg@nvidia.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>>=20
>> Jason Gunthorpe (3):
>>  vfio: Add vfio_device_get()
>>  dma-buf: Add dma_buf_try_get()
>>  vfio/pci: Allow MMIO regions to be exported through dma-buf
>>=20
>> Wei Lin Guay (1):
>>  vfio/pci: Allow export dmabuf without move_notify from importer
>>=20
>> drivers/vfio/pci/Makefile          |   1 +
>> drivers/vfio/pci/dma_buf.c         | 291 +++++++++++++++++++++++++++++
>> drivers/vfio/pci/vfio_pci_config.c |   8 +-
>> drivers/vfio/pci/vfio_pci_core.c   |  44 ++++-
>> drivers/vfio/pci/vfio_pci_priv.h   |  30 +++
>> drivers/vfio/vfio_main.c           |   1 +
>> include/linux/dma-buf.h            |  13 ++
>> include/linux/vfio.h               |   6 +
>> include/linux/vfio_pci_core.h      |   1 +
>> include/uapi/linux/vfio.h          |  18 ++
>> 10 files changed, 405 insertions(+), 8 deletions(-)
>> create mode 100644 drivers/vfio/pci/dma_buf.c
>>=20
>> --
>> 2.43.5

