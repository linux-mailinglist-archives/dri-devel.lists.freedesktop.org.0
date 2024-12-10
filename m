Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BDC9EBB2D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 21:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F85D10E079;
	Tue, 10 Dec 2024 20:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Li2Yg5As";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E013710E079
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 20:54:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cm+bejmFcYUaexcVB8pwXNkSMoxxi+p5TLGSlYr4A6Uriigc7W4ZmHWWgLBmyh1uS7J6tJRcp32SrgZKTLtMFcbC/oSRIWDgDRQoTkmE2+E0tyHC22kyaoloPwtm8bSeWp02t99tg9rxSzLjcFPfOOR+8HaMul8q0Nx9sFM4VcUGM0m/iUA7DPDjfGTekz5RIbQjRqy8JtdDxygsc5yC03gYpuh1g+G8cATakswUfJDK9BovoPmXLxgVuipXe3kFAcdjVGDFk3MQT6gfNqxQMLyDcUvDm/b987RfYJgrm1oF43+lHW1ZCb2GlSF0zMCyRz16zkmg3xidGJ4l9H0aHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FV7VA62NY3i374OTHPC1KfbVne9fGpnI6Apu0KGBuY=;
 b=wuj1be8URnJvCVmwmTaR85T1tzY5yLn3JoXlxnoFvSSFEqOrdIr92EacAqKe8CAlzrYnpdM1sMEDPu+dmmfOCZKIimJ9nsRTXEwnlpFQ4No5DQeS0Tl7B+OlUYMbtL8XZtZROg12casDdSmiA4jRR9Q8zLrhnDMQLr4bqD2FzHBlo2aE+AR+xXID5WojbnfFQz7pl8r3M+vWxoZLtU14iBkr1E6XpTqwCLbT/0aQO5grHz0F+UkJ9hy7BBdmXwhDSZvv00/lI+ciGpd6vl9sZ8HDITYkUWR1jtF1MbWvDS69y5M9LHhuKhUMOrgWBRQNaX3jbtrNz0zpr17v0tgH0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FV7VA62NY3i374OTHPC1KfbVne9fGpnI6Apu0KGBuY=;
 b=Li2Yg5Asz5QkFsY6B0XncD1c33M3BjNXalZx4G/z8SjPSEbVQPOJl+bC6yDNXXWbCmY9kE2ll/KTRBlORK8nJWRbj4VrSfO6yfGFbPUSzcS5dWZphjNmHqjKObudBFHmyqlthxuWZwSvPV3KQzZx9gzqXQHMc09sx/qjygf4l+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6539.namprd12.prod.outlook.com (2603:10b6:510:1f0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 20:54:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 20:54:16 +0000
Message-ID: <ca31d00b-7a12-4f1a-98cd-e1ee458e053f@amd.com>
Date: Tue, 10 Dec 2024 14:54:13 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 8/8] accel/amdxdna: Add include interrupt.h to
 amdxdna_mailbox.c
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com, Mike Lothian <mike@fireburn.co.uk>
References: <20241206220001.164049-1-lizhi.hou@amd.com>
 <20241206220001.164049-9-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241206220001.164049-9-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0121.namprd11.prod.outlook.com
 (2603:10b6:806:131::6) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: fc622003-2959-4bff-68bb-08dd195ccf9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUtJNXlrN2tOcDNXN04rdG90bUdObFl3SngyNVBEZWNJeWtSSTZtaVJLbVBl?=
 =?utf-8?B?Y2VkVUNuNWJwTUFKOE1KM3R3TFlGSnQ5UTJOWnZqWiszbzllcWZ2dzAreElM?=
 =?utf-8?B?M3dtODIyc1o5cVZJeDBkV1l0RVFpcGVLbkNULzdFY0c4bVMwVC8zcUFhNDVK?=
 =?utf-8?B?LzAvdW5aemNwZkhFYkYwVm5meDZZcWdqVXhKMmhpOU5XQkhhRXBMd1pQeE9y?=
 =?utf-8?B?NjdoWXpPU2NIL2pTdWQ4Smt2TVdtTmxrWkRGdjVkaU9vcW1idVlNL2lNeGx3?=
 =?utf-8?B?ZVBZcDRkTlExTXV1OU9lSWVFWkNLcjF3VFh0RVhrRUc1WHBrSmhuK2VTb0la?=
 =?utf-8?B?UExPY1Z1UnQ0a3Nsd2pqenhxcGsvZUVxY1MrNURrcHRLS21TY2hTTVh4SjFT?=
 =?utf-8?B?SXAvOTNST2I0UXJyeGRza3pLV2VlZ1NnYjdlYzhYQy84Z0U5SXNIU0JOK2ox?=
 =?utf-8?B?Mno2TGtFMFpBdmF3bDdoa0dVMytBaVBQZzVkZDZEbnprc1hnaDRPSlRhaWox?=
 =?utf-8?B?OU5oN0hMZVBLWFFNemNpUGxTOWEzNkE1U3Vhd0lKdTRzaGV4WU16YnZIMUM4?=
 =?utf-8?B?UVlaeC9iSjRMYmNtRU92ZHZwOVBKbVd6bmtWNjFqWHFwalNYU3dveTloQ0sr?=
 =?utf-8?B?NUo5VTFnYXFRazR2eFFCV2MrSjVnSHNwNUt6TlZpRENSWkp4QUVjZjRlWlQ5?=
 =?utf-8?B?cUZxakVwL1JUd2ZIV1p0dUJkYkFhWUxvZzIyY0c5YXJ6Y2o5NmQzZjRLRUQ2?=
 =?utf-8?B?aW5nUUZ1a0dISGZZd2orNUVld1VwU2RibkpBZGlsQlRuYVNpMnZOR2tOR3Ny?=
 =?utf-8?B?eFRxY0NKc0ZFczQ3OGY3L0F1ZnFRT1dXYkJTSGUwWDlHSzdyVnZrQjdKMkdi?=
 =?utf-8?B?Zjc1eXZDbUdYOHNMUHNPNXFCc2MrYUJxR3prMjlvNWx3eWcrbHNEcUxnYTdl?=
 =?utf-8?B?UXdpN1RLd21nSEMxa2VIaHk2ZlRzbzV5V3hxTUVNeklKYkxBeVBhOFpqUFhp?=
 =?utf-8?B?cTIwZmhuRHlWM2tYVnNacnJaTTRWSUpVSmtjQ0ZPUU9HVkNjMERVL0NyOFlD?=
 =?utf-8?B?ZHVmeDcxUzF3aHczVWxKWm5JVG5KTmdDQ1o4MTV2aUVPNTdHOXpybWxqamNF?=
 =?utf-8?B?Z3U1SXduZW1ybVJaSGc1cWN2TlFWRFB6NGZlVTdkUTRVam45UlBxUjlUTm53?=
 =?utf-8?B?aXF2ZnhjYTdhNkwxV1lsQUFUQTVOY3hIa0d3dGY3VStqTzl2YWZHcDRoNzZr?=
 =?utf-8?B?UVhKNFFJcGVYR1FSVzgwNFBOWENDbDdOL2VTVWVneEZPQTZ1bERScnBBS0U1?=
 =?utf-8?B?VGxMZEhOYi8zbW1PaERTNmxaN0Zha3lkQ0NTejhaaWE0WWR4aDNWNnRxV1d5?=
 =?utf-8?B?cFVSZklRVXJjTXJBa0tCRkhRd0VKaVhUR1dJbHRReVZIbTNwYzFQK0hKa1VZ?=
 =?utf-8?B?QlpGQmVKS0p5U3ZmL3VjL3BBS1JWaHM2Q1RXN3FQVkU0THNLakxsdG94M29F?=
 =?utf-8?B?elQ0QVQ2MVNGSHZWczV6UTc0K2R6YlpVYmN5ZkFFREc4c3MwZTJjSFhhUnRZ?=
 =?utf-8?B?dWtPU214cys1S2o5UEllNGdDZmI5dmR5eHhvaWxWR2Z3RSt4bkJOUHdOL045?=
 =?utf-8?B?eURlaFFXTnA0OUJZU3B1K0xYZnA1c0NmUDlIelA0VFdpNEQ3aDgwenQwbnpF?=
 =?utf-8?B?Vm5lQ1NUYUl3S1QxQWpRQkVaZDlPaXRlMVNnVzFna2VIWms0QnpFdnAxblRO?=
 =?utf-8?B?dWl6aDJMRkxLbS9odElWNlFBSjlCbjNmOWVhWlBXalczMU5BazAzUXNZMnU3?=
 =?utf-8?Q?BJ4TpYofImw7O7BfwP0wV5IGzdytDK+J7Tvwk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cENKRUNvNGR2SktQU1ZhcTFSNWNWZmJsajltVitBdVp3R3dCL0wycmtPVDZp?=
 =?utf-8?B?SWtQVnFaNlVvTUR5cWtOcThOU25icGlmV3BuVk1QdU1uL1NLcHZwTVZlajdZ?=
 =?utf-8?B?SjdJNFZTeTlORXk2Ti9yTnE3dXNmVUZtajhNdXl5WHNxU1RNb01WUXlKelMr?=
 =?utf-8?B?cDlwdTJCeHlFa1kzSkdhYTVlT01wK1JLSlRFVGJlNFNQeDIvdGlqRlR2c1FB?=
 =?utf-8?B?Wkh3dVlkM2Y5MHcyYi9ZaUJtWkhYYkErKzNVd3ZXWWhvbnh5eDVzbXNBYjl5?=
 =?utf-8?B?NFZsRkgrQ3d3dUE3YzZEYzBYUmRKSTZSV0tCcFF0YWZJeGE0RUFINk84c0Iw?=
 =?utf-8?B?SkQzYmJPZGk1LzU5bHZoYjBhbEsrd0g1ZjV2bU1PZ0lJaWJqRmRlem54R1BX?=
 =?utf-8?B?NTczYVhsa0Mzd2poMmNMUE5mdGI2VnNBbk11WXdUcFU4RDhwUFErMzdDc1pO?=
 =?utf-8?B?S1RKRUcxdEVoV2RDQTg1ZW9HZXlJZExhNFY4NUttVEZYVHFHWHRJemdUMis1?=
 =?utf-8?B?WEFNQktnNXhBbnd4TzBpcFpoY0FlaDdOT3YvNHEzd1lrdTRCNnUyTTluTE1i?=
 =?utf-8?B?K1dJUDU2ak8xMVlZNlVWWU84TUNGT0dCeUY2Z0FIc3VkSlNTYzZoNnJ1RUQ2?=
 =?utf-8?B?NFRZbnA5d2UvOXlLWkxkR24rZWkwS1o5MW5abHVpbWJmbHhrY3p2RHlZa1VW?=
 =?utf-8?B?VSt6NnVjL25tdEh2NWlkdnRDL3dsYkR1RlgrdnYyYlNualJnRkRHQWx6c1ZY?=
 =?utf-8?B?all5TGNYVmdPWEpQbERtUlFtZ0VvS1krY2hRV05XbGlWWG1vbit1WXNFM0hI?=
 =?utf-8?B?eDNYam16WkdSTnEvY2RJZXpJNDhhSU5YdzZMejBuMzdOamo4bzFRVU5zSnF6?=
 =?utf-8?B?aU1PeUhEYlBKeUt4MUl0T2RJdkNDOWxZaTdLZlMvTU0vTW16QmFLT2wrVjFj?=
 =?utf-8?B?OG50M1pmTC9rUStWTHcvSnlyRWpsenBLeERleHBhTWFqVFFxZGRTSlAvUVhv?=
 =?utf-8?B?T0hQMkhtL2l6OUJpVS9BbitwWWhvRWczZm5GMDJXcmduWmZnYUNUbDYxbFR4?=
 =?utf-8?B?bWxhQ1Nhek52cjlHMDl5Q0dicENWWHVVVlZEbEQ0eXpwcnRneFhzRXpaS3c1?=
 =?utf-8?B?TEJLK0JwUkphdmQrZjhxcHVQUmRPS0hsMUpTenRUSktrMWVWRGhtY1lZSE1M?=
 =?utf-8?B?eDF1OHNtbG5CMFZqanllZHJQdE9LbWlPSUhiOXlxcEtXYTR1K1NYaGNvVDFH?=
 =?utf-8?B?d3dkMC9lV1VkU3g4YTRGcDhiTEFxTE9TVWR6NXU2VVR2ODR1ZWpnVkw3Uzcx?=
 =?utf-8?B?STZZVUhjYWZ1MEdGaDFrQVA0OWdkRzR4S3ZQZndwemdQMlZYay8yelQ0UVVD?=
 =?utf-8?B?UlVpSlBhcnFmTkhZd1NlbHNWak5wdDlVYUlweXExN2NLV2l3Y0lpU01Ba2JC?=
 =?utf-8?B?NVRudEs3Rm82c2huQWJERHQ4S21TdUdXOXB2UTlXU3lCUkVhWjVHU3JSMVhD?=
 =?utf-8?B?eGcxa1VYcWpxOEdleElmSk1WMDliT3ArbnJ0cXpkVnIwbU5yZWdsSVo3VjNQ?=
 =?utf-8?B?L2NSYk40VzQ2b2JQTnJ6ZndoOUlCeHI3MzVQNFVXVG1ZbnJzZ1k2Ry9qWmNU?=
 =?utf-8?B?Z3hSdmlwdkxXQ2FzcEtZeERIZzE3SzEzVVhYd0RTL2VVTWZmRjhjTWhYLzR0?=
 =?utf-8?B?aEZTYXYrWFBZc2Y3bXdYTjNKaHBUNk1GV2NtQjRiS3dDQW1CNWZ1djBsMW5j?=
 =?utf-8?B?bUpCK1B4N0lPUGhUQ0hiWmJTOXBzNWV6dVcxYldnZzArOUp4M1NVSEFBOTlz?=
 =?utf-8?B?dk9BVmQvY0E1blVXeldzS2xMdyt5OHVGbHNISUl5V2hDQ2JLekxzUzZKK1VB?=
 =?utf-8?B?MkdUUFZVUkV3bjg5NEEzam9oYyt4TldCNXJyek9tdXA4ZmYrdklqYlpiYUkr?=
 =?utf-8?B?eG1keHIzNXh3bis0eWZUN0NjNWlPcUhqWmZINUNjMTAveGZ5OUd0cHlDMGlK?=
 =?utf-8?B?azA3aDNZVURObFNndTZTdU5kSEsrckpqWk5MNDB2RjljTnQyWnljUXQ0bGhu?=
 =?utf-8?B?UlZGZDlzSTEvN05oZlJ4ZzhRckZMZkdSNHYvTTI2Z3d5a1pXRUxpcndFcExy?=
 =?utf-8?Q?BrLLG7j5g8HxMqR8/uR4SvGPD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc622003-2959-4bff-68bb-08dd195ccf9a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 20:54:16.9237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKM+y2x2zmy03jHo2XO9W0iGhFxt3sp3zH4xjni2hbBkFIIP/AEDp+v0R/iMYMgpB/fMfvYNGlOj3jvUclsnYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6539
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

On 12/6/2024 16:00, Lizhi Hou wrote:
> For amdxdna_mailbox.c, linux/interrupt.h is indirectly included by
> trace/events/amdxdna.h. So if TRACING is disabled, driver compiling will
> fail.
> 
> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
> Reported-by: Mike Lothian <mike@fireburn.co.uk>
> Closes: https://lore.kernel.org/dri-devel/CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com/
> Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index fe684f463b94..79b9801935e7 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -6,6 +6,7 @@
>   #include <drm/drm_device.h>
>   #include <drm/drm_managed.h>
>   #include <linux/bitfield.h>
> +#include <linux/interrupt.h>
>   #include <linux/iopoll.h>
>   
>   #define CREATE_TRACE_POINTS

