Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CC0B2656D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 14:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F11610E880;
	Thu, 14 Aug 2025 12:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4Bd/7ZVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC8510E87A;
 Thu, 14 Aug 2025 12:33:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APMvVv62XF6Z2iVnK/wkiUzfn21ZWblB+hmMYmAQEa/4NsSPOWfg153bg4hS99rskZfK7H+KtA5VkV/kcMG8cVA2Y9neDE6aoPU0GHN2mtk9mmuYC8pa3fDKExWx7h5RBi1fcigaS1I9u9QELk3nx4ZFbdi1PyR3+eS3CK7NEkD6mN9uiBPcxi6LOCkV3Z0EqaBRbqF2kXYFynwJOBqPbtB4/V3sPoqvifaCga1pFqD2qtI0tin7MbhZuhUEkPHN2kT02N7xN0oaAYMPtDLYOIPHol/vXWjtAzR6Tqc4m+loOsS88t4UhZwA7leEzloUDKiDbOaiU2skWrcJ5uJ1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CU+lfAJF7VMtJa57232jC2MWKLha8wutzi4etVY2mMI=;
 b=Ml44ATKAhTvoYr6uZddK9BFxuWvNS+weCjB2HgrEuekIbL7It9N6D8KEQmBeJPvuIKg1ky01H5O434GqFytgqIQWAQQs45ZNl0pYuO5+5jA15UM32Devh5LQN0WweBBZIWQ2tTNqHudNlbK/mF5eMfY8q9f2dk4fG/QphLC57MlbHNmzfa5fSRoHt/GSAxm354sPofhp1ppViqEDXGHydCOQ+wB0Oid+ZMTkLRO129XJBowAGboIH5/9E7yv3KS/7V9N3GPzLCs8ElBsMepjv7dLAuccicnWQkXJ4FW1KPOL9h3XRJxvi7uPeoVrk0k6Ygd8RirPJavzSzeDri+Amg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CU+lfAJF7VMtJa57232jC2MWKLha8wutzi4etVY2mMI=;
 b=4Bd/7ZVzHGfvDkiSoRhVCR7bsWh7RXPZrWmgtZLiyCJuvG2WyxkWolWlOP2scjowa8W5Ck9P97v9A2tQDUsu90frRXz/ak2t+GQQFkm8u+2tugQdrdvlAtjMpuzIL1Cg6jYfVTCWHTsSJ3xCQAtcfp3TSupMvh1mYxS+tpov9dA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB7688.namprd12.prod.outlook.com (2603:10b6:208:420::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 12:33:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 12:33:01 +0000
Message-ID: <615089b1-7a47-4262-b6c2-a90cf7812d0f@amd.com>
Date: Thu, 14 Aug 2025 14:32:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: Move the memset() function call after the
 return statement
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250814093957.137397-1-liaoyuanhong@vivo.com>
 <d77e242e-af6c-4693-b207-576b823a0c0f@amd.com>
 <14ed323d-de4c-4f98-a16c-8bdb1b92c34d@ursulin.net>
 <6ef5e1e8-3868-46c0-a31b-505f8a91d37a@vivo.com>
 <f1b5499f-1c7c-4a40-b986-74a014897148@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <f1b5499f-1c7c-4a40-b986-74a014897148@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: 452f7ca2-257e-48de-d36c-08dddb2eb538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFkvcXc4SlJNbFZmd0tjYk9RSnE4TWFHYVNVTURBVGRRNVNrM3Z5QjR0N09F?=
 =?utf-8?B?Z0cyYzMyUnIraFFPWW5wSldpOTJuVzlQSlQwa1N4RGpjViszOGNudlYrbzVa?=
 =?utf-8?B?c0sxN1NNTU55UldsYktTcVFRTUgzUEJvWVVWNWdGQzVldlJXMVpESHBTVlM0?=
 =?utf-8?B?STJkNTJvcHpqTE4ybk05V20rYzNsM1VIVE9YUXc5NGtlUVBRajRkUW1ENVpG?=
 =?utf-8?B?cWRoSi9Xc3pmN3l6b1hXZHh6cFZYa1lJQjNBREZsRG9TNExXTDdzc24yZUJB?=
 =?utf-8?B?MjZzamFJV2hDbHRXdy96SzFuQWlnWTIxdmkvbEtweGJ4TlNSVlZxYjIvNVhq?=
 =?utf-8?B?SXlsUGVEdWxFcU5RVFJDa1U1MkUrSWZJZkd5dlU5Y1J2TjQ4S2Eyc255bDNa?=
 =?utf-8?B?N3k3MW9OVnF1MXRPbWVzclNHbHRzRE5xT3BURE5KK1BCOUVzL25Qc2h6UUpt?=
 =?utf-8?B?WE9mRXZwN1QvZFhid0d4bXYrL0pwL0pSVU5kUnJPeVBQMVpnWUpCZEVpMGxq?=
 =?utf-8?B?RHRoY1FRMkdYSkxUVHQ3T0hKc28zRjJOY0FPSFZ6bTlDclN6T29NZTBpQjFk?=
 =?utf-8?B?ckZuazhJVDNiZURYbnJBSWE0NllvM1VYTk1rb09VdktjOHhEN2xXK2czUDZL?=
 =?utf-8?B?ek40THJoNXg2MEZmQ253SzVsSUlXa2hTc3VXYm9LTHdmclF1VXRnVTRvMGFu?=
 =?utf-8?B?Rm1GYmdHYkxaL1kwSmdRVnZiRVpOVFdjM2lzMi8xM1UxQUgxUWFwZDdxbG9D?=
 =?utf-8?B?dDdCV3Q4Y2hIZVc3a3RZa0twRitkYXIxMVFiSG9tYi9HQkFxVWF5aU9wdGIz?=
 =?utf-8?B?UVZzelZlQXFBQ2FaR2l5d24zM2lNZ0FxbHRDSTY4OEVSY20zSUpHSUVuM2xm?=
 =?utf-8?B?UWtzTnpsYktDYmpJeHpSS2ROVG9SOTRRUEttamlBYmZPY1d4WjhOTHBwRFRI?=
 =?utf-8?B?UDQxanNPaW1ITkF2V2FVMi9BWHhVQ0crMFhFWXRKZG95RVRscis0QWhEeVds?=
 =?utf-8?B?L0hjKzZTUkJpK3ZVYXBDbm10dWhLbHpRVmRBQnlqOEg3ajZNOWVLRmJsSUYx?=
 =?utf-8?B?SGJtbHZuU29JaU0xRlBNUjA1dGhBelQ5MHNTSE9MOERqRlpGclQ5NENLSjZJ?=
 =?utf-8?B?MEJyN1BRUjRLN3hpVWNlcldrQzZTRFVtaXk4YU1CNzVzSW0zU3E3cmtNY2hC?=
 =?utf-8?B?UjdHUC96d3pvaHZlWk8wYUttSzN4QW1HVVpUYm15ZmRNZUlIblR6L3lLcUpt?=
 =?utf-8?B?VXQrWG5oM1JCc3RYRG1HeEpkaDIrZy96SzB0UHYwQUhmRWhsZUFZekNudEJM?=
 =?utf-8?B?Ry9WWWdIMFlxUHBhbTRBcmNRdk9XbmJnNloxQUcwaWg0TE5MRUlIZU5KRGlS?=
 =?utf-8?B?bzZnbzlMcGpFMkcyaThNcDJuN0xLc1dPc3FZR2ZTTndpTG1pQWZ1L2d1K2ZY?=
 =?utf-8?B?NDh1U2ttem1ZSFViV3llSkNUNjhuUEtUWjdGMWRYZXRkYldITnVkK2JwWnMv?=
 =?utf-8?B?NXJUYWJUVm16anN5ZDkxR2dNZTdDcDF2b0VMcnpsZW0vZmdVaW1ud1ZZeVMr?=
 =?utf-8?B?ckRGanRqVjMrTit6NEYzWHhndlNUL29ZbHh3QzVZbzhobmsvMG1IOE1sYW84?=
 =?utf-8?B?UjhBRnU0dldLcE5YZUpXVTdMd2M4eURaZDdMdjZUanJCMXFONlg4ejFZT0Vt?=
 =?utf-8?B?dUxySnF2QU5nMVlDUk1MSDdJaFF3M1F4eElUa0RJRTdzWVp4MU1FblFFMFZT?=
 =?utf-8?B?WVV6a3dnOFBaTVY2T285REFIKzFlWkl2RklGbE1vNm0rR1JWaDNVM0J2cmVN?=
 =?utf-8?B?VEg2Y1lXT0toK0ZyOG91SmJSdWJ1YUFnUytjOTdyK0JtaXhvZG5VRmFVS1Ex?=
 =?utf-8?B?SVBPd0oxQVBNeHZZUEtrS2kyOWM4TGtlOWVlazZLekd5QnpDaDdFM2gvMVdN?=
 =?utf-8?Q?3vbEwqO1gr4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bC81akxmZms2L0hZNGxoTDVtOEZ2bEpseGV4VkhyYzRDaW9QeElMaHBjVmN2?=
 =?utf-8?B?ZlRXclAyY2JsVUN0SE5ldkZ1L1lDNytHWW9xNlNLdG5qbkVKTzBCdUR5cGFy?=
 =?utf-8?B?TVNoK0dxeDR4Y0xpZ3p3WTlPTkhreXRhNHJxT3VKQXQvK2RGaDhmaXE1K0RT?=
 =?utf-8?B?eFBOaFpUMC90OUNxeE9GQWtHdjkzMVlsZ2VRR3k1M2pPWTBCYXBUajRiWlNL?=
 =?utf-8?B?UU5Pcit2Y3lLVkhXczNtMkRzVW5LTldyckdabytOMzJLTTIwUXIyS0NkeXJR?=
 =?utf-8?B?RmdDeTM3aXNnTDNkUDdNbjR2L0tEVWxjMitDejNWc1E1THAwVHdCMEZ3aTVC?=
 =?utf-8?B?eE1jMnk4N3RCSEZZZisvQ1VQMi9qZEZaSDFCQW9za1hjMHBvZzVXYmdPRVVy?=
 =?utf-8?B?dnhvM0llNFhBT2orZmIreTByUGdTRzZLNkFmYzk2c3daU3lQeW9odVZJT1Zw?=
 =?utf-8?B?ZlE1NW5TcXpuRTFNNWY0UXYxeVB0a1dWMm1IclBUQjRyU2N6cHR5VUZ0Mnpm?=
 =?utf-8?B?akdETk44LzNyNHMxSW9XZ2FhemZ5YklVdlh4RDlYcmlFTkJ5YlFGMmNIeTVl?=
 =?utf-8?B?UHNIM2VyWU8vdklrdkZ3cnZQeVZHV2k4V3NhQ3lmUzhuTGNWdzFORW9ZRUdV?=
 =?utf-8?B?SUVMeTllZkpmY2dTWTJubUw0aUg4T1J3OFMwdXZVNW1ZcXAzQndGalZPdTAz?=
 =?utf-8?B?bXc1YXN0TUFCZElPNEpDNndiaU0xWUZYZVVqb3VvTllmeUI3OE5GQUxvdFdl?=
 =?utf-8?B?bW5HdVpvdWd3RE9RN0dwWjRPdXR0TGIxZ3BVMUtBaDFGaVJ5RUoyTCtRY2x6?=
 =?utf-8?B?V2ovVXR5cjA4UmlkNC9CWnh4SnNCNzRlWXRwaTRwckovUmEwYWVPL1I5aHJO?=
 =?utf-8?B?eS9ReXlibURRejlENXJaL256VUJZRXE3eWxxYzlVTVdvdDNUMmpERUNwTXNi?=
 =?utf-8?B?VVNVYU10R2gwTkFQMGtSTkVTWk4yY2FsR2EyWW5rRjh6b0l5WTZUTHFpQU1J?=
 =?utf-8?B?MDhxblNCZG5lcEh1MjBlOXhVaGdaaGFWdjg3QUhFT2I3OGtjOVpBcGFnNjJq?=
 =?utf-8?B?dlpBUndSd3V1RlJzUXRyUmJ1cEUxc1hkaHhIK3RoR29Zc0pSZkM2cE9KUEVT?=
 =?utf-8?B?d2ZvNzBoT2R4R3NyNWxCZnpvZzZTcWRwdXpmOTliMDRyM3hKakpPN3hUMkF0?=
 =?utf-8?B?Vk1xdldhbVhiclUvSmRDMStrZzhqNFJ4OXlNSUF0L2NNOUZSRlhGTHNRQS9C?=
 =?utf-8?B?ZVI5ZW54RGRvZFlOcWJKeFlXNkZYZWNLQUhLWXNDZGpJeWQwaUF0ajlsa0lN?=
 =?utf-8?B?Y25iS0ZSYjlRK0tLZHZnaDBYSFpVcHJWcmtRTEViNG1yVDA1bGZ1ckt1UEls?=
 =?utf-8?B?SnltREVPUUV0MkxwNXk2c2VGMEFreGdCYTlESUMzQ0NHSlptemlsSmRBS2lN?=
 =?utf-8?B?WE9SQzdGMURPTHJ0WjU2YlFaOTFmWVZ0ZHFmSW5JWncwUHYwUldZQVJsV0dn?=
 =?utf-8?B?WFpwc3V5ZDlvTTQ1QkVLdmdaVmRWR3FCMnduZkQydm9tWndzdjhjUXB0MUdn?=
 =?utf-8?B?ZEZxOUd5V0djQkNLTmYxY21YQU9TTGNUdG5aOVpKK3dsRkNGRUx3OGRnaFB3?=
 =?utf-8?B?R01LdmNsdS8zc3hmdWYrMGo0R2Q2ZE9jVE5jMTl6TVQzR2xvckNVVlZnUUVu?=
 =?utf-8?B?Z3FDY05xVHZ1R202OWgyTnNLempyY1ZtU1RnL093U3N3RERTVEkra3RnaGdB?=
 =?utf-8?B?QVp1NE1iSHUxdGRtZHBpSGNaUklSai9zQTNtck50WDNLc21Vbjdaam9venJD?=
 =?utf-8?B?WEtxZ25mOHJnaUxobFd4Z0tnMGRHblJ5OHE4dnVCY2xUT3pXTTFxR2RjbjQ0?=
 =?utf-8?B?M1BKTUEvSExBVGtLRmkzVGZOd2V1K1U0Y090eVNZcVkwNjViWElkT2ptWE1H?=
 =?utf-8?B?eTZVQUVKK1l0VXhKUHo5Tzh4RFJPTkhaankzdUVrVllKWXhCRERMYm1HQ0Ny?=
 =?utf-8?B?K1BMZmsxaWNna1VYK1BrVGlQVjcvZ2lQYmFyNE1NbGZyZGNNdG5mUnJtNG00?=
 =?utf-8?B?a0ltcGFZUk1qQ3I1MUVqb29MZXNpYUx3SHlNbXhYSlBYZVgyaEMwSUx5OU9z?=
 =?utf-8?Q?QUej956ABlMifHYt9Dv2WqNo+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 452f7ca2-257e-48de-d36c-08dddb2eb538
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 12:33:01.4532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtvdpI8hf13dG1U0kDGfKfKp6VMW6ZlbDHZTbjxPCQtM+6aQ0wOtyqM1rvkPLM63
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7688
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

On 14.08.25 14:10, Tvrtko Ursulin wrote:
> 
> 
> On 14/08/2025 12:56, Liao Yuanhong wrote:
>> On 8/14/2025 7:07 PM, Tvrtko Ursulin wrote:
>>
>>>
>>> On 14/08/2025 11:11, Christian König wrote:
>>>> On 14.08.25 11:39, Liao Yuanhong wrote:
>>>>> Adjust the position of the memset() call to avoid unnecessary invocations.
>>>>
>>>> Hui? That doesn't seem to make much sense to me.
>>>>
>>>> We memset the local variable because we need to make sure that everything (including padding bytes) is zeroed out.
>>>>
>>>> Even if that isn't sometimes necessary because of error handling we clearly shouldn't try to optimize this.
>>>
>>> To interject with a curiousity, it is even worse to move the memset away from the declaration block when the often enabled CONFIG_INIT_STACK_ALL_ZERO is on. At least when they are close compiler can figure out it only needs to memset it once. Move them further apart and sometimes memset happens twice, yay.
>>>
>>> Main point when CONFIG_INIT_STACK_ALL_ZERO is on, and it often is, there is no way to avoid the sometimes pointless init. I have some local branches which try to address the worst offenders but it is so much in the noise that I don't think I ever sent them out.
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>> If we converts memset() to = { },can it alleviate the problem?
> 
> Yes, for example I have this patch:


For those two cases it will work, but replacing memset() with {} is really dangerous.

memset() makes sure that all bytes are zeroed while {} leaves out padding bytes the compiler might have inserted.

We already had tons of problems with that randing from unspace memcmp() and finger printing results (CRC) for structures all the way to information leaks in UAPI.

And yeah, I'm still massively in favour to fix compilers / C spec to make {} initialize all bytes.

Regards,
Christian.


> 
> commit c780f63e20cb0fd66d31f3c1a37b37983a30f318 (240813-amd-csmemst)
> Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Date:   Wed Jul 17 08:28:56 2024 +0100
> 
>     drm/amdgpu: Remove hidden double memset from amdgpu_vm_pt_clear()
> 
>     When CONFIG_INIT_STACK_ALL_ZERO is set and so -ftrivial-auto-var-init=zero
>     compiler option active, compiler fails to notice that later in
>     amdgpu_vm_pt_clear() there  is a second memset to clear the same on stack
>     struct amdgpu_vm_update_params.
> 
>     If we replace this memset with an explicit automatic variable initializer,
>     compiler can then see it and avoid clearing this struct twice.
> 
>     Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> index e39d6e7643bf..ecdc8fffe941 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> @@ -361,7 +361,7 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  {
>         unsigned int level = adev->vm_manager.root_level;
>         struct ttm_operation_ctx ctx = { true, false };
> -       struct amdgpu_vm_update_params params;
> +       struct amdgpu_vm_update_params params = { };
>         struct amdgpu_bo *ancestor = &vmbo->bo;
>         unsigned int entries;
>         struct amdgpu_bo *bo = &vmbo->bo;
> @@ -398,7 +398,6 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>         if (r)
>                 goto exit;
> 
> -       memset(&params, 0, sizeof(params));
>         params.adev = adev;
>         params.vm = vm;
>         params.immediate = immediate;
> 
> Or a bit uglier, different approach, but more on fast path:
> 
> commit 31c9f97d69dcc455fe45eb297bcb06c2b87d8204
> Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Date:   Wed Jul 17 08:28:45 2024 +0100
> 
>     drm/amdgpu: Remove hidden double memset from amdgpu_cs_ioctl()
> 
>     When CONFIG_INIT_STACK_ALL_ZERO is set and so -ftrivial-auto-var-init=zero
>     compiler option active, compiler fails to notice that inside
>     amdgpu_cs_parser_init() there is a second memset to clear the same on
>     stack struct amdgpu_cs_parser.
> 
>     If we pull this memset one level out, into the amdgpu_cs_ioctl(), compiler
>     can then see it and avoid clearing this struct twice.
> 
>     Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 9aa952f258cf..554289eb1913 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -51,7 +51,6 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p,
>         if (cs->in.num_chunks == 0)
>                 return -EINVAL;
> 
> -       memset(p, 0, sizeof(*p));
>         p->adev = adev;
>         p->filp = filp;
> 
> @@ -1411,6 +1410,7 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>         if (!adev->accel_working)
>                 return -EBUSY;
> 
> +       memset(&parser, 0, sizeof(parser));
>         r = amdgpu_cs_parser_init(&parser, adev, filp, data);
>         if (r) {
>                 DRM_ERROR_RATELIMITED("Failed to initialize parser %d!\n", r);
> 
> Regards,
> 
> Tvrtko
> 
>>
>>
>> Thanks,
>>
>> Liao
>>
>>>>> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
>>>>> ---
>>>>>   drivers/gpu/drm/radeon/atombios_crtc.c     |  8 ++++----
>>>>>   drivers/gpu/drm/radeon/atombios_encoders.c | 20 ++++++++++----------
>>>>>   2 files changed, 14 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/ drm/radeon/atombios_crtc.c
>>>>> index 9b3a3a9d60e2..0aae84f5e27c 100644
>>>>> --- a/drivers/gpu/drm/radeon/atombios_crtc.c
>>>>> +++ b/drivers/gpu/drm/radeon/atombios_crtc.c
>>>>> @@ -770,13 +770,13 @@ static void atombios_crtc_set_disp_eng_pll(struct radeon_device *rdev,
>>>>>       int index;
>>>>>       union set_pixel_clock args;
>>>>>   -    memset(&args, 0, sizeof(args));
>>>>> -
>>>>>       index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
>>>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev,
>>>>>                      &crev))
>>>>>           return;
>>>>>   +    memset(&args, 0, sizeof(args));
>>>>> +
>>>>>       switch (frev) {
>>>>>       case 1:
>>>>>           switch (crev) {
>>>>> @@ -832,12 +832,12 @@ static void atombios_crtc_program_pll(struct drm_crtc *crtc,
>>>>>       int index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
>>>>>       union set_pixel_clock args;
>>>>>   -    memset(&args, 0, sizeof(args));
>>>>> -
>>>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev,
>>>>>                      &crev))
>>>>>           return;
>>>>>   +    memset(&args, 0, sizeof(args));
>>>>> +
>>>>>       switch (frev) {
>>>>>       case 1:
>>>>>           switch (crev) {
>>>>> diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/ gpu/drm/radeon/atombios_encoders.c
>>>>> index d1c5e471bdca..f706e21a3509 100644
>>>>> --- a/drivers/gpu/drm/radeon/atombios_encoders.c
>>>>> +++ b/drivers/gpu/drm/radeon/atombios_encoders.c
>>>>> @@ -492,11 +492,11 @@ atombios_dvo_setup(struct drm_encoder *encoder, int action)
>>>>>       int index = GetIndexIntoMasterTable(COMMAND, DVOEncoderControl);
>>>>>       uint8_t frev, crev;
>>>>>   -    memset(&args, 0, sizeof(args));
>>>>> -
>>>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>>>>>           return;
>>>>>   +    memset(&args, 0, sizeof(args));
>>>>> +
>>>>>       /* some R4xx chips have the wrong frev */
>>>>>       if (rdev->family <= CHIP_RV410)
>>>>>           frev = 1;
>>>>> @@ -856,8 +856,6 @@ atombios_dig_encoder_setup2(struct drm_encoder *encoder, int action, int panel_m
>>>>>       if (dig->dig_encoder == -1)
>>>>>           return;
>>>>>   -    memset(&args, 0, sizeof(args));
>>>>> -
>>>>>       if (ASIC_IS_DCE4(rdev))
>>>>>           index = GetIndexIntoMasterTable(COMMAND, DIGxEncoderControl);
>>>>>       else {
>>>>> @@ -870,6 +868,8 @@ atombios_dig_encoder_setup2(struct drm_encoder *encoder, int action, int panel_m
>>>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>>>>>           return;
>>>>>   +    memset(&args, 0, sizeof(args));
>>>>> +
>>>>>       switch (frev) {
>>>>>       case 1:
>>>>>           switch (crev) {
>>>>> @@ -1453,11 +1453,11 @@ atombios_external_encoder_setup(struct drm_encoder *encoder,
>>>>>               (radeon_connector->connector_object_id & OBJECT_ID_MASK) >> OBJECT_ID_SHIFT;
>>>>>       }
>>>>>   -    memset(&args, 0, sizeof(args));
>>>>> -
>>>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>>>>>           return;
>>>>>   +    memset(&args, 0, sizeof(args));
>>>>> +
>>>>>       switch (frev) {
>>>>>       case 1:
>>>>>           /* no params on frev 1 */
>>>>> @@ -1853,11 +1853,11 @@ atombios_set_encoder_crtc_source(struct drm_encoder *encoder)
>>>>>       uint8_t frev, crev;
>>>>>       struct radeon_encoder_atom_dig *dig;
>>>>>   -    memset(&args, 0, sizeof(args));
>>>>> -
>>>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>>>>>           return;
>>>>>   +    memset(&args, 0, sizeof(args));
>>>>> +
>>>>>       switch (frev) {
>>>>>       case 1:
>>>>>           switch (crev) {
>>>>> @@ -2284,11 +2284,11 @@ atombios_dac_load_detect(struct drm_encoder *encoder, struct drm_connector *conn
>>>>>           int index = GetIndexIntoMasterTable(COMMAND, DAC_LoadDetection);
>>>>>           uint8_t frev, crev;
>>>>>   -        memset(&args, 0, sizeof(args));
>>>>> -
>>>>>           if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>>>>>               return false;
>>>>>   +        memset(&args, 0, sizeof(args));
>>>>> +
>>>>>           args.sDacload.ucMisc = 0;
>>>>>             if ((radeon_encoder->encoder_id == ENCODER_OBJECT_ID_INTERNAL_DAC1) ||
>>>>
>>>
> 

