Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EF2AEEE68
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 08:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A77D10E4F1;
	Tue,  1 Jul 2025 06:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UIuptiUM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299C310E4F1;
 Tue,  1 Jul 2025 06:14:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRbZDTzZh66zaOjFSsJMg8K0FdPeRxx5dFyuGJk+Lpaj9TvNY3ea/iXtcBUwqxL8n4xHUxKHm3KG6zj5OMlO6IXgjzNuk36VdYbTbDw3XTzz9ODtgw10shllOh/VU4u3yVjsXU5w/4YPhBi1nj6jki8pirJtc6KAuB/o4EH12KxRKhpHdXPVDi+onA6+NaPJ1F1/18qdWyGEO00JXs5Ve4OuZVmHirzNVX+tKj7JZF2CuvzOzk3b6xCCZvktjDjYgKHaCVWh0Fp1cPElAzaH9JTjtrbCnIyHCBpNjAXLFUaMAeJJlmXQfD0LNvPkGh2CFAOpL80YzUL2q/+pJY0j3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0I91PfjRD4MPSs8HXlIYmkjQlzTsa24MxbQcEdfkYVs=;
 b=NCIGKv7Hcqp11/QdfNC25nUCIQJDYNW8RvjZG2qCzDphzC2R3XM3iffy0WI35Fs8VoEkIPUP43Ji0KFiEYW2U15oyAqxDlf336NSH93cbOLlmrm5eXRRw5Oa/obDHSwwL3e9cleqtYdbgcVKqbGCEc88cij4F6Bv8s36gQumk9iteOaDYIkU6Qq+tAw9HWwMmtE6zYvksCOnw62omwHWKhYGm2Oazx1SlVe1QGPA86//DLSSrs4qBVx7G487YoMn8l55T8u5BZ4m40phP4H/3Rsxjri8md1lx0x2r4WdZ/AkkpexMt1DIS6rRdGGlXMH1kgsBw/SfywfA41Ya6gzXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0I91PfjRD4MPSs8HXlIYmkjQlzTsa24MxbQcEdfkYVs=;
 b=UIuptiUMozmuIACvrY40iGUej6B3I9v/SiuOJIbdybE0n4gP3GcdJjHfEKR2QDCRgFm3+V9Y6WaxNoao0c2d8raw7j43WHFBsruMDcvbLPdL9u2iksoqzQL/bTnRo5qPjjpj7/394dFy6PNSmMZBS7TbhCpCbxwGcsoHcAbi7P8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 06:14:24 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::81e6:908a:a59b:87e2]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::81e6:908a:a59b:87e2%6]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 06:14:24 +0000
Message-ID: <7d1d4aef-8819-4e5b-af83-762a8d2ca0fa@amd.com>
Date: Tue, 1 Jul 2025 11:44:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm: move the debugfs accel driver code to drm
 layer
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Sunil Khatri <sunil.khatri@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250630143613.2520111-1-sunil.khatri@amd.com>
 <9e45cdbe-8cdf-42ab-8769-067ff8f30e1c@oss.qualcomm.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <9e45cdbe-8cdf-42ab-8769-067ff8f30e1c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::9) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|IA1PR12MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4fbdd0-329d-4e99-d271-08ddb86686b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmVGcmpmejJ6L1NDTVFZOVNpVzkzQ0ZDeUNIVnlnWjllYUxyWDVETVBoTVdC?=
 =?utf-8?B?azd0ay9CYmhBQ09ycmdvVlVha0EwdVJhcHpsMytNZlV5WXZkeDhETTF1MVk3?=
 =?utf-8?B?MWdZMWtTK0VGWnM2Z3dCemlXaWwrRzVUY09mY0VnM0gydEdQZ0tZaC91US90?=
 =?utf-8?B?aXozS3YxYVBaUzZGWFF3a1FLalM4WnlmNUptajBRNzgxbnErMGV1YnRZWjR3?=
 =?utf-8?B?eWVmRlA3MXJLU2pwYjExNVVZNXZ2MU4vMTJpWjRwOHpGVXBWYnVpVkI1UUpI?=
 =?utf-8?B?QXZBU2RrK09EMkxza2tkY1ZCSG1Da3J4UndQZWNuTit4RG90V1YzTWFmdFc3?=
 =?utf-8?B?Y09kVlR2aTZqUWEwK2doYjBWb3dnbWE5b2pNcjMwaVJveUtQSXZiQVRTWTls?=
 =?utf-8?B?Ly9ONUVFRjd2U1BxbDRnSWJYaGJvR3ZyaG9iSm81anBrQnE0bEI2Q3pOTCtN?=
 =?utf-8?B?Y1gwVzcxNWdSUkZuaUZFa2s5eW9HRFZZUnB2R05OWElRQitqYVJzRkRsNWIz?=
 =?utf-8?B?R1FVMUlRam5ISWhydVpDNXJYdVo2QkVUVTJpVCsvTTR2UG9xN1VPc1hZOFBR?=
 =?utf-8?B?VTVaUnRtaXJlWjZaOEZQWDR4NHBTU1dzaTE5V1lKVHhzejZQME9Md3lsSGYr?=
 =?utf-8?B?RHNzNnlCa2ZzOHlXcVY5b0Fjbk5hZEk5Z25IODJaMVAySjcxK0pRcFA4a2dT?=
 =?utf-8?B?Ym9MN1NQMDlsNVd2Rm5BeFBIOHBZQ2d6Vkx1ZUlQS08vTnJKbHRETXdNRmRW?=
 =?utf-8?B?LzFwSUxodk95VTFINEVRYmYySlpKd0ExdE1lV0g1NHp6K0l4anFFMmhsVGM1?=
 =?utf-8?B?QU85VzhUVUJzV1BzWU1VRnY0Q0hvclpuSjNPbHpqbldBVEYvQ3Zrd3FKSURl?=
 =?utf-8?B?b21HSGtUYy93TUZQb3liTmd3c2U0MFd5aWs5VkpuYW9Rc1drM1VJQlAwWDF4?=
 =?utf-8?B?bDVSaElSaTZ3bGZHRzJMSmZ6aWFHUy9DMnE4cTRyaVhpOUxRdGV4Z1Y3OGFo?=
 =?utf-8?B?Z2kzWVUydnFtQ01USmx3VXJNcnkyTzRWNWtLTHpBWnZ3ZGlhMUFWb0lYSE91?=
 =?utf-8?B?cmducC8rNERpVG5wOGYvQXRocHQycGdzM3NwZ0RyUEdhQitRR3p3U2c4Y0Zn?=
 =?utf-8?B?SC8zaWlhSUFFVXh1Ri8xOFpKbTNHaklZb0Z5RVVJSnl1ZGJoZ0NBTmU4WDZa?=
 =?utf-8?B?OThBUDNVSWUzb2lJamNQU3FZOVJHWmp1NXB4SzBvbm5rWDVueXJjUkVMMkkv?=
 =?utf-8?B?TjZpc1paTzJJVW1TcXdoY05nWC8wTEhVYWF4bkh4bkszanhIWVQxWVZScEU3?=
 =?utf-8?B?emlPOGpZcDRJNHZTTG5LSmxoaVdaK0ZSSEgxZkNkeXlSWjFOVlFoYUhid2hW?=
 =?utf-8?B?R2ZDUlJ3K2kzRlZHSjF6bnpxVG14WjlUNXBEZjBvcm42NUc5QzhaTjljWTVt?=
 =?utf-8?B?TVZpWDRwZnpjNm9VSUNZM0hiRnJDcGN6R3M0UENLTzdSWFNIajhpMDVjQkFr?=
 =?utf-8?B?UDhKZE1ZN0x6cHlOMytZTHM1TXZ5cXpuTFdITThlWERGVXFYaXRla1FEcjE3?=
 =?utf-8?B?WFltZU8rVjZtVVZOeVJDSjRteVVmdEtUSk9SYlRlUnJFVTJuNHRzR2VsMHZZ?=
 =?utf-8?B?YmdEZUcrRGo0SFRxemJkZG1BNEphenZnUUxTdWlGRjZaTDF6OHRnSE1GRTE4?=
 =?utf-8?B?c2M4QXVaemdWR1ZiMCtKWmxKcDR2THl0ZlJZM2tRcTFNTmkwa3NsTlhEZ2k5?=
 =?utf-8?B?UGFqLzZtZzlmL1Bud3BORm1pR0tSZmh1ZE1jdHZraDdVQkU1UUhldEZsWGJE?=
 =?utf-8?B?cktCYXdVUDg1SGhFTFJCUS8zTlBxdlgvVFBOZ0t2WGVaQWphQS9IMGFRNTZs?=
 =?utf-8?B?dGpPOW8zQXNhVThoUnR3K2lVbWRvR0V4K3lzR050eXF6UXZvMWxNUVloV2do?=
 =?utf-8?Q?5F3OCOBG3co=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmIxMk9PYlpObG52V29uV3pMUFNVbU1tTFYyTHBoTnhteWZTMG1ESVBXUnBH?=
 =?utf-8?B?TlFjUlZOOFVEUlhMaHJrcGppOUdabGt2ZW9oaWZTWFQ0dHBpUkNCVzl1VWs4?=
 =?utf-8?B?UXVOMTl1a21DMGdpTTVXU0ZQSU5TTzVpWVFvcm1KM0VGc01aU1BUYU44OWxM?=
 =?utf-8?B?dC9JYVN6Z09DcFRMaTNVNkYyQVM4NjBuWDdQbDlielpna3hVajk2dWczQ203?=
 =?utf-8?B?SU9FL0FJUThhZFBZOUcwYThkSDZYSmU1OTE3U2pWSEE1L1YzR3NWeDZxaDBz?=
 =?utf-8?B?a1N6Z3JUeXh2bUlDK0hES1RLNmE0R3ArSjk1RnRjRFRZSU40d1VRRmozWXd1?=
 =?utf-8?B?aWZ6RkJBM2M5bURQT2UzazFEa0wrWU1PQ21FcVQxZFFjNzFOT3pyVk8yVDNJ?=
 =?utf-8?B?bjFrVEFyanl0OGUrZCtDUVNLZno0OUF6UGxxK0VTNUxYOXFpZmlIWXMzdU52?=
 =?utf-8?B?V2VoKzZNNjRKMTY0emJqcjdxaUpmbFJVRXRxdm5wZ0lUQmtyd1hYY2JYK2J6?=
 =?utf-8?B?R0VtY2ZCNHA0NEFlNUFDdGRsa2dKQlFpaGpiaWNqdEU3STNjS3p5VjBCc1RE?=
 =?utf-8?B?SG1pdnptUXBOZm55cmlJN2pJNFl1eFMwOTlvZFB3TTNwSmlhb3VxR0NRZnBU?=
 =?utf-8?B?YTBJc1pUUVZnY2drcklUVzh1U3p2TW96bHdjVDIxaGJ1dVJ2dEpVajY3aEI1?=
 =?utf-8?B?SWJyMVF3ZklBVEhrTHdpR01Fa0MvUFI0dDIwVDBTZ1diN3pITTAxZFBYQ1Fi?=
 =?utf-8?B?WDlvYUt2Wm5FZmxnWXppV01RR0xadXFrSzIrL1FBRlYwTXc3S1ZvajJJdkRW?=
 =?utf-8?B?NWtjeEswMHVuR0RNZjI0UW42SmFFRHQ5SjJ4U0lsV3NpRUZaVHZhdi9IbUZU?=
 =?utf-8?B?NDFuTmUvY3BveVdrdlp2VitGc2lleHZNVzV3MjlvZHJ0VHBIUCtCd0RNMk5U?=
 =?utf-8?B?aEtSWVlJQnc2SkttQzZaWGI0a2l0MU9GVnhXaEM2ZjUzNnUzT2gyTDlZZlAv?=
 =?utf-8?B?OU5YK1ZZem8ydHBBSzgzWmw3QUNhVXlLOXQ0K2ZGZ3RVNUhXdUZvYjRRR2p1?=
 =?utf-8?B?aXVOcUtMVkdrUkZWNHJvcVRRcjBVYXh0dCtkdTIybDFPU2Nzb2U1U0o4bnNW?=
 =?utf-8?B?MEJza0tTNUZyWmxnbk8ycENpS294SFRZN045azUxWGdnbUxka282dUxtekJZ?=
 =?utf-8?B?Q3ZTc0lwd0NvaUhhZ1Y1dWNUWG9vbEwzRXpIT3E1dVlQVGZxakdKejQvZ2pr?=
 =?utf-8?B?bnNqUXB5WGNVSTRTcHM1NUxrUytOaTc2R1VmY2xDNDFjN0t0bEF4bm83cUM3?=
 =?utf-8?B?RTBwdURoN2dmQTNQNWZQYW1iUzVwL0tvYTZ6cjd4eTlxSVcyTStKSlhXZjJP?=
 =?utf-8?B?Q21rM1RmRE85anIxcWtqWnd4Uld6RXVLWTMzajBwcmdObDdWUjFUdk5KTFVn?=
 =?utf-8?B?c080czg0VnVQeHpaOTFnM2NPa2pnM1RqQ1lVVEF2anUrRzUzbmpmYWVTdmVJ?=
 =?utf-8?B?MWJFUS9od1dEV0lpSlltT1F4ejg0SFRxY1l6d29iSG1HZHQ4VUtuZkpUOEND?=
 =?utf-8?B?Yk5tV3V6cTZtd2F0emlBL3diakUxdkZ4OXVIM0tRdUc0eU0rbjZ0MzhsNENX?=
 =?utf-8?B?WVhmeS8wUmtwYkJBYm5QRU9JVnU2R2lOejI4alhwaXhUejRIdHA2NFhTZnVT?=
 =?utf-8?B?Q1JzYkxjOC9Gb1oxUGhhOXBGVDlZdjM4WndiUnFUcmhFQzZFcE40U3lIaTEw?=
 =?utf-8?B?Z01VeTBSZW9WUWIyaXg0b0RSQVNwN1ZFVStEN1hYeFF3c0JXK2Vva0p1YlZZ?=
 =?utf-8?B?bWd6TjF0OTFPM2RoSEhYNmhHV1M4a0tLNzBCREk3UE9sbWdleGc1RXNBRWIv?=
 =?utf-8?B?WlQ5M3lOYkIxV0RLZm5jZmJudmRWT2wvRDhXWG1vcGF2d3pQNktXVnlRNVgy?=
 =?utf-8?B?QXNHeDJZRUYvQjZVTnhnNGFURS9NaGJ0YkFIMTQ5ODNhM29mRTlRakxsVG1h?=
 =?utf-8?B?STJzMVQwSlh2bU9SV1p1RzJEVytrYW1LTU5KVENzRTlXWWc5YkpvSENkd3pC?=
 =?utf-8?B?bXJGaDVIbm82NzlIVmRabWNNSjdvclZZOURPR2dLVUIvZWhtNVhZOUZtUWdQ?=
 =?utf-8?Q?XBECO7c2qBkxPs8EHlpShpfqO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4fbdd0-329d-4e99-d271-08ddb86686b5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 06:14:24.6431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdKqDabcdSgLDJzYFjpvPX/0nhTPfP5RREJbRLOV6ffN1uq5zYnuEyKm2oL2ktswOcK32+k+5Djz27aZZCf6fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6532
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


On 6/30/2025 8:49 PM, Jeff Hugo wrote:
> On 6/30/2025 8:36 AM, Sunil Khatri wrote:
>
> I don't see a cover letter on list. Surely there should be one?
Yes there is one with the first version of patches.
>
> Looks like you didn't send this to the Accel maintainer. Did you 
> forget to run the get_maintainers/pl script?
Let me check and add more. Christian is already there who did make 
changes to code around that area where i made but surely let me add more.
>> Move the debugfs accel driver code to the drm layer
>> and it is an intermediate step to move all debugfs
>> related handling into drm_debugfs.c
>
> This is missing the answer to the most important question - why?
Updated in V8.
>
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/accel/drm_accel.c | 16 ----------------
>>   drivers/gpu/drm/drm_drv.c |  6 +++++-
>>   include/drm/drm_accel.h   |  5 -----
>>   3 files changed, 5 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
>> index aa826033b0ce..ca3357acd127 100644
>> --- a/drivers/accel/drm_accel.c
>> +++ b/drivers/accel/drm_accel.c
>> @@ -20,8 +20,6 @@
>>     DEFINE_XARRAY_ALLOC(accel_minors_xa);
>>   -static struct dentry *accel_debugfs_root;
>> -
>>   static const struct device_type accel_sysfs_device_minor = {
>>       .name = "accel_minor"
>>   };
>> @@ -73,17 +71,6 @@ static const struct drm_info_list 
>> accel_debugfs_list[] = {
>>   };
>>   #define ACCEL_DEBUGFS_ENTRIES ARRAY_SIZE(accel_debugfs_list)
>>   -/**
>> - * accel_debugfs_init() - Initialize debugfs for device
>> - * @dev: Pointer to the device instance.
>> - *
>> - * This function creates a root directory for the device in debugfs.
>> - */
>> -void accel_debugfs_init(struct drm_device *dev)
>> -{
>> -    drm_debugfs_dev_init(dev, accel_debugfs_root);
>> -}
>> -
>>   /**
>>    * accel_debugfs_register() - Register debugfs for device
>>    * @dev: Pointer to the device instance.
>> @@ -194,7 +181,6 @@ static const struct file_operations 
>> accel_stub_fops = {
>>   void accel_core_exit(void)
>>   {
>>       unregister_chrdev(ACCEL_MAJOR, "accel");
>> -    debugfs_remove(accel_debugfs_root);
>>       accel_sysfs_destroy();
>>       WARN_ON(!xa_empty(&accel_minors_xa));
>>   }
>> @@ -209,8 +195,6 @@ int __init accel_core_init(void)
>>           goto error;
>>       }
>>   -    accel_debugfs_root = debugfs_create_dir("accel", NULL);
>> -
>>       ret = register_chrdev(ACCEL_MAJOR, "accel", &accel_stub_fops);
>>       if (ret < 0)
>>           DRM_ERROR("Cannot register ACCEL major: %d\n", ret);
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 17fc5dc708f4..5d57b622f9aa 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -70,6 +70,7 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
>>   static bool drm_core_init_complete;
>>     static struct dentry *drm_debugfs_root;
>> +static struct dentry *accel_debugfs_root;
>>     DEFINE_STATIC_SRCU(drm_unplug_srcu);
>>   @@ -752,7 +753,7 @@ static int drm_dev_init(struct drm_device *dev,
>>       }
>>         if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
>> -        accel_debugfs_init(dev);
>> +        drm_debugfs_dev_init(dev, accel_debugfs_root);
>>       else
>>           drm_debugfs_dev_init(dev, drm_debugfs_root);
>>   @@ -1166,6 +1167,7 @@ static void drm_core_exit(void)
>>   {
>>       drm_privacy_screen_lookup_exit();
>>       drm_panic_exit();
>> +    debugfs_remove(accel_debugfs_root);
>>       accel_core_exit();
>>       unregister_chrdev(DRM_MAJOR, "drm");
>>       debugfs_remove(drm_debugfs_root);
>> @@ -1193,6 +1195,8 @@ static int __init drm_core_init(void)
>>       if (ret < 0)
>>           goto error;
>>   +    accel_debugfs_root = debugfs_create_dir("accel", NULL);
>
> Did you test this with CONFIG_DRM_ACCEL=n?
> It looks like you change the behavior with this change in that we'll 
> have an accel debugfs directory created, even when ACCEL is not built 
> into DRM.

Thanks for catching that out. Added support based on the configuration now.

Regards
Sunil Khatri

