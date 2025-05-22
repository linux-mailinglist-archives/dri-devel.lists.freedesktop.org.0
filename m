Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A157AC0AED
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 13:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECE010E993;
	Thu, 22 May 2025 11:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="D3f6ImJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D2510EA18
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 11:57:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsOwbdFUoiNIstwnyHaC9+lJbUg/q6dOYm6vNHN9rA85HK65LTEGVKSS5NvhWIsvX2ZxOO7bi76uY0HfsFDzGFbvzg+HPy19ZcqIoIy53ADVrC6uYQtoC/pJCXzMtrGGAXuZPQCufMOVt3aitX6SKc3330DjYOftqID4mMNgxYd7301YgPJl9NjcqcPw+pja+XmVpnqDmqLC7lyMnUwUtIaMPOyr9VxseNehjsyuWATGsrfE9fh2gq7WRn01FZVRTAAFUbRPvMzTdRtZ4t2qCDXillMNeLksAtEVKZeodBviJwtLzBojTyrG/LJsFosvkJtL5bJpU5ScpUaFiZpLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDR8KDmqu+o4vuVnSFZlQ6Y6Dft8RfrBJy62zHXU7MA=;
 b=ILk2nFA3xZJGV9DgpnL5FwIoflX+9Mvw0DzA28w3v3NkNMFGqqw4xAy6RVQLPMb0TEGu3E6AhIHN5Gous34UYS7bRJzaNctB0pYc5LIylpEqoSkfjyI10Y7gxEuFVaZ6yGXlAVcGCXG6QTn9aa+WkAoxS9epA0Rdh0Qlajth0XrsQjxZR8k4/x4RmPZVhaPBAOQYZRC/MPDjEw03N7kFktZN3REubPyezjGfOEyLH4aQXnDb4jx8fJyhj6vWw25uvi5bgPr8NKuhYPitQEgdwye5ipX5CuXo7BH6qyMbaJGxjMCVvbUgFKBe4VPDUQdMnPslvKyznOVUmEIRfdhIwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDR8KDmqu+o4vuVnSFZlQ6Y6Dft8RfrBJy62zHXU7MA=;
 b=D3f6ImJWTaGQTqR+q4JCglb+9xRcjNeFtKHwqViB3x/uRWDjFSyo/SV9hXkB/Emeza72VGxvnFWapXg4RLBKv/YntkuEPMouLyPgckFh6v0LdNhLSplXBIhZb2Tp/KSbFi6MLK9uFqdHIaJmxNgpTCeEXEQvAVSDdBLLIitf03c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7570.namprd12.prod.outlook.com (2603:10b6:610:149::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Thu, 22 May
 2025 11:57:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 11:57:52 +0000
Message-ID: <4a53b6bf-9273-4e77-9882-644faafa200a@amd.com>
Date: Thu, 22 May 2025 13:57:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
To: wangtao <tao.wangtao@honor.com>, "T.J. Mercier" <tjmercier@google.com>
Cc: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wangbintian(BintianWang)" <bintian.wang@honor.com>,
 yipengxiang <yipengxiang@honor.com>, liulu 00013167 <liulu.liu@honor.com>,
 hanfeng 00012985 <feng.han@honor.com>,
 "amir73il@gmail.com" <amir73il@gmail.com>
References: <20250513092803.2096-1-tao.wangtao@honor.com>
 <fdc8f0a2-5b2f-4898-8090-0d7b888c15d8@amd.com>
 <5b68b2a50d48444b93d97f5d342f37c8@honor.com>
 <ef978301-6a63-451d-9ae6-171968b26a55@amd.com>
 <9f732ac8b90e4e819e0a6a5511ac3f6d@honor.com>
 <50092362-4644-4e47-9c63-fc82ba24e516@amd.com>
 <2755aae2f1674b239569bf1acad765dc@honor.com>
 <2487bad4-81d6-4ea2-96a7-a6ac741c9d9c@amd.com>
 <a3f57102bc6e4588bc7659485feadbc1@honor.com>
 <5c11b50c-2e36-4fd5-943c-086f55adffa8@amd.com>
 <CABdmKX30c_5N34FYMre6Qx5LLLWicsi_XdUdu0QtsOmQ=RcYxQ@mail.gmail.com>
 <375f6aac8c2f4b84814251c5025ae6eb@honor.com>
 <38aa6cf19ce245578264aaa9062aa6dd@honor.com>
 <CABdmKX0nAYDdgq-PHv0HxucfYQzvvTAJjVCo7nQ0UtjwcF02aQ@mail.gmail.com>
 <7198873a044143c7be12f727b469649b@honor.com>
 <fdd7a11b-140c-40bd-a1c1-334d69256b92@amd.com>
 <e61fcdbf71ba4f9dbfef2f521d1b2fc1@honor.com>
 <d786ff9f-9bf0-42e1-987f-f2091fd90279@amd.com>
 <068cca07bc5a4e68be5355c884843b8a@honor.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <068cca07bc5a4e68be5355c884843b8a@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:208:160::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f0e1dd-ddec-42e4-78ad-08dd9927e138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OERwUjlrSGUydUR0NGlsNzJ1czVMQy9wc0t2ZlhlYUhnOFdHQnNId2NjV0p1?=
 =?utf-8?B?Y3NhMFZWRS9JZVczNm5ZSGUzZWlDdjBGUUhkRWd6TzBEVXBaeDlwZy9VQkJF?=
 =?utf-8?B?cXNQUURvRk5vQldEMGtNeVhERmxucjNzeFBJU2w0RUprSzdjakc3c2FPYXR1?=
 =?utf-8?B?bG03bzlyMTJzUU9Gb0daOGlrU0VscEhRbU9TZGJXLzdBRDVTL3NJN3djUGZx?=
 =?utf-8?B?WVB0eStHQ1VlakoycGhDeEhlTmxjVnVpNEo2QmhNM1hvNzByK0ZQK1lmVnJj?=
 =?utf-8?B?N2tlcTNtNUk2RU9yTFpiRXlDMThCRmY3MDNROFdWNzFtcXQwdWNiUWlmcDlK?=
 =?utf-8?B?bmx0dUUrNjZmWUVuNFJubnlmQ01SNzU5MUlLcHl4b2JMdHVMS0pINHgyQVM3?=
 =?utf-8?B?eUdZOWs4T1pOdW45dUxEQnJuU0c2VmR4SmRCd2lDM2NsZEhjT3RtQWhzeHMv?=
 =?utf-8?B?SyszUEpLREIrT2J5cENTSHB6Und0NkxoZXE4RldRdE9PYldZOXh2Z0dVb0Vt?=
 =?utf-8?B?RENBbFUwcDZZcXJyVlNLdENpcTRSRWdWSGRVN1F1cHRGZWpyd2JJYmk4Q0JQ?=
 =?utf-8?B?eFhFQjg0bVc0cXdHK1NUaHc2am1aZjBJS2RGOXpHMzhUdndmWUxEWmR4eVFI?=
 =?utf-8?B?eTRrQ3NNbzNTSnNHYjFLbDVMYVFFclBtZ3JycXpqL3ZUUXcyck1LQWIvK29R?=
 =?utf-8?B?ZmQwU1BFL1k4VW5JZjVYWlVBNWhCNmt1REhvQ1JYdE9CY0ovR1Q2N2hlU25l?=
 =?utf-8?B?WjBpekdSekxveGFldlRXQmhIV2dWWWIwWWhqMkY4OWI4TlRrNDFIWDRBN3lj?=
 =?utf-8?B?YmR2WGZtKzBCb0l5cmkwUlhsS2V5dmsycW5LazV0TFBLbUw3YXl4d2NwUm1x?=
 =?utf-8?B?eGhHeDJRTjhjcGJSSXpoOW5UL3A5KzUwSko5bXJiK2lGclQ5TkgxZnU4WVM5?=
 =?utf-8?B?QUwzM1BDZG40T1dZNTBvS0Q2YVJMVkxZUG5PZFdoWVFqWFY4SXM3UzJ5N3Zi?=
 =?utf-8?B?YXM1QnJ0K1RROG10dGVpQjljUno0TGwvcXRibjFhK011WTVCQ1EyWTB5K24v?=
 =?utf-8?B?eUJUMG9VS1FRU0Z5M0NQR2luK3hsK0NLSGRNRlkvUzdQUll3Qkh2U3dWNDU3?=
 =?utf-8?B?Uy85OTZRWGE2ank4Slpra0RjV3djY0VBbzR2b1VuNTBsQTVHZkpraTd3Ungw?=
 =?utf-8?B?QTA0RldQOGxKaWdPUk1EVHFNd2h1TXp2dHh2REFWVHN6dVc3SXNCaFdlWnBK?=
 =?utf-8?B?aHkyVUFUekwzeWtUWXdqOEdFTjRKN3Z2L1VLWE04Q1dZYUx6TWZINVpZL3Ar?=
 =?utf-8?B?Qi9iQkVycUVSejlKUnEyZ09NRTN0clhxNnRrVTN6WkhTMDBnSWVYd3lkMmhQ?=
 =?utf-8?B?c0VaU1J3ZXF3NFg4WGxacllsMmU2Ylp2ZTQ4TG9iYnRZYktucDQ2UFp4RlVM?=
 =?utf-8?B?QjdrdzdGRklrMUtLSU1KRkFhTE15bHc3VzBKSy80REl4Yi9YTXYyWEJvczJX?=
 =?utf-8?B?ZWpvNHZzdXgza1A3VGVtVis5L2ExRS9MUHNxcnYxSUpKWmF6V0d5U0QvVThp?=
 =?utf-8?B?SVUwRFlmYk1kTjIrWDYxM1A3dW50cHhnS0RhQWFRVk9qL2h5aDdvVC93Qmky?=
 =?utf-8?B?K2ZucTBtLzloU0FUcFJGMlBMOW1SN3U2Ymc3WGlCeElmMzVyejRIamJxQ00z?=
 =?utf-8?B?OWhjeHQzZVhLamMvVEtUTXY4QjdXejZrVUU2MHlQR3lFNVJ6M0xMeVp0YUpT?=
 =?utf-8?B?NTNhV2x4TnRQM2Fkd3Zpa1hVdS9FQmt4MzZmcDdNcTF1ekFGdmtwREVUOVdn?=
 =?utf-8?B?UC9VSWVQUXNRVFhtU0c4OGpkczB3bDFGY1Fqai82YlJGdW1OdHRDMVNQSXRn?=
 =?utf-8?B?c1Q4QnM4b2s1Z0poOTN0bjIzYktBZSt0YTFiNDA0ODFIcWxxcXY2YzVHUGhM?=
 =?utf-8?Q?AL4c8gT5tL4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXZ5WU1kQ0JTUGIwZXhoZ2pJdW1DVzgzTndYTTd5ZXY0ZzNtU2ZnV2RGcllp?=
 =?utf-8?B?VjIvN1E1RkRzV1U1dDhLb3VtaW05SXdhM1JXejh1Y0JyQWNCWk4rTFF6RkF6?=
 =?utf-8?B?SlMxUXZxUlNZZVRTaFg0ZlkvUXRmZnZnZ2o5WG1XSnYrWU9HWUMzdjB4Tmxa?=
 =?utf-8?B?ZERnWEJWN0RZQTUxQngvelZjQlI4NlBVNDFabTh1RFBYRm5Hd3BzUm1nQ21i?=
 =?utf-8?B?Q2Nsbm5TQWZGckM2TGpnRVZvcGl3UHdWckFGRm85bm9iRVN1R0g5RWJ0b1pB?=
 =?utf-8?B?Y1drVDJ2cCticVdraWlQeDNtYXQ0SlA4TGk0U0hZTjFUL29iTUdzK29Ydktv?=
 =?utf-8?B?TFpaa2xIN2t4Z0VEMTBmbWpEaXF0SXNnQ0g5dUtTVWI2dGNxcExNYXlhR01U?=
 =?utf-8?B?aG9UL1JQdm5MU292bUV0SDRhaDBQc1pIdkVtV3I1bnRWb1ZSRVg5VnpCdlRO?=
 =?utf-8?B?U0V5cUFoc09GNXBldWdTd1lnNXdQTXBhV21LWUZvY3dCR2g3bytjSXgvVnpr?=
 =?utf-8?B?enQ0N0NtM3dLS2M4WUJnL21NVVFpSVpNd0loSGxTN01lU21iSVlBbWVHUXZG?=
 =?utf-8?B?RXF4NVFBVWJVd0h2aFVoQXhYVndwdFpLVnlFcnRpUU1mRmdraEwxa0xoMUdj?=
 =?utf-8?B?eitwU0VpYWF5ZVVyeGVrVjQ4bVU4UXFSdnJXTW1qOWt4RE80RGZYSXNkL0tu?=
 =?utf-8?B?WlV1V1AvUG9nZEFzc3hVd25aU09oK2JYWUlxWFJqK09kak4rNjZzSHpUQkMz?=
 =?utf-8?B?bUhhZkJ2VXBMN0M1Q2pvV0RBL2tjdVo1MkMxUkgyRzVuemdQWXMrUmVhQzZX?=
 =?utf-8?B?ZmFtb1dJRUd3Um5TSlNpd3VxeExpcWJndFBYQWhjdXd1RkZZNnVJTUd6RUlQ?=
 =?utf-8?B?MkRFaE8rcXp0VTFKa29CWkU4b2kyQjE0djNLd2ZBSk9yNUpWUGwyS1NubG5q?=
 =?utf-8?B?bkpIVU0xemI3UmJ4YTQ2KzhSRW5ORXpsL1ExbkpZNGU2Rm83N0NIclZqejdJ?=
 =?utf-8?B?SVFUMEhKd1A2b0ZzYnV6b05qOW1tNmRjVFlCYmxSWEVRTmt4RU96dGcrR3cy?=
 =?utf-8?B?UHAxWmw2OTVHc2RqOGJRRmNndWJJY3YzbTEyTThRMDhLSmtoTEZKMHJ2cG9p?=
 =?utf-8?B?VkQ3VXBvVjgzVWlCc1ZBWCtlYWxBTkxMOEhuMEFVaHJ6MXA3MG0zRkgrY0x4?=
 =?utf-8?B?L3JPSWZqNkNLa0Z4TFV0bVNSTXQ2clFjZHZkMHdZVTV0QWk3WVhHS1grbm1M?=
 =?utf-8?B?U0dtU1pwNjlCcHkzaFRZb3NodFFreFVaZlVMN3pTQ3dLeWd2cUNVdnY0eE8r?=
 =?utf-8?B?WU5zaWZUdG1VLzkrNzEzeUI0QnN0TDVtTTFkYksyOTJPaEFBdjc1NURwTzc2?=
 =?utf-8?B?MmUydHpMRFhwM28rUS8yOURPNnk0UUhuaDlWU2pFQ0JTc09IWXRBSFBGYTNJ?=
 =?utf-8?B?bXhJWTJUbVl1RXR2TGNyVjNjSktPTlU1RmZFeXlqWGJxVU5EVTZQNHl6eG5r?=
 =?utf-8?B?OUdoT2J4SE55SlVacDF0UHY4OUV2QlNJN0w4QjJkWXZiR29oUGNJTU53YUs1?=
 =?utf-8?B?QWNBWlBXaXR0cStac3VyUFFyRS9GWUxjV21SenplaGc2ODFkUTZPVVMrbFJ5?=
 =?utf-8?B?T2hlMHl6RUhQekpxTDNteDNRbkRrNU1YblZGNFpvMlRxVWhRNnFPcXVRV3pi?=
 =?utf-8?B?UGNDdlFJTU93MjFaZTdaQW4rNEk5NVhucGgyOXFxcjRUMjF0cURKaGZUNmVj?=
 =?utf-8?B?SjVJcnIzOU9xWVZEN3hXb2tlcGlCckJlbThHclorMXJNYmx4V1VvTkdSY2Fk?=
 =?utf-8?B?dnJHUzVLVzZSWm8yMFdTT25Pd2kzUDY2bHY1RGVXeHAvWk9Oem9BMHJKRGpU?=
 =?utf-8?B?d2lWVlh6SUZsM0t4dFZJTDhiaGtGSmhHaGZWWVducHVvdjRYcGgrWU1VcWJM?=
 =?utf-8?B?OE5UVkVjaVYydU1mWC9zMEFoWURVOG9yUk94L2dlZzVGVjNFSzFtUVFZTGJh?=
 =?utf-8?B?RDV2RzZGdDNTWU9QZTNyQ3paaVNNSXIydzgxVFNGQ1FrRk5xb081emdhQlVi?=
 =?utf-8?B?OEFOU1hCQ2pGeTY2VDgxRGhhT1dodk04T2ZvTjgrNXg3cEFQMkxicXl6NzBV?=
 =?utf-8?Q?R+gst3DEQpoMYpSaExfBYSSGu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f0e1dd-ddec-42e4-78ad-08dd9927e138
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 11:57:51.9296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4IkD98O0lcETRaDCTGGQsVyKkWHaf+M3tqD7lhjUaCLzgcThfDsLRdQQFCzLN6AX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7570
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

On 5/22/25 10:02, wangtao wrote:
>> -----Original Message-----
>> From: Christian König <christian.koenig@amd.com>
>> Sent: Wednesday, May 21, 2025 7:57 PM
>> To: wangtao <tao.wangtao@honor.com>; T.J. Mercier
>> <tjmercier@google.com>
>> Cc: sumit.semwal@linaro.org; benjamin.gaignard@collabora.com;
>> Brian.Starkey@arm.com; jstultz@google.com; linux-media@vger.kernel.org;
>> dri-devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org; linux-
>> kernel@vger.kernel.org; wangbintian(BintianWang)
>> <bintian.wang@honor.com>; yipengxiang <yipengxiang@honor.com>; liulu
>> 00013167 <liulu.liu@honor.com>; hanfeng 00012985 <feng.han@honor.com>;
>> amir73il@gmail.com
>> Subject: Re: [PATCH 2/2] dmabuf/heaps: implement
>> DMA_BUF_IOCTL_RW_FILE for system_heap
>>
>> On 5/21/25 12:25, wangtao wrote:
>>> [wangtao] I previously explained that
>>> read/sendfile/splice/copy_file_range
>>> syscalls can't achieve dmabuf direct IO zero-copy.
>>
>> And why can't you work on improving those syscalls instead of creating a new
>> IOCTL?
>>
> [wangtao] As I mentioned in previous emails, these syscalls cannot
> achieve dmabuf zero-copy due to technical constraints.

Yeah, and why can't you work on removing those technical constrains?

What is blocking you from improving the sendfile system call or proposing a patch to remove the copy_file_range restrictions?

Regards,
Christian.

 Could you
> specify the technical points, code, or principles that need
> optimization? 
> 
> Let me explain again why these syscalls can't work:
> 1. read() syscall
>    - dmabuf fops lacks read callback implementation. Even if implemented,
>      file_fd info cannot be transferred
>    - read(file_fd, dmabuf_ptr, len) with remap_pfn_range-based mmap
>      cannot access dmabuf_buf pages, forcing buffer-mode reads
> 
> 2. sendfile() syscall
>    - Requires CPU copy from page cache to memory file(tmpfs/shmem):
>      [DISK] --DMA--> [page cache] --CPU copy--> [MEMORY file]
>    - CPU overhead (both buffer/direct modes involve copies):
>      55.08% do_sendfile
>     |- 55.08% do_splice_direct
>     |-|- 55.08% splice_direct_to_actor
>     |-|-|- 22.51% copy_splice_read
>     |-|-|-|- 16.57% f2fs_file_read_iter
>     |-|-|-|-|- 15.12% __iomap_dio_rw
>     |-|-|- 32.33% direct_splice_actor
>     |-|-|-|- 32.11% iter_file_splice_write
>     |-|-|-|-|- 28.42% vfs_iter_write
>     |-|-|-|-|-|- 28.42% do_iter_write
>     |-|-|-|-|-|-|- 28.39% shmem_file_write_iter
>     |-|-|-|-|-|-|-|- 24.62% generic_perform_write
>     |-|-|-|-|-|-|-|-|- 18.75% __pi_memmove
> 
> 3. splice() requires one end to be a pipe, incompatible with regular files or dmabuf.
> 
> 4. copy_file_range()
>    - Blocked by cross-FS restrictions (Amir's commit 868f9f2f8e00)
>    - Even without this restriction, Even without restrictions, implementing
>      the copy_file_range callback in dmabuf fops would only allow dmabuf read
> 	 from regular files. This is because copy_file_range relies on
> 	 file_out->f_op->copy_file_range, which cannot support dmabuf write
> 	 operations to regular files.
> 
> Test results confirm these limitations:
> T.J. Mercier's 1G from ext4 on 6.12.20 | read/sendfile (ms) w/ 3 > drop_caches
> ------------------------|-------------------
> udmabuf buffer read     | 1210
> udmabuf direct read     | 671
> udmabuf buffer sendfile | 1096
> udmabuf direct sendfile | 2340
> 
> My 3GHz CPU tests (cache cleared):
> Method                | alloc | read  | vs. (%)
> -----------------------------------------------
> udmabuf buffer read   | 135   | 546   | 180%
> udmabuf direct read   | 159   | 300   | 99%
> udmabuf buffer sendfile | 134 | 303   | 100%
> udmabuf direct sendfile | 141 | 912   | 301%
> dmabuf buffer read    | 22    | 362   | 119%
> my patch direct read  | 29    | 265   | 87%
> 
> My 1GHz CPU tests (cache cleared):
> Method                | alloc | read  | vs. (%)
> -----------------------------------------------
> udmabuf buffer read   | 552   | 2067  | 198%
> udmabuf direct read   | 540   | 627   | 60%
> udmabuf buffer sendfile | 497 | 1045  | 100%
> udmabuf direct sendfile | 527 | 2330  | 223%
> dmabuf buffer read    | 40    | 1111  | 106%
> patch direct read     | 44    | 310   | 30%
> 
> Test observations align with expectations:
> 1. dmabuf buffer read requires slow CPU copies
> 2. udmabuf direct read achieves zero-copy but has page retrieval
>    latency from vaddr
> 3. udmabuf buffer sendfile suffers CPU copy overhead
> 4. udmabuf direct sendfile combines CPU copies with frequent DMA
>    operations due to small pipe buffers
> 5. dmabuf buffer read also requires CPU copies
> 6. My direct read patch enables zero-copy with better performance
>    on low-power CPUs
> 7. udmabuf creation time remains problematic (as you’ve noted).
> 
>>> My focus is enabling dmabuf direct I/O for [regular file] <--DMA-->
>>> [dmabuf] zero-copy.
>>
>> Yeah and that focus is wrong. You need to work on a general solution to the
>> issue and not specific to your problem.
>>
>>> Any API achieving this would work. Are there other uAPIs you think
>>> could help? Could you recommend experts who might offer suggestions?
>>
>> Well once more: Either work on sendfile or copy_file_range or eventually
>> splice to make it what you want to do.
>>
>> When that is done we can discuss with the VFS people if that approach is
>> feasible.
>>
>> But just bypassing the VFS review by implementing a DMA-buf specific IOCTL
>> is a NO-GO. That is clearly not something you can do in any way.
> [wangtao] The issue is that only dmabuf lacks Direct I/O zero-copy support. Tmpfs/shmem
> already work with Direct I/O zero-copy. As explained, existing syscalls or
> generic methods can't enable dmabuf direct I/O zero-copy, which is why I
> propose adding an IOCTL command.
> 
> I respect your perspective. Could you clarify specific technical aspects,
> code requirements, or implementation principles for modifying sendfile()
> or copy_file_range()? This would help advance our discussion.
> 
> Thank you for engaging in this dialogue.
> 
>>
>> Regards,
>> Christian.

