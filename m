Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C7BCB1744
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 00:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471F910E22B;
	Tue,  9 Dec 2025 23:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=akamai.com header.i=@akamai.com header.b="fSrP9fhM";
	dkim=pass (1024-bit key; unprotected) header.d=akamai365.onmicrosoft.com header.i=@akamai365.onmicrosoft.com header.b="TpYk3jM8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4175 seconds by postgrey-1.36 at gabe;
 Tue, 09 Dec 2025 23:53:34 UTC
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com
 [67.231.149.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB0310E22B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 23:53:34 +0000 (UTC)
Received: from pps.filterd (m0122333.ppops.net [127.0.0.1])
 by mx0a-00190b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B9HjZa13312885; Tue, 9 Dec 2025 22:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=jan2016.eng;
 bh=ePtjwiclEwND+HlLOZx/HZSTu9eZeBXRfB8rOLZxjFA=; b=fSrP9fhMKaEB
 A9bP11tIsql6a2UBGpnYtKLaelaQN/2z3WyjJwzguoVCJppPku1n8bLDvJsOmmQe
 M0q/eW7DYDEwwURJnrJz/oqaGDorhMj4t2S2WjGi5UMUF3uBPUltPi7UL537nnrH
 W1F9TbJiVcZh2LrDKo21z8/8tJwKasv+lTj1VTmrofDHRJs10a2HGG8jedIhqXhz
 /3rAZd/AzBEb1kkFK5nCyjzdMWKUto7Ruz+vkbR/P78iPrQEduRJlvtLTGZ93lX0
 L2qZVnDHvcYZqyG3Fp0m4J18C3GLvsG54U8yZlIkHQ5v+TxORoclvPCk3h1Ayn/z
 l4219rhC2A==
Received: from prod-mail-ppoint8
 (a72-247-45-34.deploy.static.akamaitechnologies.com [72.247.45.34] (may be
 forged))
 by mx0a-00190b01.pphosted.com (PPS) with ESMTPS id 4axpeq5k6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Dec 2025 22:43:46 +0000 (GMT)
Received: from pps.filterd (prod-mail-ppoint8.akamai.com [127.0.0.1])
 by prod-mail-ppoint8.akamai.com (8.18.1.2/8.18.1.2) with ESMTP id
 5B9JMRtU010522; Tue, 9 Dec 2025 17:43:46 -0500
Received: from email.msg.corp.akamai.com ([172.27.50.221])
 by prod-mail-ppoint8.akamai.com (PPS) with ESMTPS id 4avgq1kapx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Dec 2025 17:43:45 -0500
Received: from ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) by
 ustx2ex-dag5mb4.msg.corp.akamai.com (172.27.50.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 14:43:45 -0800
Received: from ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) by
 ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 9 Dec 2025 16:43:45 -0600
Received: from DM2PR0701CU001.outbound.protection.outlook.com (72.247.45.132)
 by ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 9 Dec 2025 16:43:45 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebH2bvNTNZh3UuOWCvPat72QXYaz5qjBuUJ5n4N19rDnH5TeGj6Cs9LymkeEUbo1bSZ4N+YZs4is2AdOVQja0KOHyZ9JHIQbjjwbApZvoDPoXaWlLPKLe62HCV4PMv99qJJdKi/yagUfpxA3bnkgIs85JrmypZA2R0NBhGyRVAHqp5Kjz766cpnWOTMYo2lkpnW1y7YZ+3T3CTECLesJZaXngdqD9lMIR7AaTjig9TiImzrnIzUjGzR6GjQXPvyj82zuMG8GKPcfgFQToqEhs109MrglhCkgpTa+XROcTWUNxzPTH4TPmN3ejJ2vfWoJxhJgrIhdlxYs+70Mvanl7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePtjwiclEwND+HlLOZx/HZSTu9eZeBXRfB8rOLZxjFA=;
 b=PInX9VVKaulgEJqMKBv6p+u0fzpP7bP0mZG6/MG1N9UfvIHLFEZmqL5ZlJh/7yJwUkoLk2f78HZ438xCdjS24gyaelFayxhRjQXAqDbTfIWSoW3wmqcyCH4P35aHz0vFCTqiycPvVhKeAbtsJQ9T8IHrJbbuooTz0pTzhhWE5EMqK3x32vaip6sAig6PRmuyHrzi0UvOn4jEGNZP+7TebVBVYTsRzUKE/8sRitP1peKj4sbOVP84y220rv+f/p/mwF3aoWK3uxbg5omzj4if65+Ho1T04sK5UpRvxx7LncotU57unpTcIST0dSBkSlnc2o+RUQQjNd2Q1V/IM9DsEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=akamai.com; dmarc=pass action=none header.from=akamai.com;
 dkim=pass header.d=akamai.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=akamai365.onmicrosoft.com; s=selector1-akamai365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePtjwiclEwND+HlLOZx/HZSTu9eZeBXRfB8rOLZxjFA=;
 b=TpYk3jM8Gd2e4sf32nJw7f+hkFU8l3csWEuPBkV+A1zlRdQPGslA5oDYGd7SSZY0pZcf0rDnCWy/N4edzzbtf+OgKNDkfGnwQtBEYiCvyOnDeGO9d/gfc0sawdRZ1L7hJdAD9y5/e36rEI6HNglu3Z1ylfWdfhZmLhY4XXW1hWg=
Received: from SJ0PR17MB4870.namprd17.prod.outlook.com (2603:10b6:a03:37b::13)
 by CH2PR17MB3847.namprd17.prod.outlook.com (2603:10b6:610:5c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 22:43:43 +0000
Received: from SJ0PR17MB4870.namprd17.prod.outlook.com
 ([fe80::ff21:c3fa:86eb:2f36]) by SJ0PR17MB4870.namprd17.prod.outlook.com
 ([fe80::ff21:c3fa:86eb:2f36%3]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 22:43:43 +0000
Message-ID: <fcb2532d-5627-4bc3-a990-ed361b56ccd3@akamai.com>
Date: Tue, 9 Dec 2025 17:43:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/31] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
To: Jim Cromie <jim.cromie@gmail.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <gregkh@linuxfoundation.org>
CC: <ukaszb@chromium.org>, <louis.chauvet@bootlin.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-17-jim.cromie@gmail.com>
Content-Language: en-US
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <20251118201842.1447666-17-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0440.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::25) To SJ0PR17MB4870.namprd17.prod.outlook.com
 (2603:10b6:a03:37b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR17MB4870:EE_|CH2PR17MB3847:EE_
X-MS-Office365-Filtering-Correlation-Id: 03fa6015-33fa-4821-18dc-08de37746782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUxIZ0V2bHBWWXJWMm1McW9vaVVQWWlhRGFNSE1CTzFyUmFwUmpiZ1pqdlI4?=
 =?utf-8?B?SHFHL21HSWFBancyVTM1a1VxNG4ySTRkVmJpWWFHOGVwR3o2RVFOZFNhNVlj?=
 =?utf-8?B?SWxJNEVrOEt6K3pTdFRjc2VseHdjVXhBWTJod2JqZEVKcjJOeGpmMUpVYmdJ?=
 =?utf-8?B?T2p4NVdUZHlwS0liaUN2TUpwWFVUVmE3WFI5dE80MVVFWnlCeWx1RGtvQ29X?=
 =?utf-8?B?ZDRLVWdsMWZVSWNPcjBETFRkbkhxUnZ3RG5pM1VIOHZhN3dZSTFOd3RTUVR3?=
 =?utf-8?B?SWRzd2JLRWFPaWRhUVVuQ0xmZC96VjVPTXhaZitsc2F5dkJFeGwrVnovRStr?=
 =?utf-8?B?UDFyYlI3RVVtQU9LeGJhc0hSMXpEb1FHeFdLcExNOUljSm1vTGRpa0NLSG9r?=
 =?utf-8?B?L29uL0t1ZGt1aVV6N1JNR0t2cmdJd1pOZTVYVWYrMFAwb0NIQkxqbXp1endZ?=
 =?utf-8?B?dlRTNnJ6QUE1VGFMaFcwajVRL3lHTWFEbXFYTm9xUHhqU0JxeTRvQkpUd1lk?=
 =?utf-8?B?UWczd0tXQlZNR3k2eFdMZHFYallUc3FwZXpKTG1ocWthOGRaZEdNSEEyNXpF?=
 =?utf-8?B?QjFzMmxNN0F6NWVpcXJkZnIzZnBhNm94Q1dhcWFpRlZoeU5zdU0rbzAyNG9w?=
 =?utf-8?B?M0FySUN6NUFyVmREVC9zY29oM25tWm9uaWZKODZKcE9tSUZaVkJKTWU4VnIz?=
 =?utf-8?B?eGhPMjJJd2NVYjZZbk16Tk5uMXBPalNXa2ZGQzhIWHZXOWYrSXNKeFVxNVFR?=
 =?utf-8?B?OUtXR1pVS3lVUWViZnQ0M3IwVlNEWHkyR1pBT0pybEJxdUxYc3o1dGh4aWdl?=
 =?utf-8?B?aWU1RUZJVkZtV0xNcUpzbUI1MjcxM3dEODVWMERGbldRUHcxVFY1WlBFclNm?=
 =?utf-8?B?SU5qcFd1WXprNG85WmcvWkFNWFBBK1pGR0x0MVBMc2F5YXNPdFIrOXFIY0x6?=
 =?utf-8?B?bVF2TTZ4ak5ZaWZQc1h0VmlsMkdVc0tPZHorUkFJL1Q0R1ZjVWt0WHEzelg0?=
 =?utf-8?B?cjFyU2l5eURiUXB1OHRuTG9HQTduaWx4dFBvTWpJUnlwZ1JlL0VtQXJsMWQ1?=
 =?utf-8?B?N21XLzNkQXg5U2YyNE1PRkdKTTRFcXIxSEdzc3ZVNm00VUhEOElkc3Q5NStr?=
 =?utf-8?B?Rk9CMWlSWjR3ay9SNE5kbXhSMVNPbHZzL0RUUmluTStvUm01OTlzRTBYYklj?=
 =?utf-8?B?Mml3NDhvSzJEcE9QOVhQSm9wUTFtL2ovVXNpQnUxdS9BVzloM3d2R2hsZHFp?=
 =?utf-8?B?SCtIc1A3cCtTUGFoSVUxaGhFUDR2R1NmVzdPbE9ZL1VmdEpUWTBuUXlsb0Rw?=
 =?utf-8?B?WTJFQUJUbkRDUWpMUGpkeExNZXBXbDdVOFV5YWY2cGt6VERnRFVvYWNHMXBZ?=
 =?utf-8?B?R3FQU2paVlBQYjJtVXRwMnpqMTBEZTcvMjhxelBVcDMvaWdjSU1TWHFPUVg4?=
 =?utf-8?B?Q1RDeHlwV2trU2tnSUc3ZkVHbHQ3WWk0cytZMGpZcXVUSDJHcVV1Q3JUN1Z1?=
 =?utf-8?B?WmROSndPZ3VpVWNVR3B0NkZaaGpZeFhlOTUrTWpqamhTMG1ERW9KOFhjUjhp?=
 =?utf-8?B?bHNhZDQvM3VMSjNncTEzamJlMUlwOXJCejJ3Qnc1QkdiR2wrL2tFMG9ZUURG?=
 =?utf-8?B?clM3MTdKekFLQ3Rhc1pWYlJoN0VKZHUrSUM1SkF2ZTk3TzNHcndkNC9HSlBl?=
 =?utf-8?B?YkdGWkVCODhlTjROTWM5N29wUTBDaVMvZXY2aDlQL0tpK1RVbllNTklCQ0xw?=
 =?utf-8?B?WkkwVDF5aHFvZjE1Q1FXSS91TCtOd2xvZ3J2THZPNlFUV0hxd0ovcWpTcXU2?=
 =?utf-8?B?WkRDZkZzUFZERHZQRk9rR1pTcG1MWE13bmJiZy9qdDhOOWtra3dFVkdiRjdR?=
 =?utf-8?B?VmVsWWgrZDJsZERYdXNyM2R0dWhYQy9DQmlPNzRuWGcvN0tPaHNGTUQ0SXNi?=
 =?utf-8?Q?22H//DN8lLtslySf5BFtHAhITI0oXwjK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR17MB4870.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUp0MklrM28wQ2FwNGE3V1VSUGRPVGozbjBNbnpXZ2J6clVSR3hTd1hqVXdn?=
 =?utf-8?B?YTdocXZQR3U1T0FUMU1kU2lucWY2enlyVHZVN1NpSG03RVpWT2hQR1hhRy83?=
 =?utf-8?B?MGR3dHVwL0tHSm9QVWhpNm02WTdtYjFpanY1NUVsdjNXVHB1MXpXYVl1VXJ0?=
 =?utf-8?B?V0Y1czMwUzVrQXpNV3BTemxMUUI4TFNnWVhkUm1hcStBUm43bEY4NlhvNUg4?=
 =?utf-8?B?ZVlCY1k3NDNrZlpFRUNCM3pGMW4yOTE2T2x4VXo5NVlLZkNHK295a3hOdlRt?=
 =?utf-8?B?WDdCWnJqYTdGVVN6aG5iOXNTN3J0Ni8zVkZNemVQZ1JyWDhtZGVRc0NIZ1hI?=
 =?utf-8?B?TTlsaVJxdEgyWWxtNDhRM3VQVGFLQjVXOEdHai9CSC9yeGNWT2hFbjc0Rnpl?=
 =?utf-8?B?K0UrRXdQbWRiMXJ2czM3Yzl3VUVPYVZFbWlSK2ljejVyTmFvbGEzY3YrSlRz?=
 =?utf-8?B?T2gxOGZEQUpaLzUrQ0JIY3ZrVWlxOHg5U29ZQVFUNFlYZkM3cjRIVEdJZEts?=
 =?utf-8?B?SCs2aWpBeU9iMWVUcnU5THBaWU5IK0pXRWtPMFRFMWo3TGVQb2NNMi9GRERu?=
 =?utf-8?B?UnBYUmQvUUFUbTBQSlZhQWhKOWNEbzdicTlFblVQRjVrLzZXTGJWMkRkWG1j?=
 =?utf-8?B?NGJvMG5xQW9zWG1LeGlrdXZxMCtYRWg3N05zekIvdFVJUDNYQkdkNy9QUEM2?=
 =?utf-8?B?cENlT1FjRnZtQXo2ejBLT0VUQUhqbmlaTnhTU09HOVVpbDhxSFg2ODBEY0F0?=
 =?utf-8?B?YkZMVU1IMmhnancxZmsxU0VzUDVqa0I5TC9uckhZYWUzSU10VWJzMnFMbTE0?=
 =?utf-8?B?czNKSWs1MWpBdUpFR1VnZDFMZGVOR3MwN2ZoUlI0WG5BUkFvWnpWbjU3Q2pk?=
 =?utf-8?B?S09IenBUdjFWZlJzKzQ5ZGc3TVB6aHlpNVZrUzJqVnh5N05iV0JqV0plZzBz?=
 =?utf-8?B?ODBIYTVRY3hxR0d3QWpDTy9vTklkOGUzUHFpODlLR3d6Zjk1ZVJBeFczdGFH?=
 =?utf-8?B?NDg5d3VGaERyV1J0aHNHaFlHREY1SWhFWWE1a1BtV2RVQmVlamdqTGhUbFJF?=
 =?utf-8?B?cGZTY09Ka2VYbGtqN1Vrc0JIRmw5RDJzWklkU1EyWlgzK05QdFJzaDBndjVq?=
 =?utf-8?B?QUlpMEV4Z2dvVHBlenM4amhuTk5Id3Nsc1B3Z2V2MXZxc055dDhSTStlRjda?=
 =?utf-8?B?ckR4Q0xCc2ZyanRDcFcyUzBEa2ZqeW8zQVYrYkd4bDZSWExMVGhjcmh3dVJT?=
 =?utf-8?B?Wlg5NHlENTBkcjVuYWx6bjdHWkFHKytCZlgyWlFKNDhaK1VQb2ZXbUxuZ1JQ?=
 =?utf-8?B?YVVoYVBRODJPblRmaWRPc3Uwakt3TEU0UnkrK05VRTZnZUZHVFI3TzRmcjEv?=
 =?utf-8?B?elNzcEE5WDJsUDY4UGN0b1FQWDRVYWtKZ1FzV2NRZVpZSWVLZG9UZHRvVVpQ?=
 =?utf-8?B?K0JmcWJzdzB6ZzNyMkpFNDk5TjBsTFM4WVY1eEtpS0tPeUpLTFJ6U2d2TzVZ?=
 =?utf-8?B?QWh5QXVseG16TzR1WDBBUFY5cUN6ZnVUcWJ6Tm1QTmozMmMzUTE0MVJkT2pN?=
 =?utf-8?B?aUFXdFNqbThLR2RsRFkzeVcydWNUVTVFVitTYUZzZzBveXdIbXpRVEZ4SUVJ?=
 =?utf-8?B?aVp5NGxwRUVwM2hYSTQ0bURwR1M4c0djVGVkcjRJbC9HdDMyN2FNdDFwdkVS?=
 =?utf-8?B?YWpXNGdhQlB2VW5Tb2hJRTFnNTFTNTY4cXVjalAyM3I1cFF1b0dGbFEwdytR?=
 =?utf-8?B?azlDVGZ1YzR3UG1acy9WeFpsN2g1OTl1VGI4NnRCazh5Y3ArbEZvY0psazVx?=
 =?utf-8?B?RWZjTEJ6NHFPU3ZKa250WFN4NWxMSGpVaUpOYTNZZDBybGhqUjBMeDQyb2t5?=
 =?utf-8?B?TElCU2NRSUhJYktwSkI3WXloc1RIS0NFMFlZUFJBWDBvN1hHbllET0FnVnVK?=
 =?utf-8?B?SFpzVXZqbTNCYmVvSitQSlVYN1FDQmRqSCt0ZDlRSk5OakxhdjJRa2EwNUZy?=
 =?utf-8?B?MXJCalBMcU1kQUorb3YzOTh2b3U1ZDgwV1NDT1JXaFJrdmJDa01mMXR5QmR2?=
 =?utf-8?B?T3QyTUs5OGV2VWVtZzNCc2k2YkxPYWFPZXJNWWJ0cTFPTmJTNVNYR080Uk1Y?=
 =?utf-8?Q?/q6VGjMBZiPeTUx/rGT3uQfVJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03fa6015-33fa-4821-18dc-08de37746782
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR17MB4870.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 22:43:43.5285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 514876bd-5965-4b40-b0c8-e336cf72c743
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pw+BBeZvQMNt3TulKhtxdlCB0wua/cHeUoPRVxyfCXN8386LEipmYkhviPvICxGpFpqMklTfefBwUgfc3Ii/VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR17MB3847
X-OriginatorOrg: akamai.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512090176
X-Proofpoint-GUID: 0Czo_xP2saRlhWMYd62xSuJrJHFhQP4P
X-Proofpoint-ORIG-GUID: 0Czo_xP2saRlhWMYd62xSuJrJHFhQP4P
X-Authority-Analysis: v=2.4 cv=frzRpV4f c=1 sm=1 tr=0 ts=6938a622 cx=c_pps
 a=YfDTZII5gR69fLX6qI1EXA==:117 a=YfDTZII5gR69fLX6qI1EXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=g1y_e2JewP0A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=tkO6dL3DwmtaRid9L3gA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE3OCBTYWx0ZWRfXzlbkGnHF2U92
 1R9FO6fA+9x+Tf2tvX71F/fD/Pa5pyu8vygSkEjRn/HbnhcinKDgKjj+aiRPtodbadhAUiwy4Tt
 eXaSrO7U3pj3zE5PGygr+tbvNzrpaVz7StnVVpldQzp8DoaPzY6Jq6Dg/ccu2GlsOvP0M3hBdwp
 0mZPcVpJljzHeXNIL1Rm0ZJBgyon0WYgK8p7GbJeOo5xEhOgg5vGn+cMUFYQGStIEcZy+xu077g
 bo9146mkuaBgGNT13cvJUbTci/qzoH2FCtb7DAC069eK6YRJaXFy5NvOW0Cw22WD30Y/XRayLSa
 uvluj9oJ1d77Vkpbr62i+Zo3M3Ui2n4D7DHzMIWJoqMC7ZqFLapMAPu6dQdNFCZraLrsSMm9NUH
 VGgKVPhzm+qlmwO0rxdI1RdJOwhNKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 clxscore=1011 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090178
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

Hi Jim,

Very minor nit below about the kernel-doc ordering for args...

On 11/18/25 3:18 PM, Jim Cromie wrote:
> !-------------------------------------------------------------------|
>    This Message Is From an External Sender
>    This message came from outside your organization.
> |-------------------------------------------------------------------!
> 
> The body of ddebug_attach_module_classes() is dominated by a
> code-block that finds the contiguous subrange of classmaps matching on
> modname, and saves it into the ddebug_table's info record.
> 
> Implement this block in a macro to accommodate different component
> vectors in the "box" (as named in the for_subvec macro).  We will
> reuse this macro shortly.
> 
> And hoist its invocation out of ddebug_attach_module_classes() up into
> ddebug_add_module().  This moves the filtering step up closer to
> dynamic_debug_init(), which already segments the builtin pr_debug
> descriptors on their mod_name boundaries.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> Ive review checkpatch complaints:
> all are lvalues, and not issues.
> CHECK: Macro argument reuse '_dst' - possible side-effects?
> CHECK: Macro argument reuse '_sp' - possible side-effects?
> CHECK: Macro argument reuse '_vec' - possible side-effects?
> ---
>   lib/dynamic_debug.c | 57 ++++++++++++++++++++++++++-------------------
>   1 file changed, 33 insertions(+), 24 deletions(-)
> 
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index c9377a444fc8..49de591f036a 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -170,8 +170,8 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
>   }
>   
>   static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
> -							const char *class_string,
> -							int *class_id)
> +							 const char *class_string,
> +							 int *class_id)
>   {
>   	struct _ddebug_class_map *map;
>   	int i, idx;
> @@ -1247,30 +1247,35 @@ static const struct proc_ops proc_fops = {
>   
>   static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
>   {
> -	struct _ddebug_class_map *cm;
> -	int i, nc = 0;
> -
> -	/*
> -	 * Find this module's classmaps in a subrange/wholerange of
> -	 * the builtin/modular classmap vector/section.  Save the start
> -	 * and length of the subrange at its edges.
> -	 */
> -	for_subvec(i, cm, di, maps) {
> -		if (!strcmp(cm->mod_name, dt->mod_name)) {
> -			if (!nc) {
> -				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
> -					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
> -				dt->info.maps.start = cm;
> -			}
> -			nc++;
> -		}
> -	}
> -	if (nc) {
> -		dt->info.maps.len = nc;
> -		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
> -	}
> +	vpr_info("module:%s attached %d classes\n", dt->mod_name, dt->info.maps.len);
>   }
>   
> +/*
> + * Walk the @_box->@_vec member, over @_vec.start[0..len], and find
> + * the contiguous subrange of elements matching on ->mod_name.  Copy
> + * the subrange into @_dst.  This depends on vars defd by caller.
> + *
> + * @_i:   caller provided counter var, init'd by macro
> + * @_sp:  cursor into @_vec.
> + * @_box: contains member named @_vec
> + * @_vec: member-name of a type with: .start .len fields.
> + * @_dst: an array-ref: to remember the module's subrange
> + */

Not sure if the odering matters for the docs, but it makes it a bit 
harder read when these don't go in order.

Thanks,

-Jason


> +#define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({		\
> +	typeof(_dst) __dst = (_dst);					\
> +	int __nc = 0;							\
> +	for_subvec(_i, _sp, _box, _vec) {				\
> +		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
> +			if (!__nc++)					\
> +				(__dst)->info._vec.start = (_sp);	\
> +		} else {						\
> +			if (__nc)					\
> +				break; /* end of consecutive matches */ \
> +		}							\
> +	}								\
> +	(__dst)->info._vec.len = __nc;					\
> +})
> +
>   /*
>    * Allocate a new ddebug_table for the given module
>    * and add it to the global list.
> @@ -1278,6 +1283,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
>   static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>   {
>   	struct ddebug_table *dt;
> +	struct _ddebug_class_map *cm;
> +	int i;
>   
>   	if (!di->descs.len)
>   		return 0;
> @@ -1300,6 +1307,8 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>   
>   	INIT_LIST_HEAD(&dt->link);
>   
> +	dd_mark_vector_subrange(i, dt, cm, di, maps);
> +
>   	if (di->maps.len)
>   		ddebug_attach_module_classes(dt, di);
>   

