Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90805CB938B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 17:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FCC10E760;
	Fri, 12 Dec 2025 16:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=akamai.com header.i=@akamai.com header.b="TZyiYpbg";
	dkim=pass (1024-bit key; unprotected) header.d=akamai365.onmicrosoft.com header.i=@akamai365.onmicrosoft.com header.b="dj+Uj0MP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com
 [67.231.149.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC08110E760
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 16:06:16 +0000 (UTC)
Received: from pps.filterd (m0122332.ppops.net [127.0.0.1])
 by mx0a-00190b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BCBjbNv3985075; Fri, 12 Dec 2025 16:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=jan2016.eng;
 bh=yjXxFAitDe20QYN8TcL6+cGDGMe+9jqsCJZclZGUsrM=; b=TZyiYpbgxJ/6
 jawFKFa12+EYM+K2OE21XPjyX2AuTOrbv0VbMf0+Z/p5Kryc8rnWSUl2f8hkidhN
 C+85dOjiQDa2AVVgZ6rk6W43ONWA0jJCiMhdVyxAHSf7QsRGg94r4lFkgJIBNFvD
 coJLSFrnW8bjsQz+9mfbjeFlxANOUGMJcfDsl4flh93TRmJFqS72NiumgfejgEJQ
 oCsJPJl++14ZvygLQXS7iDAH5rZwD6KlauvY2lDYmgWQEvd8lNGfk8SJ2QK0lRYo
 oqPaM+l/IREAL15LznSJgJRuUhkGLpxtXKzhi1GpsfrViAe0jNFvGM6EeNLAxyWJ
 yQM6TzyHIw==
Received: from prod-mail-ppoint3
 (a72-247-45-31.deploy.static.akamaitechnologies.com [72.247.45.31] (may be
 forged))
 by mx0a-00190b01.pphosted.com (PPS) with ESMTPS id 4b090d3b6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Dec 2025 16:06:10 +0000 (GMT)
Received: from pps.filterd (prod-mail-ppoint3.akamai.com [127.0.0.1])
 by prod-mail-ppoint3.akamai.com (8.18.1.2/8.18.1.2) with ESMTP id
 5BCFvjJb015077; Fri, 12 Dec 2025 11:06:10 -0500
Received: from email.msg.corp.akamai.com ([172.27.50.221])
 by prod-mail-ppoint3.akamai.com (PPS) with ESMTPS id 4aw2933h00-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Dec 2025 11:06:09 -0500
Received: from ustx2ex-dag4mb8.msg.corp.akamai.com (172.27.50.207) by
 ustx2ex-dag5mb4.msg.corp.akamai.com (172.27.50.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 08:06:09 -0800
Received: from ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) by
 ustx2ex-dag4mb8.msg.corp.akamai.com (172.27.50.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 12 Dec 2025 08:06:09 -0800
Received: from CO1PR07CU001.outbound.protection.outlook.com (72.247.45.132) by
 ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 12 Dec 2025 10:06:09 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIFV48jsD0Jqq4u9D3dO0CD9oqZVwK+uvxQXbZ0XQY8oxo5AO3GY53bQkFi3fJ7eo/KmXm61MvXxTI5tQGRC7EEYGjHNJjQoIFmgAeWFcw5uc4OiljmbiPXOdGy4hXd44CdSMBx/7UhV4/wDSnas415mSMnHebkbHEdil5EWXqX9wPcCggFPUNNN2PtCvk7CZHaWK0mP2zp1NWtRrM83Yrws0qaJhs0b50K0I3pocG/64WBcHJ6ZG3X+MTjIX4iuBS/ro0gTLyocAnv7eXsTIPsEkpTazzhy1+wR99FoXIi9QzUQBEOLY1txBFo6OX1he843hh0AzLZprcZEaYTuhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjXxFAitDe20QYN8TcL6+cGDGMe+9jqsCJZclZGUsrM=;
 b=Rx7bZc1Nlb20GMnRwMSneK2hjmVv8FNJdhfxiuIHP92XrTw5HAwzJorGaVeI0hEWHJd9fqckxrWh9xqFZvWFuEUAGpEhqfG1l5cq22m2MTJ1FBLXXBqZLiplEaYN9n54i60ntx8EbIiKYbyEOCGYz0RCx1v33vGvAC+DLpFW9Hxcbx3vyVyUgltgYkof6oP2pIGGtikvPkyTLabfoKnBJSzhef2iNzIKp+zG24L4A8EEwn1LKK4trCTxh+pnLTxCN6Td/306W/M42+Q/puaV+GB7+ultHxFPbyB6AaDkN4ZqjXG/LjV9XksdGbLyMjKQ03l2zdQq4a55PjzuR+MlRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=akamai.com; dmarc=pass action=none header.from=akamai.com;
 dkim=pass header.d=akamai.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=akamai365.onmicrosoft.com; s=selector1-akamai365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjXxFAitDe20QYN8TcL6+cGDGMe+9jqsCJZclZGUsrM=;
 b=dj+Uj0MPhnVG7KjlPoiuDnX51cd7rI/aGkgKmoh5sdERGpqLEu+5dYXfSiXBF3Kk3oANGhxt2GDZxEChXZyGxK5jItj2xskpLMIw96b0lRXTxel9+lOiCCvJuCIJmFGtkuzW72SjKhmUl4OZmsLGtGv+IF1CzDZEIxqDSHB2cNM=
Received: from SJ0PR17MB4870.namprd17.prod.outlook.com (2603:10b6:a03:37b::13)
 by DS4PR17MB7880.namprd17.prod.outlook.com (2603:10b6:8:323::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 16:06:06 +0000
Received: from SJ0PR17MB4870.namprd17.prod.outlook.com
 ([fe80::ff21:c3fa:86eb:2f36]) by SJ0PR17MB4870.namprd17.prod.outlook.com
 ([fe80::ff21:c3fa:86eb:2f36%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:06:06 +0000
Message-ID: <81ba7b82-facc-4254-b0d6-439146a42a4c@akamai.com>
Date: Fri, 12 Dec 2025 11:05:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/31] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
To: <jim.cromie@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <gregkh@linuxfoundation.org>, <ukaszb@chromium.org>,
 <louis.chauvet@bootlin.com>, Bagas Sanjaya <bagasdotme@gmail.com>, "Linux
 Documentation List" <linux-doc@vger.kernel.org>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-17-jim.cromie@gmail.com>
 <fcb2532d-5627-4bc3-a990-ed361b56ccd3@akamai.com>
 <CAJfuBxxeaZDY+-f=7R0RSnE7FAyPtB_O+S3E4L_OckKNRK+7ag@mail.gmail.com>
 <9f36429d-1d6e-4501-a092-fbf45254d116@akamai.com>
 <CAJfuBxw8xV2RrbTWpmQFpCpiSp9A7KCLP74T_bu+4mxBROf1sg@mail.gmail.com>
Content-Language: en-US
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <CAJfuBxw8xV2RrbTWpmQFpCpiSp9A7KCLP74T_bu+4mxBROf1sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:208:120::22) To SJ0PR17MB4870.namprd17.prod.outlook.com
 (2603:10b6:a03:37b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR17MB4870:EE_|DS4PR17MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cd7d6e4-6278-496d-56bf-08de39985b73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3RJV2dITlRsVmw3UCtiN1NIV0s3RVV4L2Z1MU1PR054cEliWmM5WFc0SkIz?=
 =?utf-8?B?anN2clFMbVJjS0xvayttUEVmQ1lndDYrQlhzeHR1RzZUdXgxYlZKOGxmUzJR?=
 =?utf-8?B?MitENTdkZTJTV3g4clFZWmtmYzJaY2VwRnQwL2k1TW8wMnFKdTlOUVNjdFNo?=
 =?utf-8?B?V2Zqd05qMGpBbUxnbGlhRVM4SnhJejE0eU00akhqUUtSQ0dJZVQzVG42Mys5?=
 =?utf-8?B?QXNIWVB4b1dCMk4wZ3hGOTdFbWFHaWVHNlFocXhYU2VjKzZVTW1NQUFjZldI?=
 =?utf-8?B?S09kbW01MUpOUyt6TXVnc1hmcnorbEVkcTRmUHNvaHhKSDg5OTZ3UUNuMHBW?=
 =?utf-8?B?NTdUek43M21lNnNJd1o4M3ZqckZ3dGdQc2pidTYwL1piRWZCWjZiREU0YzJl?=
 =?utf-8?B?dStXdGtnNCtQT01UanZlTEc0RWcxNjZ2ZERGK3hkRFZkUVFHdDh4cEVpWGFi?=
 =?utf-8?B?NDg5cFZiSEYyd01EVlR0VkY5WEdEOC9peTBTelRLVGZMamx1MWJEelJYeDNR?=
 =?utf-8?B?Vkk4SStYd0EzSlpSbXdWc2ZRREFQZmFraDYyY3Uvdjc4Z1FYS2gzTms0SDVE?=
 =?utf-8?B?OVc1emRYVlRvT2NTek5UOXlUNUlUSmJPNjJ1QzhjSnY5bTNOZTgxMjNpNTlq?=
 =?utf-8?B?QUVPenJzRHRvWXZkZkZ2TzNWcjFMdUlEaWdaSzVmL3psaURMbkxXeDZNZFcy?=
 =?utf-8?B?VklSRlZpNmMzR1c1UW1xTzBnd1V2eThJeWZGNHk4cWRxdTBibitoM0JZc1Yr?=
 =?utf-8?B?UW8zdE4vSnRoV0tzWFR3NHZFaHVLN1lUcmQ3OGVLR255UjdGeTZ2N1dqVVFa?=
 =?utf-8?B?WmJTUmVidmFWb0Y5OS9hdnFjczVmR1dxcGlqMEx6UDhaTEFXVmdIMkxaUU5w?=
 =?utf-8?B?b3BGNzM5eXN0YXREM09GRU14NmFGeDhMQ0NJVXA2L21SMWhtbHdTRjZhTDQ4?=
 =?utf-8?B?VUlWL0lkdlVLMjlkRFVvcFVUV3dIMHN5NzMxV3VYcWI5NXo0OHdrZWtjc2Vu?=
 =?utf-8?B?TFI2WUYzTjhuT1R0T05Yd2ptbnU5cDg5OHJlZy8xc29Xdk9hZWl2dUpxQ3kr?=
 =?utf-8?B?d0lHcVk2YTJmQkRiNVBMSXNza1p3bkI2SUJ0dTVKcWR3WFE3ZGROdUFzWGVn?=
 =?utf-8?B?aXpKTFR3WWE1UEZYUWxHanYwQWlSTFRIcjdtenByTXdoeHVjYjc4VG84cEYx?=
 =?utf-8?B?QUQvcmE4T0g4elQ2ZmZRZWdZTUVPOWQ3Yk9LOE1CTytaWFZ2WFcxZ3Ricndi?=
 =?utf-8?B?SWVRdTZuQ3ZCY2Z2czVzL1U3ditMbURPU0gwMWZraFdYL28yNmZWS3VOckUv?=
 =?utf-8?B?VXZocGNUNEc1aVZNZWxUaTlQOWQ2QkNud3B0aWh5bVpCYk1XUGtFcVIwUFJw?=
 =?utf-8?B?ZUY2NklHYXZFRys2NmsrV0NhdE9oV2MxSHJPTzF2WEhEdU9tTHM5VHFtZm5D?=
 =?utf-8?B?UldmSXYxcW1uWnNqcEdxTDNhZUhjcWE3dDd4cTBSci9kVGZxRjB3UDJGRnVF?=
 =?utf-8?B?dnp1QXp3Y00rbjRGNE5seWNZVDFOQXdFa2NYWmVPQ3JIRkp3NzhycEN2bEZx?=
 =?utf-8?B?d2l3N3E0UVlmQXdBVFR6OHc5TVZ1bXcwY2lFUmRFaGpOcnFGdE1JRHpZeUhq?=
 =?utf-8?B?U1FXaVArT2dPLzcydjh4Q0hQK1lsbHhGZHZ2Slg2WVZoSFVvcjRQNytldDIw?=
 =?utf-8?B?QmkzNWNubmxZb0dSL3d3MG52KzNock9CRTltK3E3VXNkVmtrdU9xZkNqMElO?=
 =?utf-8?B?bWdhSzM0VDNDMWxsdVh4bEp3dkF6TGxPMEt1RXdGNWtWQ2Nhb2JKOXBHVkxW?=
 =?utf-8?B?OVNhQnNCYURUU29lcDArVHNiL3pBVUVXaGhwVEhPa0Z4Rk16WkhKZmVRQkZJ?=
 =?utf-8?B?ZFNhaHBGaG96Z0grREFrUTFhb0xpNnNDMWFpejdMMVBBU2trZDNTT09OM2Z1?=
 =?utf-8?Q?qaeETyfJzY+d5QxQ0E5xrHCb1r5R4vy6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR17MB4870.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0MwZE85K3c3WDgwNGR6Z3JVWnBlLy8zMlVuTnVDczg1bmZ4UGlHREZwcFgx?=
 =?utf-8?B?NFRrd1A1d092TThmSG9BTUt2Yk5mVnExampqWVlIUVBQdlMxdHUwbkYvdVVx?=
 =?utf-8?B?R3JwbTFzeUpiY05TcXlQSHVYVmFtV3VMOExDbFB2ZTQ5cmRkSzNtMENqN2lR?=
 =?utf-8?B?S1Z5SXBHcUVQM1RpdXBQeHRwTXhUYUVvRHpBdTA1emVwUnZtOEtzRzE4dS9X?=
 =?utf-8?B?cEg2RURkTld0NEZUd0VOcFZObGRyZUJuNXlocS9yNjhMdDlKRHp3ajZpWVVL?=
 =?utf-8?B?d29EU3hBOFRSRXUxQzJzVlZCZWpDcWhodHNVYUZ4NGNpS0RReThzVkRLZlQv?=
 =?utf-8?B?eVgrbGU4VnRiYS9WT2EyOXBxcHdaSXhuYWI0ekZiQ3B5Tk9jTlJOOGxTZjFQ?=
 =?utf-8?B?RGpFbi9JUGxReVF0OTZuZ0wxUFpzd2c3QUJlK1FNVGorN2cvLy9QRGxvRS9t?=
 =?utf-8?B?S0NndVBObkpId3JMdzR5NTcyL2VqNytnYzBLNDJ2TVgyRkZYV1psRlpuNFZa?=
 =?utf-8?B?ckRyaTZ0djBRd2NrUnd0VXNMYVhOZnVvMEdYelB2OFdocStnNUFqbG5IWEww?=
 =?utf-8?B?NVRvVFVBYVEzbkZ2WXJhbDNXZ3ZNVVVKRThOUFhWMWhYT3gzcFRFbjllMzJC?=
 =?utf-8?B?c0tpUVBmOEtnMzA1TE5DZS94TnRTcTk1VllLc2QzbnpkWXFvNkUrNUNHOGhn?=
 =?utf-8?B?a3l6K2o5Z2dNdkdCUllaTkJiRnB6M0tzT3A5SmVRdlhyZ2VzeU9BR3lkYzdF?=
 =?utf-8?B?cGVEaUQxbzBxOXZIbWtkOW9KSWQ1WGFxVmZpMTIzSSt3UkNFWXpoT0VCUjJ6?=
 =?utf-8?B?ZXJZa0lJdjRVcDRoODBQNVcrSitGWk5kL1pxTjZNOWg2WGE3WStmZEtIODJr?=
 =?utf-8?B?Y2hNR3JMcWdPSm1rS1loVmZocWhsd0Nia09xZWZ6ZGQwbGZaSERTOW9URS9l?=
 =?utf-8?B?b29wK0VidWRjcnpHTUQzZEswNkUyQkdrMkxaY0ErcnMrWTZRY3RUNGVubG43?=
 =?utf-8?B?RU1YaEpYVEZpZmJQWkJENC9HUVdUS3h4QkE1NnYzc3pXK01TSVlSUldFYmVH?=
 =?utf-8?B?UUxIaEtxclRXcnhSdVMyVWcySm02ajVXbSt6UldaRW5VM3IvRTU4N3I2QUd5?=
 =?utf-8?B?WDBLeFdnYW9IZmxYL1NsRDFlM1NVZlNjRE4wY2lWVG9UTXczSW1CeW1KZUZp?=
 =?utf-8?B?Mk4vMnhoNkg4ZUM3TE1FR3VHL3Nya0tmRUNrNndUNUlrNmtDV0lKeDJOZnR3?=
 =?utf-8?B?Yi9BWkNoUUlDVm9QdkhDOFllRnd1TlA0Y3NQMW9QNmJvOG45Rm5QekkxUm0w?=
 =?utf-8?B?aU1qY3pmNlhuQk9qWDRNL0VVd1plZnNEMTI5M21sOCtPUzhFUlNleGNMUWVK?=
 =?utf-8?B?QlE2RHBHV3VkUXF3eXJuSUd3WDhWMWRUZkVHRjNmN1RiZ3drSDhCQnhaSEk3?=
 =?utf-8?B?cXBvTGRaeWU0WlJreWkySXV1NVFrNkFackpyUlZodlVKMEpUVjJSRy9Bd2Vu?=
 =?utf-8?B?Z1RLMUF0RlZTcGd0c1FMamVia2Y4Zms0MmV3ZVRabjQzSFZFeXlBeUtZRWJv?=
 =?utf-8?B?NE1EeDVISEpKeGhHaUlhdEdoUVl1bnlleU9DTkVWMlp5TGxmc05aN1F4eVUw?=
 =?utf-8?B?akxuQ0RDazZUSzk2UVM1b3NZcEdSa3NTZytURmx0d29RNHhBMTlJeVVwVDFE?=
 =?utf-8?B?RU9RdVlkUHRobkk1dnowcy8zdnhjQkhFbWlaR2JBNlZkRDBYNjJrL1oxVUQr?=
 =?utf-8?B?L0srTmx3T2hSNkhMOHo5d3pQZk9BUFJJTE1zWmtSNDl3NlZmT3U4MFRtQUlY?=
 =?utf-8?B?Q3hBNGNLM3QzRllXMXI2M21GWnVDM3l1c1RjL29vV2NTUnZpWktTdTI1WXg5?=
 =?utf-8?B?RWxsY0l1Nlp4RU9wQ1NJaUlEWE1lbHA1dEVPdndwNmtaeFV5Y1dyVUtPNjhF?=
 =?utf-8?B?V1RTWDFBNWNKVElwU05xeC9PdnRnYlpwbCt4YkVNUWYzQmVEOHJjMnZUWWxr?=
 =?utf-8?B?TEdJRHhxTlIrWGNEc0lBZllQTWJ1OFpxWjlSQVRtMXRQdUhwbjBiUTI3L2xN?=
 =?utf-8?B?dFV3dHY1UUxUSGwybUtPVXlyd1lOMzJkVGNlVUpCaENuZU16dmo5emJxeDJu?=
 =?utf-8?Q?Y0AVJTFouOQ8fdn7HdTcO+Z25?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd7d6e4-6278-496d-56bf-08de39985b73
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR17MB4870.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:06:06.6709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 514876bd-5965-4b40-b0c8-e336cf72c743
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5sinhC5RmRMyZ5LwC53f3qk0nol/ccY1a2F2vo3QFBzanRJq+syEOesKHKLhtHPDRWZ/36uJ7ZMJw+MUeLmYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR17MB7880
X-OriginatorOrg: akamai.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_04,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512120127
X-Proofpoint-GUID: DsxoNFeq77xETB-9YaKnyMLFkkE5uOX3
X-Proofpoint-ORIG-GUID: DsxoNFeq77xETB-9YaKnyMLFkkE5uOX3
X-Authority-Analysis: v=2.4 cv=Yb2wJgRf c=1 sm=1 tr=0 ts=693c3d72 cx=c_pps
 a=x6EWYSa6xQJ7sIVSrxzgOQ==:117 a=x6EWYSa6xQJ7sIVSrxzgOQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=g1y_e2JewP0A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=X7Ea-ya5AAAA:8 a=xohOVwh3fbtTvgMsOFwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEyNyBTYWx0ZWRfXxgH/bIYXUl9i
 TOY3JWAuT1XAG97Z0GL88JDpNWtRRmO0bxw+QnWZT9E8efgAqy1kXEcjHIJpff8pD5CSc3jW/Gk
 SwF5h1DhDhwe6R6C+daHudNAKGtue4R0Cvwnk3hzj6k9Vj0vEg0+l+x/wzavEv4nl4Z+bQq7GQS
 3htTEYIA0ZYFKhsgFPdw6dpaRuYo4n2B9UgYzmK4XWRmUlQfyHVAuK9/qwO+/hakX1W1X4JiOxn
 KeV3rUjlV2ulBcDQB502syaotkCE5Yf9CQLMeaDeX5tHB85Q+gmC04o/13TBpv5GVHOfzwozf1l
 kzAGVjDc0/BeTpnN39mJlswO1De8hkVUHo1SdfLo7hs7PyI8gBxBXFSO1mblV26MWfUG+7awu9/
 P5xe8IAytYc/CxtryJ6qUZNzjMl3jvZ+pVHsynT2ag3RMSLDE22kKcyVCo8OBFbrdZVlcnkWLQ7
 y/EvL47IG2hHhhuiPtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_04,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512100000 definitions=main-2512120127
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



On 12/10/25 3:21 PM, jim.cromie@gmail.com wrote:
> !-------------------------------------------------------------------|
>    This Message Is From an External Sender
>    This message came from outside your organization.
> |-------------------------------------------------------------------!
> 
> On Thu, Dec 11, 2025 at 8:14 AM Jason Baron <jbaron@akamai.com> wrote:
>>
>>
>>
>> On 12/10/25 1:33 AM, jim.cromie@gmail.com wrote:
>>> !-------------------------------------------------------------------|
>>>     This Message Is From an External Sender
>>>     This message came from outside your organization.
>>> |-------------------------------------------------------------------!
>>>
>>> On Wed, Dec 10, 2025 at 11:43 AM Jason Baron <jbaron@akamai.com> wrote:
>>>>
>>>> Hi Jim,
>>>>
>>>> Very minor nit below about the kernel-doc ordering for args...
>>>>
>>>
>>>>> +/*
>>>>> + * Walk the @_box->@_vec member, over @_vec.start[0..len], and find
>>>>> + * the contiguous subrange of elements matching on ->mod_name.  Copy
>>>>> + * the subrange into @_dst.  This depends on vars defd by caller.
>>>>> + *
>>>>> + * @_i:   caller provided counter var, init'd by macro
>>>>> + * @_sp:  cursor into @_vec.
>>>>> + * @_box: contains member named @_vec
>>>>> + * @_vec: member-name of a type with: .start .len fields.
>>>>> + * @_dst: an array-ref: to remember the module's subrange
>>>>> + */
>>>>
>>>> Not sure if the odering matters for the docs, but it makes it a bit
>>>> harder read when these don't go in order.
>>>>
>>>> Thanks,
>>>>
>>>> -Jason
>>>>
>>>
>>> I chose that doc ordering for clarity,  the easy ones 1st,
>>> and @dst last since it gets the subrange info.
>>> I think reordering might mean more words trying to connect
>>> the pieces, and with less clarity.
>>> It does work against the macro arg ordering,
>>> which places @dst near the front,
>>> I did that to follow  LHS = RHS(...)   convention.
>>>
>>> Im happy to swap it around if anyone thinks that convention
>>> should supercede these reasons,
>>> but Im in NZ on vacation right now,
>>> and I forgot to pull the latest rev off my desktop before I left.
>>> so I dont want to fiddle with the slightly older copy I have locally,
>>> and then have to isolate and fix whatever is different.
>>>
>>> the same applies to the Documentation tweaks that Bagas noted.
>>
>> Couldn't you then re-order the function args to match the doc order instead?
>>
> 
> As you might surmise, the code was written before the kdoc.
> Since it is setting the @_dst, it feels like an assignment.
> Therefore the LHS = RHS convention seemed pertinent,
> and the macro args are ordered to conform to this.
> For the (pseudo- since its not /** ) kdoc,
> the linear explanation was simplest and clearest, ending with @_dst.
> 
> So I see these options (in my preferred order), please pick one.
> 1. leave as is
> 2. add an NB: that arg order differs from doc-order
> 3. change macro arg order
> 4. change kdoc arg order
> 
> If 2-4 can wait, I can do that trivially once Im home (in Jan)
> Doing it now, from here, will require fiddling with git am on the mbox.gz
> with which Ive had mixed results/troubles in the past.
> 

Hi Jim,

I am fine leaving this as is, but I do feel like we should perhaps do at 
least #2 at some point, to clarify things.


Thanks,

-Jason








> thanks,
> Jim
> 
>> Thanks,
>>
>> -Jason
>>
>>
>>>
>>>
>>>
>>>
>>>
>>>>> +#define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({                \
>>>>> +     typeof(_dst) __dst = (_dst);                                    \
>>>>> +     int __nc = 0;                                                   \
>>>>> +     for_subvec(_i, _sp, _box, _vec) {                               \
>>>>> +             if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {       \
>>>>> +                     if (!__nc++)                                    \
>>>>> +                             (__dst)->info._vec.start = (_sp);       \
>>>>> +             } else {                                                \
>>>>> +                     if (__nc)                                       \
>>>>> +                             break; /* end of consecutive matches */ \
>>>>> +             }                                                       \
>>>>> +     }                                                               \
>>>>> +     (__dst)->info._vec.len = __nc;                                  \
>>>>> +})
>>>>> +
>>>>>     /*
>>>>>      * Allocate a new ddebug_table for the given module
>>>>>      * and add it to the global list.
>>>>> @@ -1278,6 +1283,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
>>>>>     static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>>>>>     {
>>>>>         struct ddebug_table *dt;
>>>>> +     struct _ddebug_class_map *cm;
>>>>> +     int i;
>>>>>
>>>>>         if (!di->descs.len)
>>>>>                 return 0;
>>>>> @@ -1300,6 +1307,8 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>>>>>
>>>>>         INIT_LIST_HEAD(&dt->link);
>>>>>
>>>>> +     dd_mark_vector_subrange(i, dt, cm, di, maps);
>>>>> +
>>>>>         if (di->maps.len)
>>>>>                 ddebug_attach_module_classes(dt, di);
>>>>>
>>>>
>>

