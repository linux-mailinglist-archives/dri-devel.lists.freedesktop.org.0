Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B1690F84C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 23:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A2310E0D9;
	Wed, 19 Jun 2024 21:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=marvell.com header.i=@marvell.com header.b="LGHau+Zn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 995 seconds by postgrey-1.36 at gabe;
 Wed, 19 Jun 2024 18:57:45 UTC
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com
 [67.231.156.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B4810ED94
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 18:57:45 +0000 (UTC)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J7SIuB023060;
 Wed, 19 Jun 2024 11:41:02 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3yutyc20ag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 11:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMIeW6XsO1nM+BvMar0kY1Vk1fvUVcZHdRBpmNPwk4KOXS4qY8AsaraXMThczYGaatImcJdpHGMc6u0UGHEJkt+Tqn4KOXRGqV2c2OEoBJIqpnFbpYNe4y3HgubJ3fU1MEpFJfSt26xK6tSuVl1lulsMFj74D6fPjeuh+n1qgh+yjzJ9+d3R+kObQ/19TPOJXXOiW6VB3IkK82FasmLih0r9Z2mGzDgqT1gj1nY1baaeCHTNUpVAdr4WXFpuo26MyGz7VnmAvp80V+xclOBhqXIT0iodpyd2dk29xRpR2Pm5SOK2M7/OInpKKXY+is6aG3QkV0ZWweDu43tlnWxB3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+f4V2sDIpziBhA6WhjqTRQrlcZqe0P/HU8IUPkmHpI=;
 b=S8rdQH7QTC/5EJHB16NmbU3Mfvdj/5Ba7WyiDF4pSAlQx98981bMN7TwZ5gOCxt/vNtNBLbpVXoK+dMmV8bOxe0hrC18I24B5RSvBkdsiPXpzGEF9MJ0ko8N7gGbV/UIyZQ68dD6SS1Vjy980aWDgBY7EYriSGaX9/O11hrVfQSkArxnNELkspS5k0o/uY/n8ntC//nvMCEr0X8QSYILyY+ThTFoiu6c+TiIXJkomgDaRKq91SxLH5WCJGbjJGx78T8lvaVtEQanHq4bNzJBfeEaOFKTMQG83Vy8JkIETfaeZ+rXUf60KkOB0ytuW1R5NoP/Xvpjmxjw2DpMUoT30w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+f4V2sDIpziBhA6WhjqTRQrlcZqe0P/HU8IUPkmHpI=;
 b=LGHau+ZnygMdkVQJycdazQiWb7auzwtYwDmxxtsa1yXLdsP6yLqqOyU3SMe6dsr2zLI0imtNunhflEABlvTl4GyY/TSuI5G+XyFm0TRfOVTgHPcK3Kv77hYJKsQ5T1ChRnlHS4K6hmWH0rw5vtbSVxV6223KDJNlz72MhsmDHgM=
Received: from BY3PR18MB4737.namprd18.prod.outlook.com (2603:10b6:a03:3c8::7)
 by CO6PR18MB3906.namprd18.prod.outlook.com (2603:10b6:5:34c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 18:41:00 +0000
Received: from BY3PR18MB4737.namprd18.prod.outlook.com
 ([fe80::1598:abb8:3973:da4e]) by BY3PR18MB4737.namprd18.prod.outlook.com
 ([fe80::1598:abb8:3973:da4e%5]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 18:41:00 +0000
From: Sunil Kovvuri Goutham <sgoutham@marvell.com>
To: Omer Shpigelman <oshpigelman@habana.ai>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "ogabbay@kernel.org" <ogabbay@kernel.org>, "zyehudai@habana.ai"
 <zyehudai@habana.ai>
Subject: RE: [PATCH 13/15] accel/habanalabs: network scaling support
Thread-Topic: [PATCH 13/15] accel/habanalabs: network scaling support
Thread-Index: AQHawng6BvachsQnLk27jcqmgFU76w==
Date: Wed, 19 Jun 2024 18:41:00 +0000
Message-ID: <BY3PR18MB4737D95E4D629E5B388BEB86C6CF2@BY3PR18MB4737.namprd18.prod.outlook.com>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-14-oshpigelman@habana.ai>
In-Reply-To: <20240613082208.1439968-14-oshpigelman@habana.ai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4737:EE_|CO6PR18MB3906:EE_
x-ms-office365-filtering-correlation-id: 847b807e-c1e1-40ef-6df7-08dc908f5d82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|1800799021|376011|366013|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?WG9uc1lJNFZkWCtpaXNraEtqZDhtVytrUUNWZWg4aXgxZkRtVGFTQjdmYVBj?=
 =?utf-8?B?U0lzTUkxLzlWcWNibTVwK2ppcG9jQjJrZWtFNXN6NUxNR3pOdURHYjlVRWFr?=
 =?utf-8?B?WmZuU1QyUEs1ZUxIV0o2REVrL3d2ck43NUk0a3lnOXNidDRYSjg4YWdqQXFu?=
 =?utf-8?B?ZnkyUmsreng1ZytRRUVrcFlFOEF2THZhSzloVDJVKzhlbzNhTi9hVEVqbmRx?=
 =?utf-8?B?T1VLQ2pTcjVXSDBlbDIwUGdFRXczWEQ1Nys5Y1lSdjR3NlFkbHZOOEYrZ3pF?=
 =?utf-8?B?TnM3alhacndzbmF6c3hCZktMc0dLb1p6MmpXdENhK0F6Q3NXL3ZLRWxjYWw1?=
 =?utf-8?B?S09jZFE0cEpKb2FrTzNNTVI4eElKVEQ5YTFraTBBQWVEMFJTcTR1TWNHczNJ?=
 =?utf-8?B?dEhHTmNJeFZ5TnYwZWNQK1d1VUdhcGVrMlk2L2lzdjYxOVg5aHRsVlREYzhx?=
 =?utf-8?B?d2lWZzczcDFqUDRnMElXWDNFZyswWXI2MXpuQ294ZjU3U0t6QVl3Qk55YnN3?=
 =?utf-8?B?Tk14OGZxU1l5dWg4VWk4elZTMW1tbXRkbzlmZ0szeUE2SVJLQWdWNW9Obm1a?=
 =?utf-8?B?cVNwaEF0NkU1VGlUNXlaK0N2d3ovdTk0SXJ1NE9vZ1A3dzAzd3EzQVk4WnEx?=
 =?utf-8?B?R1h3Nk1RSlBWVVJLWXRSYThtZjVoaVpTUWlySjJwaWx6blMrMlVSWVRZbHpl?=
 =?utf-8?B?VHVDQUU0Zml2L0NzaTdqMHVOK1NOZTY5VlpWV3hiUkVvbzZZdnA0SjVKRFE5?=
 =?utf-8?B?SWp1c3dLRFFlUHRoY1Q5VG5PekFFSVYzMURCcWJNcUZaN3NnNFRjck50ZUhw?=
 =?utf-8?B?ZWh5VXVNWXZzT05La0tVV2IzNVlJTG1KaFlmbnVMYjduTGVLSzJzb3dIbnIy?=
 =?utf-8?B?TVBtdVlLUGt5QjJmK205U3hlbTlQN1ZEMFJYS1hRQ0pveHRJajkvZUNHeDhp?=
 =?utf-8?B?dlFpSVdhb2JDRkNvbWpkckQxOWVZUk1DcVNKT1FUTHplMjZsbk1ub1c2NWwx?=
 =?utf-8?B?a285dFRlc01OYmhNa1o4RFNWL1hLaE5sYWFVcktldU1HbVlxdHJDL2RXZURt?=
 =?utf-8?B?UXdJODMzRmtsamIwbzNpaURWb21sa201SlZURkFSeUplNjV2aUJPSU9ldVlw?=
 =?utf-8?B?aGdkeTltVXZrRkJ0dkpMYit6ejJQK3JBVFBxYzMvd0xoN29ubVVma2YrRExk?=
 =?utf-8?B?VDh5SW93cGlVSWp5NWV2WjQyeEphbzhMK0lJMytkdzc0L2VTRHJ6alQ0LzNz?=
 =?utf-8?B?RUt1aXhPUlJ6SkFybHFqSlM4SFdjS01uRDZNeW14Q2VOVzVSSU9GZzl1L3l3?=
 =?utf-8?B?WTdWZXRNL0V2d3dZQ2ZONktqNkxaMHdodGpqUlpvTkZtaTladDEvcnBycFRw?=
 =?utf-8?B?a0lJM1ZubXZpQVUyWTlzcDJFclltYWUyWEpOSFZtdzdYT1hGN2dTLzkzSW92?=
 =?utf-8?B?NkYxWm1qWmVZeTNQcW9nSUJ3M1M5RC95NGNDbU8yVkhTSjFlZERTZEd0bDRG?=
 =?utf-8?B?VjhpZnIvNkFxK0lQQkIvMWVva2VodFp5dytNZW9jaU8yd2crcVc4bVJ5SkdV?=
 =?utf-8?B?WG8yUEtsRXRYRU5MNUVrMVp4aE1iVk1IbzJuelZYZE1KdjJ4cG4rUzcyRHZv?=
 =?utf-8?B?aUhFeFNpbGVGL3VlaGorRkhqZmlpWWN5ZFZwK1oralhvUU9VY2IrU1RwZzhq?=
 =?utf-8?B?dXRUNVNjMndCcmlPQTg0cmJJbU44TlNOeXB3L24ybXAzMW9ka0YySGg0TFo1?=
 =?utf-8?B?OFpmbWlrL0dZK1NwdHFrU0ZTV2NtcG9vcWg1ZkpjcldMMU53SVJMRzJxNWwv?=
 =?utf-8?Q?T7YBNqloMnC34e4YKVvZ4RLpRrfXPLsRTClD0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY3PR18MB4737.namprd18.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013)(38070700015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2N1Tys3cG51Y3R3Z3d3ZWxKQ0xYSWFhbVpKejlHQmNxYXVabXl4MlVUSFRT?=
 =?utf-8?B?d2xsZjF2STFMWTlQZjZBRlI1L09PeXBZb0lhOGQvQllVM0pOY3dKNnZlNTNF?=
 =?utf-8?B?ODQvbU9DZU1GMFdQcHVRb0psK2tNTVFKZHlBcDBhbVRlNkRucmlwcHN0K05V?=
 =?utf-8?B?dmpQQUZucHA4Vm1xSTc1T2VjWHhNYnMzUFFnYjlBYjFIS25vSjJFN21sUFVM?=
 =?utf-8?B?VE16cnZ4QU1JWStFQXBCVi9lYlpmMDhEeG1mdFFGS2luRHVLS3RJT2tqK1pL?=
 =?utf-8?B?MGxJZ2FhWldKdnVLOUd1RlFmMDc2OVBEM0E3L1NlTHMyOGhmaC8yYnVaNy9a?=
 =?utf-8?B?eDVFMVE2ZWwzYUJ3TjZzck5KZkVWcmFWRWYxSWd2S212Z1hNRE1jTm9zdVdr?=
 =?utf-8?B?aTlhVmhrUWZKZ2U4WHdyU3JKOUNDc0FodjdsblZGS2JEdi8xMDBBbk5zZ1N5?=
 =?utf-8?B?dFBZSG5EaXpEVHhKR1RDSy9zY0luYjdRV1BBaGJoRjh2QXkwbXVxNEY3Ynp0?=
 =?utf-8?B?OEw0UW5VVjdHcnpVVWpQL2ZXTG5CRnpHRk5OaWZuOTQ5NllZeFNLVnZQZVMz?=
 =?utf-8?B?cUdsV3lxS0VmWFNtQUo1SGV6U1I4eXFCOHgyWnVmeENGSUNYdDlSWEJWODhw?=
 =?utf-8?B?YlpFRTNEdThxU083Ni9SSU9ycnNDUVZraFl2QmFpbmxQczVoNEFWaVppZ25i?=
 =?utf-8?B?OFFhekkxUGFZTmM0bU1qLzgwMzV5elMxcTNZOEJONDZZcElpTUZiK1U2M2Vq?=
 =?utf-8?B?TmMrZk9oYU8wOVphclNJcVBHUlhFWFB2T1FiUEdRQ2d1ZmUrdkxPTm82MHla?=
 =?utf-8?B?eEg3bXI2NmovWmNZbzBTMXpCLzYrZXJXVmxneGt4S2hxVXorQ1Ric0ZFU1ZQ?=
 =?utf-8?B?Mm5XczQ3RENxVkNMREVRZWwya0dJbDhIcU5WMGoyNCtFYkFpWk1jY01Ba1Vu?=
 =?utf-8?B?R2Q4RjhjWWsySGNEeStjeXBlMUJadWViOEFpS0VJSmhJbDgzNitXb2ZudzFu?=
 =?utf-8?B?WG11WmVFOHpTamM3eVFrZUhSUTM1STk0S1ZtVjJmZG96TnpBVXRFdDlJZFZN?=
 =?utf-8?B?WXQzV3BPRzZtdmFCVmZYVDRraHJETVB1dEM1WTRncE9CVm1vZnZhZ0VFNEpD?=
 =?utf-8?B?VHROelBwUXl5bG1DQmJMcGdFU09kSCtRMHdsRTZ3ZkJySHhQMk9Yb1F5dDc4?=
 =?utf-8?B?RU84dFFCRllkU2NDYjN0NXdXSk0ycDVFU090L3ZXb1oveTZ6OGRlN1JSbjZt?=
 =?utf-8?B?NkJJdzFWYXpoMlBlTjllQ1RVcmk3NzZLenFidWRVbUR2Q1o4VTgzSUtzMCt3?=
 =?utf-8?B?c2pCYTFJNHlXTnlHajRCb0d0aUFuVGFpdWdWNUM4N3hZSjdyamdPMXZPZFVY?=
 =?utf-8?B?QzI1aG1aUzRET0F5YUduTCt6bzhvM1M2S0JrYWdyaTl0L0hRRWZYRXAxU1RY?=
 =?utf-8?B?dGNTUTkzRm1Ec2Vxa0FJNjNBbTVqY2h3VkdXcDJWcVZWeVBWbmswaGhQbDRZ?=
 =?utf-8?B?bGpxbnNVeG1LQmxlZkU3NWRNeXdnc0tSTWFpeU14NzhoVU8wc29NVTlHR0RD?=
 =?utf-8?B?MGdVVWJhdnJ3L1pZZzV0QTNWMFh1V1M5VVh6eU9yN09VTmVGcVMycTFxWkZT?=
 =?utf-8?B?L21McmNsVVpiREVLTGUxbGVtdkprZE1DOFdRQVdwNFcwd1JaMk1OVWlPMWZ3?=
 =?utf-8?B?S1FBV1hsdGREYWMwVURtT2lrMTV0UjZnYVRlWFVBZFpLSUYxd293WXpQR2dV?=
 =?utf-8?B?Nmh2bXkyV0VudDlGMjQ1aE9OdGtpZHZzTjZySWxCMU9NcEVQVUxNNG1sNkxU?=
 =?utf-8?B?SjMvYjdvWDFJZlQ4OEsxS3R4ajYwWGd5amI4empVQzRWMkdMbUZVSUZwZGRx?=
 =?utf-8?B?RlFpcFdWRVNqeTNycmwwZWlUNisvTUE1citqczBOSWpGcDA3eDZrWTBuVkNO?=
 =?utf-8?B?UDY5SFdNVWo4dHZWT0lKQVRzR29zZnV4VnBMWFJqVU5UOEpWbTBZMUxzeVpp?=
 =?utf-8?B?SWhVVXRFNTVkVXBnd0FYK2tHV3MrQXVhKzZHT2J3WnQyaGl6SVhDVmx6OWtM?=
 =?utf-8?B?ZDNLOFVqUXVkTnpSRmlvZEdjWmEvY0dxeWNPNUtFQWVpMk41YVMyMysxVWFO?=
 =?utf-8?Q?8L0y5531nYaj/PDyFi2vcY21m?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4737.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847b807e-c1e1-40ef-6df7-08dc908f5d82
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 18:41:00.2983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJe6Nk2K3fHaweAV5QIBuMf9G00Ct9xI6Iu4qn3wDyeeWhZ0ssdKsvLe3XkGsdRpsTtsTPUBJ5hpjhFVyUgzSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB3906
X-Proofpoint-ORIG-GUID: Qe3Qgcq75TQbTkdYFeUmUppYclueODFD
X-Proofpoint-GUID: Qe3Qgcq75TQbTkdYFeUmUppYclueODFD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Mailman-Approved-At: Wed, 19 Jun 2024 21:13:26 +0000
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

Pg0KPkFkZCBjb21tb24gc3VwcG9ydCBmb3IgQUkgc2NhbGluZyBvdmVyIHRoZSBuZXR3b3JrLiBJ
bml0aWFsaXplIHRoZSBoYmxfY24gZHJpdmVyIHZpYQ0KPmF1eGlsaWFyeSBidXMgYW5kIHNlcnZl
IGFzIGl0cyBhZGFwdGVyIGZvciBhY2Nlc3NpbmcgdGhlIGRldmljZS4gDQoNCkEgMTIwMCBsaW5l
IHBhdGNoIGRlc2VydmVzIGEgYml0IG1vcmUgb2YgaW5mbyBpbiB0aGUgY29tbWl0IG1zZy4NCkNh
biB5b3UgcGxlYXNlIGVsYWJvcmF0ZSB3aGF0IG5ldHdvcmsgc2NhbGluZyBzdXBwb3J0IGlzIGJl
aW5nIGFkZGVkIGluIHRoaXMgcGF0Y2guDQoNClRoYW5rcywNClN1bmlsLg0KDQo=
