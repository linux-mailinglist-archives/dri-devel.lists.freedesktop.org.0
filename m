Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820DB904279
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 19:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592D010E6EE;
	Tue, 11 Jun 2024 17:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0uEEhNSS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D1910E6F8;
 Tue, 11 Jun 2024 17:35:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFiRoSZ6/58X6dmJ4fJi2Wrbp9EDQt7cOd7Vep6jMjLX/yqF+5agwpERqC7YHC8KnRKCZ08JmvBQ1S32omI7YPDZJ4sUpkwABUQHYHjr98VJ780VUj1q5ZyppH1Uwgz70WjuHQAWhkYqOhGgnCEr1KjCTKdQRfKRgFIGm6sUUMQiEn+rtaS6RsjM357czLCQ9pFHj/U3Lknj671BEiEtf8x3GWO6+3MyCTN6+i3TuTJkYav3Jp3H1y3fxG7Cm+aoO7GRke9eDzRzlChoqzV0AqsY+LJZ0tnzJX8mKPYprgrKs8ksTojyZamrp4OtdREDKmiZXBHvjV0qWOt2eyljrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2Y4NyKKkU4PrMQvjnGTPZEZca4fvVDlHzmdYO2fJFs=;
 b=ljFL461X0NTknnaerWa3FquXmW5V9emWvQMvkzi2n0NTE2XkGokcB5M6yh604YAWxbc+430QiNMWIFwfrSiP5JFwecqToDMYdyXq3Kgcrr6obenmVFaKNtmftoVXTF4KAyKZQNqAVmjcnj7K5f3IXVixtq7R+1AOwvvXSw8SQTsxdNvg2DHmdgeDFk+dOBgJRDQ/1AlqCMy7yu4VNVa9dEypZzOVfXaoK4DAEldx5l6slgf+PB6hwCD4yBzx1KZD98Zcs95FO86gciYW8H6CLwxA8Cwd8qIOQHSsYge6YvBUmQ7pXsb+czUjzNJ8S4O0UcWrW7L/W5g4qbBs17xlBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2Y4NyKKkU4PrMQvjnGTPZEZca4fvVDlHzmdYO2fJFs=;
 b=0uEEhNSSDi8RW4dy3Upp0hkck//491ZkZOaBJM/AJuwtoNqo+biK3fGtNSNIvdQo10aypw4S3Tvz9vrVgY3IZWI2ZbO1kyIaW/wB1eV3lmk/fsyvbtPY1lc7HAYylVfNDUSrbYTNqnhVPxcPxE1E37tQuPAEmXRSvK/Z7WTqPwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB8935.namprd12.prod.outlook.com (2603:10b6:610:169::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 17:35:10 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%7]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 17:35:10 +0000
Message-ID: <f31160da-a86a-4c0e-abdd-705b3d1df769@amd.com>
Date: Tue, 11 Jun 2024 13:35:04 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 00/42] Color Pipeline API w/ VKMS
To: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>, =?UTF-8?Q?Jonas_=C3=85dahl?=
 <jadahl@redhat.com>, Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Alexander Goins <agoins@nvidia.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Xaver Hugl <xaver.hugl@gmail.com>,
 Victoria Brekenfeld <victoria@system76.com>, Sima <daniel@ffwll.ch>,
 Uma Shankar <uma.shankar@intel.com>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Hector Martin <marcan@marcan.st>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Sasha McIntosh
 <sashamcintosh@google.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <rkkkrh5epzdxfiknvolzxfoctdnoxfi2nvljmivu6ohmtcc5lg@r3y2x5aug6a4>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <rkkkrh5epzdxfiknvolzxfoctdnoxfi2nvljmivu6ohmtcc5lg@r3y2x5aug6a4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0111.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::11) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: 85730d77-6cca-478e-dddb-08dc8a3cd77e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|1800799016|366008|376006|7416006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmhoaUlPN09wdnpRVnViRG9XZ01ZU2t1cHQ1U2pWekdQZ0ljVWNVNDVLNGFS?=
 =?utf-8?B?MlJUa0lWZVBxVDRDQ3VlZ3oxVjhsbFdhWXg1KzQzWkVubFd3TGV2d0FGVEcw?=
 =?utf-8?B?b0g0U25qQ2F6YmhGTXo1NGNxV0ZSS1N1VktsUCt3Qk1qM0xzUWhvVVVOOGtI?=
 =?utf-8?B?b2lEcm9nTkpCRExZc3pLN0tsTjNSOExEKzNIRHNuK0IwenhuU0RsVlVKbGVp?=
 =?utf-8?B?ZStVZzRZMFlDcDZYUnpkc3grWXZBSzFQOTd3ejRKaEppc2pnOWNXWGRIVEVN?=
 =?utf-8?B?ZmZlWDZranpPcEZSRzhUWE9POUlwRjUranFxSzhQWXpNTG1ITUdtUittdUxs?=
 =?utf-8?B?WlNBaFVIQTRFQ1NqQU9OaDlwelFXQjAxSlRvdVpqaFRldEtsSThEK1BZQ0dI?=
 =?utf-8?B?VFdlYTZDMkk2ejZ4NzZKMGpHWGdicDJtYjlwUnN2RGlWYVo3SzQ2eDhpd3FE?=
 =?utf-8?B?eDVidzIxWlJUdU9NVFAyZ1FWaU5XVVNaajBJaTgya2QrYVRQeGhmNGZ5bzRN?=
 =?utf-8?B?NUpqZ3J3MmxUREw1MmgvS2UxRnovZ3h2OE91cHZmVnFadWNGdDNEbHVpQWY4?=
 =?utf-8?B?aWdMZ1FCUW16c2o3VTJkcFU1TDRZeXFXeHMzTzhYSGtNRHFydnNEbEhPQnhX?=
 =?utf-8?B?alVQZ3prRzkxVURyUHdUTnVObERPTjVzTi8xWUlTbHl1M1BNejAyVWhRU0Q2?=
 =?utf-8?B?dGlzcjliYlFFcmwwSmN3SDJCTHhSTXo3Ny9Ha0thTklRUW9hSWhuL3o0TmF4?=
 =?utf-8?B?OFVBdUhLTVp4NGYyeXdpMWk4ZkFGTDBVUDZSK1M5U1UzaXJ3aUV1RTJTSUEz?=
 =?utf-8?B?RW5uU0ZaR3VhWUwwS3hxRFcxZ3JLVDZxSktYNEwyeEtFc2Y5S3NaWVQ5dFlE?=
 =?utf-8?B?QkJodUhOcTJTeFRDSnRrR3M3MS94aDFSY0ZJNXNTblFTYndibTJUaC8zMk9k?=
 =?utf-8?B?bGpGTXREb0dGWk5TNzZRWmpjRGhmUHNMN2ppNzI1ZTd4MnQzWi9ERDY3U2JJ?=
 =?utf-8?B?eUJlVG9JTnoyQnArVmpWSFRTSk5HajdOQmxRYXI5cVNRNkdpZGtPZXdvYTY4?=
 =?utf-8?B?aDUxUlJXSzloZzgxNEZQODJQS2llTytLQVJWWFFuUmZ1YjFmWGE0S01vemN4?=
 =?utf-8?B?Q29ydER0aGdSN3M5UmovMWhtYVc4MmpkZ0dPZUJxV1BSa3phemZOb0IxTVZH?=
 =?utf-8?B?aXJSNjJmN2JtK0RWYXBQSVRPWGdzczRSaEdGUlloWFZpdTUrcXc5L1RvbHpG?=
 =?utf-8?B?U2lITUFzSFkzUlpLVEoybjVsVGR1Y0pmN09Felpva3VueUVlSGlxSmtTMzNw?=
 =?utf-8?B?ZmtmL3VtZFhGajJ3UDNhb2xFcDdnaGkrcWVlb1JSakcybVlRU0Z1V1VlTWd6?=
 =?utf-8?B?Yis4RU9wZ0FkNXJ5WkdIczhaYzlUa3pzWGhTQmFKdU55OGFqN1l1SWZBUFRy?=
 =?utf-8?B?ZElwbll1RiswamVORElkNTIzYmFod000d3VkVWFEZFRsYnhJbkRYRnVHbU5k?=
 =?utf-8?B?L1RucFo0WjNXbVlRa2IwWlJUaXRReHZCcERJc3RnbGkwYzBqcVBTZ1VpcURh?=
 =?utf-8?B?Q1dGNEVOMEpGVDNSVEVIempWcm9STDBaYzNwamxBS0QrWmlNeGppMFZyNUt3?=
 =?utf-8?B?azJLK0l6aExkVWNrQVR1TGtTR0g4RGk0T1ozbWRQY3pocVpnZzBWZ1ZmTlgz?=
 =?utf-8?B?VHVFQng4YjRWd000UjhveGR6Mk5aZHl4QzJPL0k1VER1Lyt0V1IwTWVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006)(7416006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cC9FV29sOER4T2lIR1c1RkVsWkRDM3RCSk5ZSDlxaDJTdEZUaXJQRUl5NStW?=
 =?utf-8?B?T3Jic3plczFBLytCaS83cXhzOFRKZ3Y3eE9qN1Y1bjZhVVliRUllUkZGbEhP?=
 =?utf-8?B?UXJZdDlJSmhTSVZERnRib1pMRENBLyszR2I3VHdYcVFWWi9SM3p6U0dvaHQx?=
 =?utf-8?B?Y3RWdlJubzExVU9EZ1NxRk95K21ETnM5cTVaeXE3S0VlZWt3R0p0alQxNVI2?=
 =?utf-8?B?WTU0dGtiU2JZNzZFTk8raVhTLzYvY0RnRm5XYTAvV0VqZXlBeTdVaS9uZUIy?=
 =?utf-8?B?SERjT2VTc0pNYWhZNWpsWVozYUxJamlvMWtvZ2V6ci91T0VUb1IvWWtVaUNu?=
 =?utf-8?B?MHV6QWxaVzlpSGN5V2lPSnFGblEzbVhKRDlqVVpLUFF2dEY2cktCbHh4VTcr?=
 =?utf-8?B?RXI1aDBvamk2bW42c2dMQ0pSUXhxQVdSem5DMHIrVVNNSEVuNnk1T0NsMnVv?=
 =?utf-8?B?Wi9xUGJuSXNBSWNaNkFtYjd0Nyt3QTZXTklZd01mRUluMGo2TU1LK2tCWGNh?=
 =?utf-8?B?UVp4ZG5aM3hrbXpaei93T0JKd3NEODU4MDJqamVDZFFqRUJkUlgweGlncmwz?=
 =?utf-8?B?aldSQzllN0pVV1N4amd2UUdYaTZoVXJxQ2ZFVnpNNnl6Z0F2UFY1OFpwcTVM?=
 =?utf-8?B?cjJYQ3dwcTdhT3MwRmpBTGI2eEdVZUlwRm9rcU1JYUY1eEliK0VhVDhIWjE4?=
 =?utf-8?B?RDNXOGJXc0ZQcEg5bmI3VnljTTBub1dIcTBzd3Npb2ZwUDNkRURrb2Mya3kx?=
 =?utf-8?B?YVhYeFU1NG9HelI2bHU1aUtmaENHZEZIbStXRXJXWUJ4NWZBUXFVWDhSTHRp?=
 =?utf-8?B?cnB1ZHpoUWh5Q0hzck0zUnF3eTRaQ0h2am9MSHFtOU52VVJQRWMxOU9kZWtH?=
 =?utf-8?B?NFdsRTBjdC9Bc05ibkIzd1paR1huQUtCS0k0N0dXSjdCcEo3S3JTTHpKT2ZG?=
 =?utf-8?B?aFlXUDMxck1Sc0RaMXViWEw1bmc5NnYrRlpVTHdJd1I0Z0JWUGo1RGpGb1dE?=
 =?utf-8?B?VlZINW9FcFdreVQvQU5HWHZGQnJ4TlJFZElpZExGU0xsYW1tOUJtd1BJWFc5?=
 =?utf-8?B?WUs2dVppNm93SUVVWmxoNkk3NnJBSUp2dTE1dDNOa2ZaTHNlb0xOYlpHOWRs?=
 =?utf-8?B?enBzOW9sc1Vyb3BPY1Fac0RMWlNUWXpIeVZrU0ZIWjZCQlZMRytyeUExVmNi?=
 =?utf-8?B?QlZsVWxhbEttcW1UQmt2cWhLMHg4cXY2cC9MQmVFZ1VwUlhqek9KcHN2d0xs?=
 =?utf-8?B?cWlMczA5RGRCZmhVa2ZTYWZYSDdscVMyY05KRGZFQWlzN3JWVDd6L1FPZ05k?=
 =?utf-8?B?VXlzY3Nmd0V4UWFtWmVQck5CYUppZ2t4czBFVEpPUDBhcVFhTnFJNC9OaGFC?=
 =?utf-8?B?anlqWENVTzQ3MS9KcXB1VmJDMmJIN2c2MjJKek5VV0p0TnNtUzJTVWFvWUxv?=
 =?utf-8?B?UFlQbFl0NDFaZFg5R3hnemQzelNPVyswTjE5cndOdXJPU3RHMU5KREdVdXlB?=
 =?utf-8?B?SS9SWnByNjR1Qm1PeUVCNkF6L29YVzBIOU5kMk9kcnBpdHQ3Ymo0djIxZGpG?=
 =?utf-8?B?WGI0aWVtZm05MUovZTk5TnZRVmZ2czlaWlplTFlMMTFvNG5JT25xK281U3Nu?=
 =?utf-8?B?dXAwRVlGbmxyRnFCeEVXZkZ6OTRVZFdXY25BdnZBcE5zTXd4M0dpUVJjeS8v?=
 =?utf-8?B?cUpGL1JaZDgyWUFPMytDZnFNeGZBQ0RiVGU1eGF0VlVVbGhiUjVKMm9HYmlo?=
 =?utf-8?B?WHBRTTZ2MjIrcVBmZ3UrMGdKTTNwVUtic3lFZzg0MlZrMm1keVRqdjMwKzZm?=
 =?utf-8?B?a2dnZWk2NUtaWDA0bGw1c1c3anp2Z2J5dWdOZ2FwR2FTampQK05laWloY21v?=
 =?utf-8?B?d3ZLMGJOMmt6OEwxSXd4bHdRNXI5Z2h5Tmx3dFIyWlBESGc5ckI5V3ZCRnJK?=
 =?utf-8?B?TkJkRWJMb1BEM0lUVjgwbVcvTDFUR2JEM0VqS3AvSmE3NUZ5SzMveTBvV3Aw?=
 =?utf-8?B?YUx0enBCdTJGVERpTVcwQ0YvbXR6RHBjK0Y4bWZMbWtaeFVaSm5uOW1DdUdO?=
 =?utf-8?B?dGxIc3pDdXNkcVdVbGliVy90SFYyZ2h3dWhvbmNJSzRwTEVvcmpiZXAzTnli?=
 =?utf-8?Q?uYJcE28FNg+9Nzq9Aq34F3GkH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85730d77-6cca-478e-dddb-08dc8a3cd77e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 17:35:09.9186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcGffnJCgtf9qSwR8S7QjF+KJDwrfG6372UUHEMu1bpxRPhcOKo39ZaOQ22C7GoSa+SAUDIbAoO0V8d8QgJ2vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8935
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



On 2024-06-05 06:04, Melissa Wen wrote:
> On 02/26, Harry Wentland wrote:
>> This is an RFC set for a color pipeline API, along with a sample
>> implementation in VKMS. All the key API bits are here. VKMS now
>> supports two named transfer function colorops and two matrix
>> colorops. We have IGT tests that check all four of these colorops
>> with a pixel-by-pixel comparison that checks that these colorops
>> do what we expect them to do with a +/- 1 8 bpc code point margin.
>>
>> The big new change with v4 is the addition of an amdgpu color
>> pipeline, for all AMD GPUs with DCN 3 and newer. Amdgpu now support
>> the following:
>>
>> 1. 1D Curve EOTF
>> 2. 3x4 CTM
>> 3. Multiplier
>> 4. 1D Curve Inverse EOTF
>> 5. 1D LUT
>> 6. 1D Curve EOTF
>> 7. 1D LUT
>>
>> The supported curves for the 1D Curve type are:
>> - sRGB EOTF and its inverse
>> - PQ EOTF, scaled to [0.0, 125.0] and its inverse
>> - BT.2020/BT.709 OETF and its inverse
> 
> So, as we talked in the 2024 Linux Display Next Hackfest, I hacked
> `drm_info` to show the KMS color pipeline properties. You can find the
> experimental-and-ugly code here:
> - https://gitlab.freedesktop.org/mwen/drm_info/-/merge_requests/1
> It depends on updating libdrm [1] and you will only see something if you
> use a custom kernel with this series applied.
> 

Thanks. That's very useful.

> After checking the output, I missed a kind of Default or "Identity"
> curve for the `CURVE_1D_TYPE` enum. I understand that if the color
> operation is set bypass, we can ignore all property values, but I didn't
> find a similar approach on plane properties, so it looks weird to me:
> 
> └───"CURVE_1D_TYPE" (atomic): enum {sRGB Inverse EOTF, BT.2020 OETF, PQ 125 Inverse EOTF} = invalid (0)
> 

Good catch. That's where drm_info is useful. We shouldn't be reporting
"invalid (0)" but default to any other value. I'll fix that.

While your suggestion would work for AMD I'm a bit reluctant to add an
Identity element. It doesn't add value over "BYPASS". But more importantly
we discussed that there might be some HW that doesn't support HW on
colorops. It would be better if we avoid assumptions about the availability
of identity or bypass.

> Another thing that caught my attention was the size property for 1D
> Curve Custom LUT, that I expected a similar setup to CRTC 1D LUTs:
> 
> └───"GAMMA_LUT_SIZE" (immutable): range [0, UINT32_MAX] = 4096
> 
> But I got:
> 
> ├───"SIZE" (atomic): range [4096, 4096] = 4096
> 
> Any thoughts?

We should stick with same behavior as GAMMA_LUT_SIZE. I'll change
that.

> 
> Anyway, see below an example of `drm_info` output on AMD DCN301 for a
> given Overlay/Primary plane without userspace usage of the properties:
> 
>     │       └───"COLOR_PIPELINE" (atomic): enum {Bypass, Color Pipeline 265} = Bypass
>     │           ├───Bypass
>     │           └───Color Pipeline 265
>     │               ├───Color Operation 265
>     │               │   ├───"TYPE" (immutable): enum {1D Curve, 1D Curve Custom LUT, 3x4 Matrix, Multiplier} = 1D Curve
>     │               │   ├───"BYPASS" (atomic): range [0, 1] = 1
>     │               │   └───"CURVE_1D_TYPE" (atomic): enum {sRGB EOTF, BT.2020 Inverse OETF, PQ 125 EOTF} = sRGB EOTF
>     │               ├───Color Operation 270
>     │               │   ├───"TYPE" (immutable): enum {1D Curve, 1D Curve Custom LUT, 3x4 Matrix, Multiplier} = 3x4 Matrix
>     │               │   ├───"BYPASS" (atomic): range [0, 1] = 1
>     │               │   └───"DATA" (atomic): blob = 0
>     │               ├───Color Operation 275
>     │               │   ├───"TYPE" (immutable): enum {1D Curve, 1D Curve Custom LUT, 3x4 Matrix, Multiplier} = Multiplier
>     │               │   ├───"BYPASS" (atomic): range [0, 1] = 1
>     │               │   └───"MULTIPLIER" (atomic): range [0, UINT64_MAX] = 0
>     │               ├───Color Operation 280
>     │               │   ├───"TYPE" (immutable): enum {1D Curve, 1D Curve Custom LUT, 3x4 Matrix, Multiplier} = 1D Curve
>     │               │   ├───"BYPASS" (atomic): range [0, 1] = 1
>     │               │   └───"CURVE_1D_TYPE" (atomic): enum {sRGB Inverse EOTF, BT.2020 OETF, PQ 125 Inverse EOTF} = invalid (0)
>     │               ├───Color Operation 285
>     │               │   ├───"TYPE" (immutable): enum {1D Curve, 1D Curve Custom LUT, 3x4 Matrix, Multiplier} = 1D Curve Custom LUT
>     │               │   ├───"BYPASS" (atomic): range [0, 1] = 1
>     │               │   ├───"SIZE" (atomic): range [4096, 4096] = 4096
>     │               │   └───"DATA" (atomic): blob = 0
>     │               ├───Color Operation 291
>     │               │   ├───"TYPE" (immutable): enum {1D Curve, 1D Curve Custom LUT, 3x4 Matrix, Multiplier} = 1D Curve
>     │               │   ├───"BYPASS" (atomic): range [0, 1] = 1
>     │               │   └───"CURVE_1D_TYPE" (atomic): enum {sRGB EOTF, BT.2020 Inverse OETF, PQ 125 EOTF} = sRGB EOTF
>     │               └───Color Operation 296
>     │                   ├───"TYPE" (immutable): enum {1D Curve, 1D Curve Custom LUT, 3x4 Matrix, Multiplier} = 1D Curve Custom LUT
>     │                   ├───"BYPASS" (atomic): range [0, 1] = 1
>     │                   ├───"SIZE" (atomic): range [4096, 4096] = 4096
>     │                   └───"DATA" (atomic): blob = 0
> 
> It's a WIP and the output still needs to be reviewed. So feel free to
> point out any mistake.
> 

Thanks for doing this work.

Btw, I can't seem to access your MR but found the kms_color branch on your
fork of drm_info.

Harry

> BR,
> 
> Melissa
> 
>>
>> Note that the 1st and 5th colorops take the EOTF or Inverse
>> OETF while the 3rd colorop takes the Inverse EOTF or OETF.
>>
>> We are working on two more ops for amdgpu, the HDR multiplier
>> and the 3DLUT, which will give us this:
>>
>> 1. 1D Curve EOTF
>> 2. 3x4 CTM
>> 3. HDR Multiplier
>> 4. 1D Curve Inverse EOTF
>> 5. 1D LUT
>> 6. 3D LUT
>> 7. 1D Curve EOTF
>> 8. 1D LUT
>>
>> This, essentially mirrors the color pipeline used by gamescope
>> and presented by Melissa Wen, with the exception of the DEGAM
>> LUT, which is not currently used. See
>> [1] https://indico.freedesktop.org/event/4/contributions/186/attachments/138/218/xdc2023-TheRainbowTreasureMap-MelissaWen.pdf
>>
>> After this we'd like to also add the following ops:
>> - Scaler (Informational only)
>> - Color Encoding, to replace drm_plane's COLOR_ENCODING
>> - Color Range, to replace drm_plane's COLOR_RANGE
>>
>> This patchset is grouped as follows:
>>  - Patches 1-3: couple general patches/fixes
>>  - Patches 4-7: introduce kunit to VKMS
>>  - Patch 7: description of motivation and details behind the
>>             Color Pipeline API. If you're reading nothing else
>>             but are interested in the topic I highly recommend
>>             you take a look at this.
>>  - Patches 7-27: DRM core and VKMS changes for color pipeline API
>>  - Patches 28-40: DRM core and amdgpu changes for color pipeline API
>>
>> VKMS patches could still be improved in a few ways, though the
>> payoff might be limited and I would rather focus on other work
>> at the moment. The most obvious thing to improve would be to
>> eliminate the hard-coded LUTs for identity, and sRGB, and replace
>> them with fixed-point math instead.
>>
>> There are plenty of things that I would like to see here but
>> haven't had a chance to look at. These will (hopefully) be
>> addressed in future iterations, either in VKMS or amdgpu:
>>  - Clear documentation for each drm_colorop_type
>>  - Add custom LUT colorops to VKMS
>>  - Add pre-blending 3DLUT
>>  - How to support HW which can't bypass entire pipeline?
>>  - Add ability to create colorops that don't have BYPASS
>>  - Can we do a LOAD / COMMIT model for LUTs (and other properties)?
>>  - read-only scaling colorop which defines scaling taps and position
>>  - read-only color format colorop to define supported color formats
>>    for a pipeline
>>  - named matrices, for things like converting YUV to RGB
>>
>> IGT tests can be found at
>> https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/merge_requests/1
>>
>> IGT patches are also being sent to the igt-dev mailing list.
>>
>> If you prefer a gitlab MR for review you can find it at
>> https://gitlab.freedesktop.org/hwentland/linux/-/merge_requests/5
>>
>> v4:
>>  - Add amdgpu color pipeline (WIP)
>>  - Don't block setting of deprecated properties, instead pass client cap
>>    to atomic check so drivers can ignore these props
>>  - Drop IOCTL definitions (Pekka)
>>  - Use enum property for colorop TYPE (Pekka)
>>  - A few cleanups to the docs (Pekka)
>>  - Rework the TYPE enum to name relation to avoid code duplication (Pekka)
>>  - Add missing function declarations (Chaitanya Kumar Borah)
>>  - Allow setting of NEXT property to NULL in _set_ function (Chaitanya Kumar Borah)
>>  - Add helper for creation of pipeline drm_plane property (Pekka)
>>  - Always create Bypass pipeline (Pekka)
>>  - A bunch of changes to VKMS kunit tests (Pekka)
>>  - Fix index in CTM doc (Pekka)
>>
>> v3:
>>  - Abandon IOCTLs and discover colorops as clients iterate the pipeline
>>  - Remove need for libdrm
>>  - Add color_pipeline client cap and make mutually exclusive with
>>    COLOR_RANGE and COLOR_ENCODING properties
>>  - add CTM colorop to VKMS
>>  - Use include way for kunit testing static functions (Arthur)
>>  - Make TYPE a range property
>>  - Move enum drm_colorop_type to uapi header
>>  - and a bunch of smaller bits that are highlighted in the relevant commit
>>    description
>>
>> v2:
>>  - Rebased on drm-misc-next
>>  - Introduce a VKMS Kunit so we can test LUT functionality in vkms_composer
>>  - Incorporate feedback in color_pipeline.rst doc
>>  - Add support for sRGB inverse EOTF
>>  - Add 2nd enumerated TF colorop to VKMS
>>  - Fix LUTs and some issues with applying LUTs in VKMS
>>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Jonas Ådahl <jadahl@redhat.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Alexander Goins <agoins@nvidia.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>> Cc: Aleix Pol <aleixpol@kde.org>
>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>> Cc: Victoria Brekenfeld <victoria@system76.com>
>> Cc: Sima <daniel@ffwll.ch>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
>> Cc: Christopher Braga <quic_cbraga@quicinc.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Arthur Grillo <arthurgrillo@riseup.net>
>> Cc: Hector Martin <marcan@marcan.st>
>> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
>> Cc: Sasha McIntosh <sashamcintosh@google.com>
>> Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>
>> Alex Hung (10):
>>   drm/colorop: define a new macro for_each_new_colorop_in_state
>>   drm/amd/display: Skip color pipeline initialization for cursor plane
>>   drm/amd/display: Add support for sRGB EOTF in DEGAM block
>>   drm/amd/display: Add support for sRGB Inverse EOTF in SHAPER block
>>   drm/amd/display: Add support for sRGB EOTF in BLND block
>>   drm/colorop: Add 1D Curve Custom LUT type
>>   drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT
>>   drm/amd/display: add 3x4 matrix colorop
>>   drm/colorop: Add mutliplier type
>>   drm/amd/display: add multiplier colorop
>>
>> Harry Wentland (32):
>>   drm: Don't treat 0 as -1 in drm_fixp2int_ceil
>>   drm: Add helper for conversion from signed-magnitude
>>   drm: Correctly round for fixp2int_round
>>   drm/vkms: Round fixp2int conversion in lerp_u16
>>   drm/vkms: Create separate Kconfig file for VKMS
>>   drm/vkms: Add kunit tests for VKMS LUT handling
>>   drm/vkms: Avoid reading beyond LUT array
>>   drm/doc/rfc: Describe why prescriptive color pipeline is needed
>>   drm/colorop: Introduce new drm_colorop mode object
>>   drm/colorop: Add TYPE property
>>   drm/colorop: Add 1D Curve subtype
>>   drm/colorop: Add BYPASS property
>>   drm/colorop: Add NEXT property
>>   drm/colorop: Add atomic state print for drm_colorop
>>   drm/plane: Add COLOR PIPELINE property
>>   drm/colorop: Add NEXT to colorop state print
>>   drm/vkms: Add enumerated 1D curve colorop
>>   drm/vkms: Add kunit tests for linear and sRGB LUTs
>>   drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>>   drm/colorop: Add 3x4 CTM type
>>   drm/vkms: Pull apply_colorop out of pre_blend_color_transform
>>   drm/vkms: Use s32 for internal color pipeline precision
>>   drm/vkms: add 3x4 matrix in color pipeline
>>   drm/tests: Add a few tests around drm_fixed.h
>>   drm/vkms: Add tests for CTM handling
>>   drm/colorop: pass plane_color_pipeline client cap to atomic check
>>   drm/amd/display: Ignore deprecated props when plane_color_pipeline set
>>   drm/amd/display: Add bypass COLOR PIPELINE
>>   drm/colorop: Add PQ 125 EOTF and its inverse
>>   drm/amd/display: Enable support for PQ 125 EOTF and Inverse
>>   drm/colorop: add BT2020/BT709 OETF and Inverse OETF
>>   drm/amd/display: Add support for BT.709 and BT.2020 TFs
>>
>>  Documentation/gpu/rfc/color_pipeline.rst      | 360 ++++++++
>>  drivers/gpu/drm/Kconfig                       |  14 +-
>>  drivers/gpu/drm/Makefile                      |   1 +
>>  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 352 ++++++++
>>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 160 ++++
>>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
>>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  32 +
>>  drivers/gpu/drm/drm_atomic.c                  | 161 +++-
>>  drivers/gpu/drm/drm_atomic_helper.c           |  12 +
>>  drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
>>  drivers/gpu/drm/drm_atomic_uapi.c             | 158 ++++
>>  drivers/gpu/drm/drm_colorop.c                 | 411 +++++++++
>>  drivers/gpu/drm/drm_ioctl.c                   |   7 +
>>  drivers/gpu/drm/drm_mode_config.c             |   7 +
>>  drivers/gpu/drm/drm_plane.c                   |  52 ++
>>  drivers/gpu/drm/tests/Makefile                |   3 +-
>>  drivers/gpu/drm/tests/drm_fixp_test.c         |  69 ++
>>  drivers/gpu/drm/vkms/Kconfig                  |  20 +
>>  drivers/gpu/drm/vkms/Makefile                 |   4 +-
>>  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 449 ++++++++++
>>  drivers/gpu/drm/vkms/vkms_colorop.c           | 100 +++
>>  drivers/gpu/drm/vkms/vkms_composer.c          | 135 ++-
>>  drivers/gpu/drm/vkms/vkms_drv.h               |   8 +
>>  drivers/gpu/drm/vkms/vkms_luts.c              | 802 ++++++++++++++++++
>>  drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
>>  drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
>>  include/drm/drm_atomic.h                      | 122 +++
>>  include/drm/drm_atomic_uapi.h                 |   3 +
>>  include/drm/drm_colorop.h                     | 301 +++++++
>>  include/drm/drm_file.h                        |   7 +
>>  include/drm/drm_fixed.h                       |  35 +-
>>  include/drm/drm_mode_config.h                 |  18 +
>>  include/drm/drm_plane.h                       |  13 +
>>  include/uapi/drm/drm.h                        |  16 +
>>  include/uapi/drm/drm_mode.h                   |  14 +
>>  38 files changed, 3882 insertions(+), 30 deletions(-)
>>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
>>  create mode 100644 drivers/gpu/drm/drm_colorop.c
>>  create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
>>  create mode 100644 drivers/gpu/drm/vkms/Kconfig
>>  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>>  create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
>>  create mode 100644 include/drm/drm_colorop.h
>>
>> --
>> 2.44.0
>>

