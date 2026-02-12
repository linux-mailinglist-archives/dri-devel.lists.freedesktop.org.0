Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JzmI11zjWn42gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 07:29:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434BE12AB42
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 07:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3E310E6E9;
	Thu, 12 Feb 2026 06:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fwl7JPK0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012029.outbound.protection.outlook.com
 [40.107.200.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963E710E6E4;
 Thu, 12 Feb 2026 06:29:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/1aebI4HBNWQJEIHgm0vfT4/u2VsUC2xxpLEItaeE/KLCUUQTqoxu0NtnNi1ky8zyQ72nvO/qVfjAQ8bFPM+h4tvwodrt/L5KQsLS2tEjs1hQYJLvgMFN5by/spDpwh4oKCZ/Pto68ii4pqI/fgksfCXob7waz5xGJIELgjb3pr0kSeN1LoWhDRW2R9zO8VimEph11H+hWn1JMd6lUY5EbXg/70bDMF5jcByi28/SNcGwyNuXxXe25O+5ah9msxX9bzt3aAmASklROHdhyJdPqmqT+zKRTjgZh9i+HTWuaQ2mMI4WPcuZpvP9rP3GRNKM7l+ADp/LwS1+/r6Jt00A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4931nTDdgvE4qoduC52jv9onccczTBCKfZ64jeCJYA=;
 b=fJmMwJz7AqmsoyC4YXDwwlg2QxiBx+o6RjroFKCRhZGWfXQf4VDX/EBVrLiBJNl/jXOiMHdiph7CBmVd65mHYMxGKByuf+/9tRILMlk751Ooj5yI4kL/iOWiGN+ZXbNPWItgkD3Psad1cOET6IjrATPecSjjap3PTpfI7QFNYuutxrZhjYZ5oQ7D/6ikvQJxTpjiP2H0aFr2eUR8KoRLk8DideBXV9CnhSwY/u+bzFyOu6wX+PwHBu4sX0RIi8kMiqgeLiN7olJxY5vLxZtcOrLiKDrtHm4tQcqYl9ZCZONBajUag7wt/GiXot31eYKCUY01OBCGSqAlKh32MGKMWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4931nTDdgvE4qoduC52jv9onccczTBCKfZ64jeCJYA=;
 b=fwl7JPK04SHj23vQi17ReVUjepDkHZwFS3PJU3hL1Q3qc0AajD8u4sdMeWDSa2Q6B98mVW9tCQMmaYAbIbOb+ZLfA8h8dgTmBB5hAcN0MfvKBQRAMb1Dk2M6+p9zSbigL3VimNd7LjZqFwsM5h+WIWOTTxrSOwg66jLZQSf99yeEZny8LU0PsfeXgDwkh9an3RWGoygjOEbQfBnRM1ASIhSSQptOvXdwU1kmbvSoYuWFcGFeWBPGTb63CQpIp3XBbZFQSWl+vNdxirpP84HFIZjAsGvjn5NiZIFueUrWyOswpd/x8+K8zvt/YIFKCtkeGo5Q7AfTUpFnpAxc/GCpVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 06:29:42 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9587.016; Thu, 12 Feb 2026
 06:29:42 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 12 Feb 2026 15:28:04 +0900
Subject: [PATCH 2/7] gpu: nova-core: gsp: add mechanism to wait for space
 on command queue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-cmdq-continuation-v1-2-73079ded55e6@nvidia.com>
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
In-Reply-To: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0269.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::20) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: a2fb3d4b-57dd-4270-996a-08de6a001b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1dUaTJJWmM2b3FML01oUTFiQ3lCdHZCUmFOSVp4Vjd0M0crT1RBYXd3MXMx?=
 =?utf-8?B?SWtpZlFLMEdxSTFWaGhUZGJIdjRoYnVLcWgwRlg1ZTFNTGJNcjZTSEc0L2Qz?=
 =?utf-8?B?MThOVHZ3bVVwK29wOG1iVW5MaHVvOEJtVzlCVGVmdUF2UVRvNmlMK0VzL00x?=
 =?utf-8?B?Z3ZhY2xVUXU2ejBSay9wd3JwbU5aclkwRGhmSU9XVW1sRkpWU2R1dWN4SGRM?=
 =?utf-8?B?TkFrckJqLzdVMFdQdElsd3A5RHNmUnBrMkMwRkxwN3h6Y0Q5aUhEZ0lsUHEy?=
 =?utf-8?B?ZEYybGt1RlJuQ0pkbEhSQnYySkltc2pwcXd2ODhZREw0VVdwQkt2NndLbXUw?=
 =?utf-8?B?U3NUaHlMa2kwMDRINlpVUDk5UlB6Y2NNTjg1R2RBbVB5TDdMaDA4dk5Fb3Y3?=
 =?utf-8?B?UC9TcmxyWnhHcGxpUWo0NmhJR2FhTFgvN1gvR0ZacWdXTFZTNVNVUFpSWlov?=
 =?utf-8?B?Y3hsSUl3a1hzNWl3Q0VKVmpzSzNYVmhjOFozSFJwQkNJNUFyMWtyVm9aUytR?=
 =?utf-8?B?S2wyY1dMSEJ2L29OaXRGZllXcTFmbXVJdkhpcldGbmVsR3Y1VS9yOUxSNkM5?=
 =?utf-8?B?c3d5RE5RUHZGWm9jbXJENCtNM0Rhd1VTTVJELzM5OXdsYU1uQUJPYVJKY3Zr?=
 =?utf-8?B?QjE4azg5aWRHemRuLzlFYWlMN0UzTHdUUXpTZFhwdFZvakdTYzhWd01QZzcy?=
 =?utf-8?B?K3U1eVE3blhCUERxTUpGbHBzclZnR2dYVEFGSXdFTGd0TU5MS0hveDNFQXB4?=
 =?utf-8?B?NkxnYWlXa1JLU3NnN2w4NE1tb1ltZzdxd0ZvYUcvS3ZCRU1CVm9NQXpxcjZS?=
 =?utf-8?B?Q1QvRmhEV0g4N1JwbUtnSGNqNU9XMlV5ZGZELzgrMXN6ckV4U0tRYTliL1Iv?=
 =?utf-8?B?Z05CRFlPbnBBTzh5OEl6WUZ0aHMyV3J2SHVUaG43VnY1RFRBSE9LNW9MZkFs?=
 =?utf-8?B?SlV5TnZHLzB6eEdybEVVQ242dllsRmJvbnVsb3hMK2Y0UzdTbXRJTXNDbkJ4?=
 =?utf-8?B?dG9NNFE4RzdkYzh3WWUwZGwxNEVpWjlIaTZYdSs4U3ZCMWV0R1ZQbThJODdI?=
 =?utf-8?B?V25ldGVrZExsUjYvVXBKYkNnQlZIbitPNzNUT0orK1d5cGphM0FNUDhJSm5y?=
 =?utf-8?B?YTBBUkJ3WHNVZStwN21oZ2NBRXBsN2ZpNE1ScUk3ankwUllIYTFna1dqOTh4?=
 =?utf-8?B?WmRxbEFUQTYzU3M0RkJTSDdmT2tUL3JuRDU1UDZERE40d0d1NWVMTDlDR0Vk?=
 =?utf-8?B?ZzIrS3VlL0Z2YUtsWDFNbGgrcTlMWFdBQnZYbWhiZSt2L0JzSU82OG9Bb2Vz?=
 =?utf-8?B?VlhyQnQ5Wlk1U292M2tRVVF6QTRER0tLZ2xhS0I2clYyUlVFbVcrR1pzMkdT?=
 =?utf-8?B?ZE1WVTVLRUxmaFRSc0VraCtudFRQZjF0cHdCQTRWc2xpTTdCbjlHYTNsVkhx?=
 =?utf-8?B?a0syRlN4YWVGYXpkNHdvcGJlQVdya2w1LzMwOXZNRk9TOERHVDBhd0RkWDFr?=
 =?utf-8?B?VE5ZQkZtU0ZYdFVQQTlMVDhKcndESkM3K296elJxQ2hzZVdMSFk5ZTlGOXhi?=
 =?utf-8?B?djBuVnloZXp4VFRKYUcxVE5POVB0ejdlVk02SlQ4dUg5RWU3NGVydXNHNWVK?=
 =?utf-8?B?SGlxZG5CcUVHOGtJQWFBVE9OanRXdHNKMFprV0Y1eG9hUTEremtqQ2Rab0Ri?=
 =?utf-8?B?Vko2Q0lWNjZzMCt0NkFVeUo5cm13NEtUWjl2anZuRlNFQzl5Q1RkVXlBb1JC?=
 =?utf-8?B?V29VVkZMTnFNUHJ0NTFZTDJUTzhvSGRSaEF6cW5IRmFjUnU4WWpKblpFUjFY?=
 =?utf-8?B?bDJvMVJtRmhIdjlNbG9RcnNlMGxLMWJQWjZBNW5BS2RVZmxIU25TellUT0tI?=
 =?utf-8?B?VEtreEFod1k0M1lpelBqdE42NUVDbHUzWmZWYXVKY2lkbDRGSmdDeFR5YU5p?=
 =?utf-8?B?U25ITWhvcjVyWUdBTFcwdWpEd1ROTDZ0TUY2OFEwT3d1NHVmK0ttVlpqM0Jw?=
 =?utf-8?B?RFZERWpEUVpHRzd6aStRZTlsNXlFWEZwT1hHV2NXMTZqNDZDQnRlbUVpMmY3?=
 =?utf-8?B?MVRnajlNd2oyOVM5QnhLcDgyeUN3NENyMm1pRUtKRitvY1h5V2EvY08yc3BV?=
 =?utf-8?Q?D968=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVR2T2VmdGpEbitXSUx0Y2NKSnFQVFZSRDlGT1pobUpTTzJJUHFaMVFPZTVs?=
 =?utf-8?B?cHNiaHlFcEJaZ3JjSG0wT2VYM05CVFlvQjI0a3VaZ2RsSCtqQ2FuMlpWY1JF?=
 =?utf-8?B?d2N4TDNEazFsVkRDT1U5R0xkYWhhZDNaTHEzaDFINGVhdDNBUUJWYW9ydUY0?=
 =?utf-8?B?THlJN2VQdHJvcklsMXF1RDlZaWdDSVBzcE01M2ZzY1ZodlRmMUJUMWFnUnZS?=
 =?utf-8?B?SzF5NlJCRVpNR1poMVFneUxESkEzeFMyKzdnSC9MYk9QNncyUDRObFJDQUEy?=
 =?utf-8?B?ZGw2YWEzMGtIRm96T3ZMejc2RGFlWjM2VFUzV0pVemJoZk5SRDdvNVFFOHM2?=
 =?utf-8?B?Q1JYU09XRytXRGdrVDZFdVJsU3JlSnhvOUwrYnU3NDE3dkRMejZKV2VjdmU2?=
 =?utf-8?B?N3I1Ym50d1VXMkV0YkdiMXdtczhSYnFCZVd2VzBFajRQSjNneWp5eTZVM3kr?=
 =?utf-8?B?NzY3STN2U0Q3b2ErZkpMakluNTJmY1dBOVNpMG96R0txZDg3enZ0VGx5N3Vs?=
 =?utf-8?B?TW9iNUZSNDAxQnJkWG91WWlmR0x6RVd6UFM4RnFocmpzT1FvejlYVHkrUkxM?=
 =?utf-8?B?OGxRVjVEQjFYOXFCalowdzUrUDd0b3MveU1vaU1qZ1JiRUtUU3JLZmg5RDlY?=
 =?utf-8?B?cE56N1FucDdmVi92Y3JxVE5MV3pZWjR3YVpodFhqRi9ZU1Rwdkh3dWhHaU5u?=
 =?utf-8?B?dXZudkRmMGZ0aFZ2K2xFZVR3WUIwTFBSNzlJcjUrZGlCRnF6ZjdOdTQrTjJy?=
 =?utf-8?B?WG5TeG8vaUpiSkNQc2xvTzFma0RweWEzY0NpL3BLb0FuU2gzb2FNbCtIMXR3?=
 =?utf-8?B?d1ZGUWNlMWxiaXQrenBOSUhqNjNwWjY3dTBFRVRQdkYwVDY1eU9nQXdiSDND?=
 =?utf-8?B?d0Q2WTU4VEZXUjRZUnpURWROcmswaG5qMmlMNzAwTmhiSXRzSzh4MVhCdm9T?=
 =?utf-8?B?V3FVWkRQUlJUL3M3TjJNWEFNM1JVRHk0UWRmWk1tdjM0ejFobzR4QngzSDk1?=
 =?utf-8?B?T3R5czZMQ0owTVBQSTA5cmMxMnhzVmltbkg1UGExdU1VYzFVSGo2dkVmNTgx?=
 =?utf-8?B?dGtvV3ZFRGQra1lJQzU1eXN0Y2R0K1pmcThGcDUzS1E4VG5ZRVN6SkRGYk80?=
 =?utf-8?B?YThCOWNmWHIvNXJCbkdrVDErSndCYVZuRDFTZWNsei8xMnplVXB0SXNPN2Q4?=
 =?utf-8?B?eUxMMWN4Ymxxd0V5YitOVE9LRThwTndITmNYaVBnQ1VoRXdCZzVLYXJkMlQ0?=
 =?utf-8?B?eFNpVmplY2lZeStqTk5xS29rSTVVTDl5VEw1S3BOdExoUGwwUkV4VEVvaG4z?=
 =?utf-8?B?ZmFad1pPTm9NRW9mc0QzakZIbEFudSs5RDBFZFdUdmMreVZzYmRTRjVIbW1U?=
 =?utf-8?B?SGhkS1hrVHhVNUpURWJoakh4M1pBeUh5OUxiQi9Kdk9SUkE2UXBTOTFwSjgx?=
 =?utf-8?B?TjRPVkRHNllBM1hsWkplVnJJZTRneWdOZEtjVHNrazJGV2ZMVitlR1p2cDhz?=
 =?utf-8?B?SzRUNFkyY0dESGZ6N21VL29idTJyc1BHRm9MSTh6a3JZWDBkTVZjakdHWFBZ?=
 =?utf-8?B?d3l1eE1DOG82aTFESTIrZ2hiTTduUjJCd2lDYXlFZUJQa2RyNUswbEc2QUJF?=
 =?utf-8?B?bnJNVlI1RFlVU1Byb2VDRGZMd0ZWVWpncEpnZTgwTzhLQzNsSnVtTnZnaE5t?=
 =?utf-8?B?a0JkNUtDb21FS1VlZzloQUpqWHlkSlgyN3dvTUpESUlXd1lqakdweWFZdDB6?=
 =?utf-8?B?RHB3OVo2QStKaUt4YTNFNUZBYXl6ZUZ0RGQ1QlFYOWUzVVZ1OWlWUUNEcDJV?=
 =?utf-8?B?L0lUbkU4VGZEOVY0SWE3MW5FOW1vWS9xQXF1c0dlcDRJazZRTi8zRzg2Z1k2?=
 =?utf-8?B?MCtpeDJKdmM0STMvUElJOVBiUkp1aS9HYUN0cDdOV1MvUUJhWVhoUjRGUm83?=
 =?utf-8?B?YkhTdjQxSkRYU1A5Q1lrYUxxNHNMaEpZYTY5SmNKS1BCREtaWTFFVFFQbXRR?=
 =?utf-8?B?aXJQbEZaZkplY0lkbmVsTHYvK0VBa0E5cEZ4czZHSjNUck1NYVBxZmJiT0xC?=
 =?utf-8?B?dVcvd0pWMVI1ekh3WWFqNjhTVU9ScGJNWkVQNFdTdTFHVE5leTN3RWZNaGR5?=
 =?utf-8?B?V1NHd1RBdmVnUkhUaEE1NFhTY0tVTlhrTzhlclVQam8wZWVOV0pqMXZOTTgr?=
 =?utf-8?B?QkZRS0RDTDlQTkx2TWNrS3lXNFN4NlE4cHRlbDJBWGhlRVRvcHEwakVXaEdU?=
 =?utf-8?B?S2t6ZnJvN0lkODZrV1EvNGpTM1k2WThCYUZOK3o3ZC9QbllBbXUya3BKU21H?=
 =?utf-8?B?LzBsak9oOFJmeTVhS3U1QmhwRlNiWUgyWlZuK2FhMVlhdTdyZnN1SlJDaWp6?=
 =?utf-8?Q?bOfwiKavh1uWSPICPWHLikDRgKSTN2Sle3LYINX5V/wHD?=
X-MS-Exchange-AntiSpam-MessageData-1: AvCWfEB4IsV6FQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2fb3d4b-57dd-4270-996a-08de6a001b00
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 06:29:41.9913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xPrcuNHnmNHRrC/+Bba4ZdX+gAwcWv3QejPn734UvdqcP45nhQb/wG1nq12Bs+cfgZ7nCXNT3yuDnsBbLERSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 434BE12AB42
X-Rspamd-Action: no action

Add `allocate_command_with_timeout` which waits for space on the GSP
command queue. It uses a similar timeout to nouveau.

Let `send_command` wait for space to free up in the command queue by
calling `allocate_command_with_timeout`. This is required to
support continuation records which can fill up the queue.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 42 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 46819a82a51a..baae06de0e09 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -243,6 +243,16 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         }
     }
 
+    fn driver_bytes_available_to_write(&self) -> usize {
+        let tx = self.cpu_write_ptr();
+        let rx = self.gsp_read_ptr();
+        // `rx` and `tx` are both in `0..MSGQ_NUM_PAGES` per the invariants of `gsp_read_ptr` and
+        // `cpu_write_ptr`. The minimum value case is where `rx == 0` and `tx == MSGQ_NUM_PAGES -
+        // 1`, which gives `0 + MSGQ_NUM_PAGES - (MSGQ_NUM_PAGES - 1) - 1 == 0`.
+        let slots = (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES;
+        num::u32_as_usize(slots) * GSP_PAGE_SIZE
+    }
+
     /// Returns the region of the GSP message queue that the driver is currently allowed to read
     /// from.
     ///
@@ -311,6 +321,25 @@ fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
         })
     }
 
+    /// Allocates a region on the command queue that is large enough to send a command of `size`
+    /// bytes, waiting for space to become available.
+    ///
+    /// This returns a [`GspCommand`] ready to be written to by the caller.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the command header is not properly aligned.
+    fn allocate_command_with_timeout(&mut self, size: usize) -> Result<GspCommand<'_>> {
+        read_poll_timeout(
+            || Ok(self.driver_bytes_available_to_write()),
+            |available_bytes| *available_bytes >= size_of::<GspMsgElement>() + size,
+            Delta::ZERO,
+            Delta::from_secs(1),
+        )?;
+        self.allocate_command(size)
+    }
+
     // Returns the index of the memory page the GSP will write the next message to.
     //
     // # Invariants
@@ -480,11 +509,18 @@ fn notify_gsp(bar: &Bar0) {
             .write(bar);
     }
 
+    fn command_size<M>(command: &M) -> usize
+    where
+        M: CommandToGsp,
+    {
+        size_of::<M::Command>() + command.variable_payload_len()
+    }
+
     /// Sends `command` to the GSP.
     ///
     /// # Errors
     ///
-    /// - `EAGAIN` if there was not enough space in the command queue to send the command.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the variable payload requested by the command has not been entirely
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
@@ -495,8 +531,8 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        let command_size = size_of::<M::Command>() + command.variable_payload_len();
-        let dst = self.gsp_mem.allocate_command(command_size)?;
+        let command_size = Self::command_size(&command);
+        let dst = self.gsp_mem.allocate_command_with_timeout(command_size)?;
 
         // Extract area for the command itself.
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;

-- 
2.53.0

