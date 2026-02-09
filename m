Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNAmJoLuiWn4EQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 15:26:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F091103CD
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 15:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1897310E0E0;
	Mon,  9 Feb 2026 14:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Wvn5m+ho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011048.outbound.protection.outlook.com [40.107.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C97610E0E0;
 Mon,  9 Feb 2026 14:26:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9fo++cLH23+BmS0RjuUeSjRV88swp3QGi6bRJe0qV6vePaoavY+LVzKEIeljtOo5hQWch94JQ+VGFwCoeuloFqk7lOOz16ojC1XECMs9VMuLE1DL6HyvQUFfpdRfnJoWTJX7uS3xSO5ZZlHi/+XwBzQN5D0wFhr0W6N2tAeTICXkX4rMdFxL1eHwM6t8/34IpcuVn8JHwT/dbu1o6cH6WeSqfI293CVaFx9O2F28jdmOLT0Ntw+Bt2BEWxwjtkIBZr/CPYUCuNEmPFG4G6Zro6jty1auikajIALHV2HQNe3buib9URepr8EMn9sbzUkfyuK9cn1w+ZLhL6R5cm3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4LxqKhKR+utHhpeVZ8Vf4CQRNZWpbkV8J1gbOq+M1w=;
 b=kIpN2qLALwoQiBYS0pceXoZJXVlT6R9mQh47WgOOCS/urwO26ACeklsMntU0n9DTrGZzaTOp2eNPG4EZdk5fdq/bBXyJZ80C6rkT2y1TnyhFhKcf4sxkqAwHYloA6eOpgKEL2TgKOlnxtvKV/ZfdWaeu7ESzlUmTeyJ12l/+QOUVEfIBveiyCc9XgEOdhWueHghTuXx8hEklkG/kBW1ANt3OImTifhuV7XYZF8tw6CBeVKYzlX8KtuHyt36NhSeOGNk/FJr2Jk1ANvIP5mkT+dPYFOP9NrZJeZZlttjs76uUxgv07hb1oA7aLdPXfdFDKaZbVYIdi6ZF4rmL+xtGew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4LxqKhKR+utHhpeVZ8Vf4CQRNZWpbkV8J1gbOq+M1w=;
 b=Wvn5m+hotLFTBI5AL1jVd9600+Q2BX/hGgt3MZjDkDHxtlQmIqwuOrjY5Dfba2JQ8VmBbmdu79DLaoMUX6MxSqdl1jdXWIgumdxPUp9nufgVFMYzVpjqVegOAz9BsdU9Xsga2HwUruq4kWBuKm3xR4vU6Z2k+iimY2YQi4iJDqQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6421.namprd12.prod.outlook.com (2603:10b6:8:b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 14:26:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 14:26:02 +0000
Message-ID: <9c7ab1b2-1a78-43d7-b4a7-5bc561158380@amd.com>
Date: Mon, 9 Feb 2026 15:25:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm/amdkfd: Add batch userptr allocation support
To: Honglei Huang <honghuan@amd.com>
Cc: Felix.Kuehling@amd.com, Philip.Yang@amd.com, Ray.Huang@amd.com,
 alexander.deucher@amd.com, dmitry.osipenko@collabora.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org
References: <20260206062557.3718801-1-honglei1.huang@amd.com>
 <da75eadd-865e-41fe-a86b-ed9d9aa45e5a@amd.com>
 <8ba8e4f2-89f2-4968-a291-e36e6fc8ab9b@amd.com>
 <f296a928-1ef6-4201-9326-eab43da79a84@amd.com>
 <38264429-a256-4c2f-bcfd-8a021d9603b2@amd.com>
 <451400e6-bbe0-4186-bae6-1bf64181c378@amd.com>
 <0eaf1785-0f84-45e5-b960-c995c1b1cf1e@amd.com>
 <a31082ab-e0f9-45ea-9a8d-cfdef39fc507@amd.com>
 <648e06d1-b854-466f-bf13-0c36ee2c36a1@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <648e06d1-b854-466f-bf13-0c36ee2c36a1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe020aa-61e1-4809-f393-08de67e726f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|14052099004;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmV3dzNzRFVyZGVUanhlN3QrZUQ2Ukprb2ZGaUk0bCtpL2ErUHpxYmdTTkZ0?=
 =?utf-8?B?bTUxb1V3czZCdVJHcnZLK0JCSEtYUVBhNE04NE1zcS9PWkhzcVQ5dldpWUg5?=
 =?utf-8?B?VndKakxOUm5EbkJqQW5Ed3VTTldUNy9xR0RDaEIxNy96NXVxYXhjUUNib0tu?=
 =?utf-8?B?amxyZ1J4Q1paNFBHQzFLc2xoRkEwZ3h1L2dYUDY2dFZUalpzaUlFeWQrY0hl?=
 =?utf-8?B?QmZwYWdRTU82Mmt6OHZ5S1ZJdm5oUXVtL29wL1JYTXJQd1BqdVhYZmorcEZ5?=
 =?utf-8?B?TGNzT3h5N2ZWcDd4UTlxMStwc0wrRG9JellNSXZJb1NlYXgyK2hNVG9zM0dC?=
 =?utf-8?B?QXYzYlp0UDRxR0ZCQmd0K1pOd0U2QjZYNmxKWHY5eXR5TSt6TTlpTWRxNlZ0?=
 =?utf-8?B?WVFjVUZITC8zOXNzaHhyM1hiUFhybkJsMVprdjF3SVlIaHFVWUtGTkljU0FH?=
 =?utf-8?B?RWFBdGxsaW5pMkgxa3ptREdOVmd6eTlzYjBoL3pHQ2hVaEFFK0ZZbmFnWVBi?=
 =?utf-8?B?M3VFZzVaTWVTSHkvZ3RZTmJDa2ZuZnpCc0JXK3d0VFZ2dTk2OW1xTWlpUVY5?=
 =?utf-8?B?K2cvMTB6aEttMHNpQ2QvYVRsUmlJbk4vei9oVXJaQWRkSXNvQlFMenErZWlV?=
 =?utf-8?B?dEUrNE1Yb2FWamVxUlJ0NWxWbHRPUkd0ZTZ5eVBtUjJ1RE9FcFkyd0d0c29h?=
 =?utf-8?B?dWtVYTMzd3V6QTdPNkFzUk9Nd1pod2JMVlM5K21MQ3JZMVpMUjEzejVPYUcr?=
 =?utf-8?B?Rk5rTzBydnFBZ2piVmZVZnI0Q3IrcEVPb3YzK3RmL0taZjFybTBOYmRjWktQ?=
 =?utf-8?B?aWhMNkJlR2FDSnlYR0IyL0hkcnNmUmRjdE56cE5HQk9YRDNERVd2bGZSY1Fo?=
 =?utf-8?B?dkM2a2Nrd0hOMnlsUHBQMTZTTElMQnRSeWRSMVExTDNNS0JMNmRkQ291N0ZC?=
 =?utf-8?B?TnR2ZnAvZFJZcHluTjZQRUV6M2JIMi80OEtYMkNDRXF1cDhsLzcxUUkvZ1VI?=
 =?utf-8?B?SHJHRmVmTE9WZThBREgyeVhGSU9BaStLcTdCSmpqajd3WTFaNnA1VnRneWpn?=
 =?utf-8?B?MU1jWFlzNVMxKy85L1JtL2d1THpzQ0JiNHJySUZEc1BnVjBoQWNpTmtDdndr?=
 =?utf-8?B?OHlYYzUxV0hTTlNDNHZWWXZudTREU3JTSHJBSHJZYUhxL2VYSGVOTmxMc1Ay?=
 =?utf-8?B?bzMwSlFaMmhZTU9ieUJpajliVVJMdHNQSHl0RHFHbTBDbno4S3FadzJyR05n?=
 =?utf-8?B?UmcwVVQybEJxNWJzYU5velJCb1pIZVhhYXRscy91VkhSM0M4QzFubzVtaFdH?=
 =?utf-8?B?VGllb1djZlZFd3ZscUpITUZob3BaYVJZYW9yTHZ3UTB0UkdxSlVNVExzZ2RF?=
 =?utf-8?B?VndkZjhwM3BkVTUrd2xGQk0wVW0rK3JISWd6K0F4ZmhtazFySUFmNWxqYnVy?=
 =?utf-8?B?OFdmbER5R2hSMUpkQTRMbC82Rm1sODNtbm9JbTh5Qi9kMVE4OVloajlIYjJV?=
 =?utf-8?B?cG93ZHdlV0cwL2lZL3pJdTMwVW9BV2xILzh0SjRtdkVtQ2tPN1BvRWNta3hr?=
 =?utf-8?B?TW1LV3RVMldKek1ROXJ5WFdmVDRodENCTERPZ21qL04xYmFTaTYzRHpOVVRQ?=
 =?utf-8?B?eHNZYVZpQkxKMlVqUEFEdE8yUDN5cUEvWVozT0xqbE1GbVlwRTE0K3dqeGI2?=
 =?utf-8?B?KzAvWnI5d0RtNkRaeEc5ZUovemduYkdJM2t3MlV1by9FQS9OamdENWRGMWVJ?=
 =?utf-8?B?eWFFSFlvUzZsM1JidkpDbU4xTU1jOWluY1M5RURwY1FReG5hYmNTbnBrcXpl?=
 =?utf-8?B?ekFwMUhJWkpkZ1Z0VjZEOURpdk5CSzE3QXd0TGFua3lmWjNxUTlOZFNBWCtt?=
 =?utf-8?B?dGZmN0NuUFQwU0dtb08ybS9aZGJkcDJzUUg0UkNmUWUycUhzL1lLVFZvUWFM?=
 =?utf-8?B?VThTS3daM3c1KzlhbURxd2hDckZ4bEhrUG5yWTFQeThBNEVERlVrSWduQ0NW?=
 =?utf-8?B?azRaSkluWC9CMHN3aG9zQm5JRkJjMkJZUXlBYVhLOGNwWXpPcThBM1piVjhN?=
 =?utf-8?B?SGx0SGZGMnNqTk5wQUgrbHBqbkNtNWdnaUJCMkRsK1o5a0JqRksybkV6cEEz?=
 =?utf-8?Q?5Cqw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(14052099004); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWdLek53aGpyNTlHa1NJaXl5b2p1a1k4SVk4d3h4d0lsQjR5UlhYd0NVSGJs?=
 =?utf-8?B?WnRyaUs4QzJ6SnNkY0t1ZFl2YUJJaGl6dUt1R2VEWXJ4V0JqWlpBMjJIM1px?=
 =?utf-8?B?b0x3QVIzQ1M0cVBpZVZqZXpkRjA3N2c0TStXcHJMR2hGT28vT3hsbi93cDA3?=
 =?utf-8?B?NXB3bUNWb2xiOEd6UW15cmVmWnRFN1JrYTJFSDN0MTNXWnY4V3I3MTJyc0xP?=
 =?utf-8?B?cnVPcFVzQktNaTR3d3ZrTkkrU1VqOGtqYzJId0xIcTRGWG4wdndkakEybFpU?=
 =?utf-8?B?WHMrOWpDSWVwOG5lU3RwZ1RLK0tJbEo1TnovN2paSnVuQUhZWVlxY1lXTnNW?=
 =?utf-8?B?ODJjdE9YazAraGtTWnIvaG9kVm9aeEJBaDJOZUYxVlVnaC8zMFFUU0FBODdF?=
 =?utf-8?B?VWJXVlh3bjJJd05QcUNFc2F5eWtXem1OcFlHT3d3eFB5M3BZYisreHdneUdD?=
 =?utf-8?B?TXlzTFR4YzdqYStpT3RRM2lMNWN1VWlYWGRYKyt0dDFkQTZ0QVo5alJDNVNS?=
 =?utf-8?B?T3lZbExlai9DcXp5UVlRYm1Vc1kwYVZ0c1owVFlmUlBMMHNra3pPdlJNemU1?=
 =?utf-8?B?YlJwQUgxY214SWdEc2U3MkFlcVcycTJXV0p4UUk0TTkxUWlvZ3g4U215bnZn?=
 =?utf-8?B?V2FjSGpVeVQxMkpZRjJiMG1kajdSOTNhUnRWMDFwaU1wUVIwMk1MUTRjbXhG?=
 =?utf-8?B?YUdKcG1ZRXpGanpoVmpCK3FYN2pvVnQ5M1B5M0IzbTVycGdpVmpqNXBnNjVT?=
 =?utf-8?B?dHMyQW5lVUY0M2laLzBNcjhrZ0NHYnkyNFFNMHp3Q0tYcDlHbzdUV1dWcjdz?=
 =?utf-8?B?RjVjMW0zN0h0cE16NE9XbVg2NndUM0RnNkhva1hxdGhxS3JQdExhVjJnSEZ4?=
 =?utf-8?B?cVNDZjZGN1hsQVN2dEd0b1BPM3BkVkZYOUdTU2t4clhvajFnQWs2a3RpSVFR?=
 =?utf-8?B?MmIyRlFzN1NEaVd0S0pQRW9pV1d5ZkhjU2JjaVpldjRlNTVXR1ZPQUcvYmNk?=
 =?utf-8?B?K2RENnR3ZzdhdDJyVFYwU01iV3VJS0hrV0I1MDFWdDhVM1pWNzNYSnlPT2tS?=
 =?utf-8?B?ZjkvSTczTlgvcUNBeXljZFRYb2ZSUGhQcGxHN2hRM25xUUJOWGJZWW45MmhM?=
 =?utf-8?B?K0xwc2JVd2tBMSswT1NKOVZTeEFDUGpoMVV3MlY3VW9HdnVrY21yVEdUYzg5?=
 =?utf-8?B?bVZiam4vMXhGdlFzdndtUDNQekk1UGJWempRWDg4eCt4ZzFBRU9xcHZaQUho?=
 =?utf-8?B?WlYrMENNdmdwQWIyOGZXZXY4YmpHSzg1RHRadVA3U09qdWZIbmlaUHJFMVFx?=
 =?utf-8?B?N1FpQWo4b1VFQUc0SVJTVGxuU05WZkZNOGlDeVpoaXlkZ2ovWHFGaFNVMGQ0?=
 =?utf-8?B?dERMU0pQY0RGanlpZ2laTnlPUUFJWjFITDRXcjZHMTVpcXVKSjNSeGNubFc3?=
 =?utf-8?B?am1JNW9oSDB1eWJlK1F5SHpBTGlPRXFURklveVorREpBOGc1QnVZUG1NMTVx?=
 =?utf-8?B?dmVROFVwQ1JVa2x0ZldGczJmSXVkTXlwRFozUTVPcEdkSjhLbGFQZFA3V3RG?=
 =?utf-8?B?eHFwZHp2YVdNL1YxL09mZjVUdkEzTnlmOE9uOWVQUm9qK3ZCMGl1dzAzL2JN?=
 =?utf-8?B?Uk1ZRUI1dzZ4Z2ZNdG1lTGdCaElIYlVrZ3B3bUllR2M4aVE2NXBWTjV5emxu?=
 =?utf-8?B?VGx3SEx5U1dWYnBUdjNyQUt5djJSbFFKaU51eitxdSswZm9DUHdGbGE5VlJJ?=
 =?utf-8?B?cFkvTHg2V3J0b2RRNGpTWG8xUjQ3QWF6aVl0ZXlZQ3doYW9vbTRuYXVBSUVR?=
 =?utf-8?B?Wlg5bDRrbmpTdVpUTmRtM3J0Uk9vV1RIb1RNZkFKYXE2K2NtcVUzOEcwR3ZI?=
 =?utf-8?B?aCtkdWV4VzVFMmpFVXhMTU82d0JYQXdPQStWTjI0VUNkU2Z5eW5lallxMkhl?=
 =?utf-8?B?d2pMOWpybGhVYzV2NE0zSmFjOU1HSU5hNXpxc1pmL2pab0VDcXg0MjJXVmd2?=
 =?utf-8?B?UkJkUDBhLzlTUW5hU1pyL09tT00zSXErNTYzWDdndlJERk80YndxNXlIOGsz?=
 =?utf-8?B?WlJURzlXYkNoTk5xRy9jZWZ1SVRhNUdzaFZaQk1hOHloS1VBb2QrYzNwd251?=
 =?utf-8?B?QmQ2dm1yQytHNmljRnQ4TUZ6ZE5tbVNrMkZ1a3kxc3JHc3hYOE1TRlVtd25E?=
 =?utf-8?B?SVpuSmh6dytPeWNPOW9jL0tlM0swRTlCWGNyc0N2THYrMHJ6THBhSVdtejJB?=
 =?utf-8?B?NW93RWdJNktycDIzbjdwMWpXd1l6MVNNc01MUEJDWnlLY2dSU1dqZDI3bEN1?=
 =?utf-8?Q?fyz2u7vjFSLNfZA754?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe020aa-61e1-4809-f393-08de67e726f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:26:02.3433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOIcrx+LVUTMFsh7bYLzx9z0qtskX9l7Mi6tc26acK17MUfVOE3xtY8d4FsO2LPe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6421
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,collabora.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kvack.org,linux-foundation.org];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: E3F091103CD
X-Rspamd-Action: no action

On 2/9/26 15:16, Honglei Huang wrote:
> The case you described: one hmm_range_fault() invalidating another's
> seq under the same notifier, is already handled in the implementation.
> 
>  example: suppose ranges A, B, C share one notifier:
> 
>   1. hmm_range_fault(A) succeeds, seq_A recorded
>   2. External invalidation occurs, triggers callback:
>      mutex_lock(notifier_lock)
>        → mmu_interval_set_seq()
>        → range_A->valid = false
>        → mem->invalid++
>      mutex_unlock(notifier_lock)
>   3. hmm_range_fault(B) succeeds
>   4. Commit phase:
>      mutex_lock(notifier_lock)
>        → check mem->invalid != saved_invalid
>        → return -EAGAIN, retry the entire batch
>      mutex_unlock(notifier_lock)
> 
> All concurrent invalidations are caught by the mem->invalid counter.
> Additionally, amdgpu_ttm_tt_get_user_pages_done() in confirm_valid_user_pages_locked
> performs a per-range mmu_interval_read_retry() as a final safety check.
> 
> DRM GPU SVM uses the same approach: drm_gpusvm_get_pages() also calls
> hmm_range_fault() per-range independently there is no array version
> of hmm_range_fault in DRM GPU SVM either. If you consider this approach
> unworkable, then DRM GPU SVM would be unworkable too, yet it has been
> accepted upstream.
> 
> The number of batch ranges is controllable. And even if it
> scales to thousands, DRM GPU SVM faces exactly the same situation:
> it does not need an array version of hmm_range_fault either, which
> shows this is a correctness question, not a performance one. For
> correctness, I believe DRM GPU SVM already demonstrates the approach
> is ok.

Well yes, GPU SVM would have exactly the same problems. But that also doesn't have a create bulk userptr interface.

The implementation is simply not made for this use case, and as far as I know no current upstream implementation is.

> For performance, I have tested with thousands of ranges present:
> performance reaches 80%~95% of the native driver, and all OpenCL
> and ROCr test suites pass with no correctness issues.

Testing can only falsify a system and not verify it.

> Here is how DRM GPU SVM handles correctness with multiple ranges
> under one wide notifier doing per-range hmm_range_fault:
> 
>   Invalidation: drm_gpusvm_notifier_invalidate()
>     - Acquires notifier_lock
>     - Calls mmu_interval_set_seq()
>     - Iterates affected ranges via driver callback (xe_svm_invalidate)
>     - Clears has_dma_mapping = false for each affected range (under lock)
>     - Releases notifier_lock
> 
>   Fault: drm_gpusvm_get_pages()  (called per-range independently)
>     - mmu_interval_read_begin() to get seq
>     - hmm_range_fault() outside lock
>     - Acquires notifier_lock
>     - mmu_interval_read_retry() → if stale, release lock and retry
>     - DMA map pages + set has_dma_mapping = true (under lock)
>     - Releases notifier_lock
> 
>   Validation: drm_gpusvm_pages_valid()
>     - Checks has_dma_mapping flag (under lock), NOT seq
> 
> If invalidation occurs between two per-range faults, the flag is
> cleared under lock, and either mmu_interval_read_retry catches it
> in the current fault, or drm_gpusvm_pages_valid() catches it at
> validation time. No stale pages are ever committed.
> 
> KFD batch userptr uses the same three-step pattern:
> 
>   Invalidation: amdgpu_amdkfd_evict_userptr_batch()
>     - Acquires notifier_lock
>     - Calls mmu_interval_set_seq()
>     - Iterates affected ranges via interval_tree
>     - Sets range->valid = false for each affected range (under lock)
>     - Increments mem->invalid (under lock)
>     - Releases notifier_lock
> 
>   Fault: update_invalid_user_pages()
>     - Per-range hmm_range_fault() outside lock

And here the idea falls apart. Each hmm_range_fault() can invalidate the other ranges while faulting them in.

That is not fundamentally solveable, but by moving the handling further into hmm_range_fault it makes it much less likely that something goes wrong.

So once more as long as this still uses this hacky approach I will clearly reject this implementation.

Regards,
Christian.

>     - Acquires notifier_lock
>     - Checks mem->invalid != saved_invalid → if changed, -EAGAIN retry
>     - Sets range->valid = true for faulted ranges (under lock)
>     - Releases notifier_lock
> 
>   Validation: valid_user_pages_batch()
>     - Checks range->valid flag
>     - Calls amdgpu_ttm_tt_get_user_pages_done() (mmu_interval_read_retry)
> 
> The logic is equivalent as far as I can see.
> 
> Regards,
> Honglei
> 
> 
> 
> On 2026/2/9 21:27, Christian König wrote:
>> On 2/9/26 14:11, Honglei Huang wrote:
>>>
>>> So the drm svm is also a NAK?
>>>
>>> These codes have passed local testing, opencl and rocr， I also provided a detailed code path and analysis.
>>> You only said the conclusion without providing any reasons or evidence. Your statement has no justifiable reasons and is difficult to convince
>>> so far.
>>
>> That sounds like you don't understand what the issue here is, I will try to explain this once more on pseudo-code.
>>
>> Page tables are updated without holding a lock, so when you want to grab physical addresses from the then you need to use an opportunistically retry based approach to make sure that the data you got is still valid.
>>
>> In other words something like this here is needed:
>>
>> retry:
>>     hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>>     hmm_range.hmm_pfns = kvmalloc_array(npages, ...);
>> ...
>>     while (true) {
>>         mmap_read_lock(mm);
>>         err = hmm_range_fault(&hmm_range);
>>         mmap_read_unlock(mm);
>>
>>         if (err == -EBUSY) {
>>             if (time_after(jiffies, timeout))
>>                 break;
>>
>>             hmm_range.notifier_seq =
>>                 mmu_interval_read_begin(notifier);
>>             continue;
>>         }
>>         break;
>>     }
>> ...
>>     for (i = 0, j = 0; i < npages; ++j) {
>> ...
>>         dma_map_page(...)
>> ...
>>     grab_notifier_lock();
>>     if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq))
>>         goto retry;
>>     restart_queues();
>>     drop_notifier_lock();
>> ...
>>
>> Now hmm_range.notifier_seq indicates if your DMA addresses are still valid or not after you grabbed the notifier lock.
>>
>> The problem is that hmm_range works only on a single range/sequence combination, so when you do multiple calls to hmm_range_fault() for scattered VA is can easily be that one call invalidates the ranges of another call.
>>
>> So as long as you only have a few hundred hmm_ranges for your userptrs that kind of works, but it doesn't scale up into the thousands of different VA addresses you get for scattered handling.
>>
>> That's why hmm_range_fault needs to be modified to handle an array of VA addresses instead of just a A..B range.
>>
>> Regards,
>> Christian.
>>
>>
>>>
>>> On 2026/2/9 20:59, Christian König wrote:
>>>> On 2/9/26 13:52, Honglei Huang wrote:
>>>>> DRM GPU SVM does use hmm_range_fault(), see drm_gpusvm_get_pages()
>>>>
>>>> I'm not sure what you are talking about, drm_gpusvm_get_pages() only supports a single range as well and not scatter gather of VA addresses.
>>>>
>>>> As far as I can see that doesn't help the slightest.
>>>>
>>>>> My implementation follows the same pattern. The detailed comparison
>>>>> of invalidation path was provided in the second half of my previous mail.
>>>>
>>>> Yeah and as I said that is not very valuable because it doesn't solves the sequence problem.
>>>>
>>>> As far as I can see the approach you try here is a clear NAK from my side.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> On 2026/2/9 18:16, Christian König wrote:
>>>>>> On 2/9/26 07:14, Honglei Huang wrote:
>>>>>>>
>>>>>>> I've reworked the implementation in v4. The fix is actually inspired
>>>>>>> by the DRM GPU SVM framework (drivers/gpu/drm/drm_gpusvm.c).
>>>>>>>
>>>>>>> DRM GPU SVM uses wide notifiers (recommended 512M or larger) to track
>>>>>>> multiple user virtual address ranges under a single mmu_interval_notifier,
>>>>>>> and these ranges can be non-contiguous which is essentially the same
>>>>>>> problem that batch userptr needs to solve: one BO backed by multiple
>>>>>>> non-contiguous CPU VA ranges sharing one notifier.
>>>>>>
>>>>>> That still doesn't solve the sequencing problem.
>>>>>>
>>>>>> As far as I can see you can't use hmm_range_fault with this approach or it would just not be very valuable.
>>>>>>
>>>>>> So how should that work with your patch set?
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>> The wide notifier is created in drm_gpusvm_notifier_alloc:
>>>>>>>      notifier->itree.start = ALIGN_DOWN(fault_addr, gpusvm->notifier_size);
>>>>>>>      notifier->itree.last = ALIGN(fault_addr + 1, gpusvm->notifier_size) - 1;
>>>>>>> The Xe driver passes
>>>>>>>      xe_modparam.svm_notifier_size * SZ_1M in xe_svm_init
>>>>>>> as the notifier_size, so one notifier can cover many of MB of VA space
>>>>>>> containing multiple non-contiguous ranges.
>>>>>>>
>>>>>>> And DRM GPU SVM solves the per-range validity problem with flag-based
>>>>>>> validation instead of seq-based validation in:
>>>>>>>      - drm_gpusvm_pages_valid() checks
>>>>>>>          flags.has_dma_mapping
>>>>>>>        not notifier_seq. The comment explicitly states:
>>>>>>>          "This is akin to a notifier seqno check in the HMM documentation
>>>>>>>           but due to wider notifiers (i.e., notifiers which span multiple
>>>>>>>           ranges) this function is required for finer grained checking"
>>>>>>>      - __drm_gpusvm_unmap_pages() clears
>>>>>>>          flags.has_dma_mapping = false  under notifier_lock
>>>>>>>      - drm_gpusvm_get_pages() sets
>>>>>>>          flags.has_dma_mapping = true  under notifier_lock
>>>>>>> I adopted the same approach.
>>>>>>>
>>>>>>> DRM GPU SVM:
>>>>>>>      drm_gpusvm_notifier_invalidate()
>>>>>>>        down_write(&gpusvm->notifier_lock);
>>>>>>>        mmu_interval_set_seq(mni, cur_seq);
>>>>>>>        gpusvm->ops->invalidate()
>>>>>>>          -> xe_svm_invalidate()
>>>>>>>             drm_gpusvm_for_each_range()
>>>>>>>               -> __drm_gpusvm_unmap_pages()
>>>>>>>                  WRITE_ONCE(flags.has_dma_mapping = false);  // clear flag
>>>>>>>        up_write(&gpusvm->notifier_lock);
>>>>>>>
>>>>>>> KFD batch userptr:
>>>>>>>      amdgpu_amdkfd_evict_userptr_batch()
>>>>>>>        mutex_lock(&process_info->notifier_lock);
>>>>>>>        mmu_interval_set_seq(mni, cur_seq);
>>>>>>>        discard_invalid_ranges()
>>>>>>>          interval_tree_iter_first/next()
>>>>>>>            range_info->valid = false;          // clear flag
>>>>>>>        mutex_unlock(&process_info->notifier_lock);
>>>>>>>
>>>>>>> Both implementations:
>>>>>>>      - Acquire notifier_lock FIRST, before any flag changes
>>>>>>>      - Call mmu_interval_set_seq() under the lock
>>>>>>>      - Use interval tree to find affected ranges within the wide notifier
>>>>>>>      - Mark per-range flag as invalid/valid under the lock
>>>>>>>
>>>>>>> The page fault path and final validation path also follow the same
>>>>>>> pattern as DRM GPU SVM: fault outside the lock, set/check per-range
>>>>>>> flag under the lock.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Honglei
>>>>>>>
>>>>>>>
>>>>>>> On 2026/2/6 21:56, Christian König wrote:
>>>>>>>> On 2/6/26 07:25, Honglei Huang wrote:
>>>>>>>>> From: Honglei Huang <honghuan@amd.com>
>>>>>>>>>
>>>>>>>>> Hi all,
>>>>>>>>>
>>>>>>>>> This is v3 of the patch series to support allocating multiple non-contiguous
>>>>>>>>> CPU virtual address ranges that map to a single contiguous GPU virtual address.
>>>>>>>>>
>>>>>>>>> v3:
>>>>>>>>> 1. No new ioctl: Reuses existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU
>>>>>>>>>        - Adds only one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
>>>>>>>>
>>>>>>>> That is most likely not the best approach, but Felix or Philip need to comment here since I don't know such IOCTLs well either.
>>>>>>>>
>>>>>>>>>        - When flag is set, mmap_offset field points to range array
>>>>>>>>>        - Minimal API surface change
>>>>>>>>
>>>>>>>> Why range of VA space for each entry?
>>>>>>>>
>>>>>>>>> 2. Improved MMU notifier handling:
>>>>>>>>>        - Single mmu_interval_notifier covering the VA span [va_min, va_max]
>>>>>>>>>        - Interval tree for efficient lookup of affected ranges during invalidation
>>>>>>>>>        - Avoids per-range notifier overhead mentioned in v2 review
>>>>>>>>
>>>>>>>> That won't work unless you also modify hmm_range_fault() to take multiple VA addresses (or ranges) at the same time.
>>>>>>>>
>>>>>>>> The problem is that we must rely on hmm_range.notifier_seq to detect changes to the page tables in question, but that in turn works only if you have one hmm_range structure and not multiple.
>>>>>>>>
>>>>>>>> What might work is doing an XOR or CRC over all hmm_range.notifier_seq you have, but that is a bit flaky.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> 3. Better code organization: Split into 8 focused patches for easier review
>>>>>>>>>
>>>>>>>>> v2:
>>>>>>>>>        - Each CPU VA range gets its own mmu_interval_notifier for invalidation
>>>>>>>>>        - All ranges validated together and mapped to contiguous GPU VA
>>>>>>>>>        - Single kgd_mem object with array of user_range_info structures
>>>>>>>>>        - Unified eviction/restore path for all ranges in a batch
>>>>>>>>>
>>>>>>>>> Current Implementation Approach
>>>>>>>>> ===============================
>>>>>>>>>
>>>>>>>>> This series implements a practical solution within existing kernel constraints:
>>>>>>>>>
>>>>>>>>> 1. Single MMU notifier for VA span: Register one notifier covering the
>>>>>>>>>        entire range from lowest to highest address in the batch
>>>>>>>>>
>>>>>>>>> 2. Interval tree filtering: Use interval tree to efficiently identify
>>>>>>>>>        which specific ranges are affected during invalidation callbacks,
>>>>>>>>>        avoiding unnecessary processing for unrelated address changes
>>>>>>>>>
>>>>>>>>> 3. Unified eviction/restore: All ranges in a batch share eviction and
>>>>>>>>>        restore paths, maintaining consistency with existing userptr handling
>>>>>>>>>
>>>>>>>>> Patch Series Overview
>>>>>>>>> =====================
>>>>>>>>>
>>>>>>>>> Patch 1/8: Add userptr batch allocation UAPI structures
>>>>>>>>>         - KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH flag
>>>>>>>>>         - kfd_ioctl_userptr_range and kfd_ioctl_userptr_ranges_data structures
>>>>>>>>>
>>>>>>>>> Patch 2/8: Add user_range_info infrastructure to kgd_mem
>>>>>>>>>         - user_range_info structure for per-range tracking
>>>>>>>>>         - Fields for batch allocation in kgd_mem
>>>>>>>>>
>>>>>>>>> Patch 3/8: Implement interval tree for userptr ranges
>>>>>>>>>         - Interval tree for efficient range lookup during invalidation
>>>>>>>>>         - mark_invalid_ranges() function
>>>>>>>>>
>>>>>>>>> Patch 4/8: Add batch MMU notifier support
>>>>>>>>>         - Single notifier for entire VA span
>>>>>>>>>         - Invalidation callback using interval tree filtering
>>>>>>>>>
>>>>>>>>> Patch 5/8: Implement batch userptr page management
>>>>>>>>>         - get_user_pages_batch() and set_user_pages_batch()
>>>>>>>>>         - Per-range page array management
>>>>>>>>>
>>>>>>>>> Patch 6/8: Add batch allocation function and export API
>>>>>>>>>         - init_user_pages_batch() main initialization
>>>>>>>>>         - amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu_batch() entry point
>>>>>>>>>
>>>>>>>>> Patch 7/8: Unify userptr cleanup and update paths
>>>>>>>>>         - Shared eviction/restore handling for batch allocations
>>>>>>>>>         - Integration with existing userptr validation flows
>>>>>>>>>
>>>>>>>>> Patch 8/8: Wire up batch allocation in ioctl handler
>>>>>>>>>         - Input validation and range array parsing
>>>>>>>>>         - Integration with existing alloc_memory_of_gpu path
>>>>>>>>>
>>>>>>>>> Testing
>>>>>>>>> =======
>>>>>>>>>
>>>>>>>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>>>>>>>> - Various allocation sizes (4KB to 1G+ per range)
>>>>>>>>> - Memory pressure scenarios and eviction/restore cycles
>>>>>>>>> - OpenCL CTS and HIP catch tests in KVM guest environment
>>>>>>>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>>>>>>>>> - Small LLM inference (3B-7B models)
>>>>>>>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>>>>>>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>>>>>>>>
>>>>>>>>> Thank you for your review and feedback.
>>>>>>>>>
>>>>>>>>> Best regards,
>>>>>>>>> Honglei Huang
>>>>>>>>>
>>>>>>>>> Honglei Huang (8):
>>>>>>>>>       drm/amdkfd: Add userptr batch allocation UAPI structures
>>>>>>>>>       drm/amdkfd: Add user_range_info infrastructure to kgd_mem
>>>>>>>>>       drm/amdkfd: Implement interval tree for userptr ranges
>>>>>>>>>       drm/amdkfd: Add batch MMU notifier support
>>>>>>>>>       drm/amdkfd: Implement batch userptr page management
>>>>>>>>>       drm/amdkfd: Add batch allocation function and export API
>>>>>>>>>       drm/amdkfd: Unify userptr cleanup and update paths
>>>>>>>>>       drm/amdkfd: Wire up batch allocation in ioctl handler
>>>>>>>>>
>>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  23 +
>>>>>>>>>      .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 539 +++++++++++++++++-
>>>>>>>>>      drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 128 ++++-
>>>>>>>>>      include/uapi/linux/kfd_ioctl.h                |  31 +-
>>>>>>>>>      4 files changed, 697 insertions(+), 24 deletions(-)
>>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

