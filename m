Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCy2HFZCgmlHRQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:45:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BC1DDC92
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF1B10E2C2;
	Tue,  3 Feb 2026 18:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OMrY3LA+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011013.outbound.protection.outlook.com
 [40.93.194.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0221210E2C2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:45:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/Jo6EOgzhn4gnHkWf61uFhbX2hqTNFBrpFMz5ClRV+j20hluzUwXl/92FerIRGcL7hSVrTBgzS6amLseZK4hNh6lt+8Y7awrzvWd/e/n/TulbqJwtd6twgdFiPmTuVdVS0hCaVNWnOMIkTcMpXjoxL4NPH9Oa9vOGqcUYgltIJK/dobPQwvX72+FOCSJcWq+7edsQPqFjDQ/c7lw5IIyQ+p78giEgFs87h+fN7uQA8Ven2d3go2YvSG5qi5bXyi3o/Te4a/t0Jrp7LBari5NGsHbI0mgyNgdFz3zYNO+UqN0ll+9wB82yemJGyugT1y52RT/Ep0SmhHGRImb4/JFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPaXdpG7GQ7nJ/Xa061uwLkE3O6oam7qaZKEyaz8L0c=;
 b=nBaanVEvvArW8c8AA7mMCi8MPjthI7+QnxxRxmd7bIBGaLxxDVqUuqOo5XlWi9DejY+DUO6CLUfa3rIJXNpGmKgbuxdvP/18t4jRYAUZ5Vr/uWOAcx6bhN+/fOcUsHPZq4QLA/JW5k55k/vMIWe+sCOG6LyGOFAsKgOIC6D3N4FFM6Kb2LMmQHCgkaSNzvg6qFv6HEBZ/o/Z8dWGIgX2xpxivOkOft8UtzmlHkwpk3zh8Dx4SHZb1jhsZMiS4Qo3MlvbXy2ulxYhpeqxpw+6mcmwOOdNKwS59bt10wU1WPzwmbqjd51+t+QckOK8pacdoOC1MDgn0bFVof6SH2nTSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPaXdpG7GQ7nJ/Xa061uwLkE3O6oam7qaZKEyaz8L0c=;
 b=OMrY3LA+sWoRT5su24mg3rki4M5ecurl0CM70BG7GwGFSuAvjpABPOwPw5pRIVnG7TQXGw0pwE3lwooORQspPLR1HkRHPPwYA1+MEcxGD55wMSodt2PnB6l77wN+NizP3nKPN2iMniyPh6hGc3/RStBI+gi47uMeuD44ps2u3Mc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL3PR12MB6547.namprd12.prod.outlook.com (2603:10b6:208:38e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 18:45:32 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 18:45:32 +0000
Message-ID: <d740a48b-34c3-45ee-8e67-0b2fdfb70263@amd.com>
Date: Tue, 3 Feb 2026 12:45:29 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix incorrect error code returned for
 failed chain command
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260203184037.2751889-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260203184037.2751889-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0230.namprd04.prod.outlook.com
 (2603:10b6:806:127::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL3PR12MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 5431d9ef-81d8-4824-e8a9-08de63546904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2xKZm9sVklDNzRqc1RxOWQ4Q2N4MHhzU3IwR2gzclJRTkt4VG1NbGlFcGxz?=
 =?utf-8?B?ZjVMZjRnK29LWmFudUVpdGtOUHNkaVBGTEl1VHg5N2pWT2JzWEs0TUtmUTdn?=
 =?utf-8?B?Vi9MVytqR05NSWhDVkE2ditFT1lYQ3RsY0l1bElOSDhycC81Rm5mOTZoREgr?=
 =?utf-8?B?TmxRS3hPT21LVXlNUHNoL2dERkUxQVZNYkNSZEthUU8rNzA5UWdPUFJnMXV5?=
 =?utf-8?B?TjhVTDRxUzRXSDhDRjREYyt0djBET1ZJVDZUOTg4K0JqYWlUU0c4amQ5K242?=
 =?utf-8?B?Yk51cDkyRGI4dHU3a0l1eXBYVWlRQ2thZ2F0eUErODIwYWZOVTFrN09vQVpq?=
 =?utf-8?B?dG1Bb0pzWjVtcHdrcnR4d2tSaU5qTjNHZ0R2U2xDbW4yaDdjY1EydUpLamZF?=
 =?utf-8?B?VVBjK1hpUnFWRzQ3Zm9UYUVPVWhQRVFOTTR3aFRXZzZLUUNBYTVJeVhyMGMv?=
 =?utf-8?B?ZzlXU0pmTCtkOUVvZmJzb05XU3BibTE4RHE2WGtXblJOR0trUURxRnp6Zm9F?=
 =?utf-8?B?QVUvNkdPc1pHcXV4YUliU0J0Mzl0RUE5N3NDTnhZaC9lRUl6dFM4MndCN3o0?=
 =?utf-8?B?M2ViSVBnOU9Id05wRVAvMXB6ZVJmeHgxRDJ6QXJsenZaTU4xcnFxK3F0RkNj?=
 =?utf-8?B?TXN6N09rUWJmS1o1RjdCSXowa29xWVNTMGJEaUQvV3VONTZOZUlQZi9mV0Jt?=
 =?utf-8?B?SHpHUWtOeWF4dVdkTHdaaFBaWWZmNk5lQVd3NmxrWnA3RzMvTko0bjJjQ3Fn?=
 =?utf-8?B?eGRRMjkwcWRlUlJCbGVjaTZyUE1wdmxSS2ZNUGhxZ29kdmNnWGd1VEtNY2Zr?=
 =?utf-8?B?dXE3UHNrK2hYRDl2RXorZlVuSzczT0J6TWVudlN3dXlOOEVSeUx0MkYxTUtE?=
 =?utf-8?B?dVdDOStqUHF0VC9BRWpmVEoxcllmQUI1bEp0ZHN1WEN3Z2NnUFVJOTNqcWtG?=
 =?utf-8?B?QUF2Wml2bk1xcGxiTElhdVllaVdaOVBISkplZ1VOQUp0NVo5Y3phcWxyZmw5?=
 =?utf-8?B?R1FJVTlCbkl1a25BQmlwZGVCNW9wZmg1TFVCZkpKS3drS3JrWWhpL043VmhC?=
 =?utf-8?B?eXl5dlZlVzNiVGNmMzZ5bXlkamJPbWJ4bVpJaHpWTm5zVjZqek1wV2RLdjI5?=
 =?utf-8?B?cUFJSnJSUWdDd1ovZzZkZ3ZoRmhRNnlCemVHSm9VZ3QrYTdNS0E1bFNYc00y?=
 =?utf-8?B?aGxpbmkwdXFlc01GOEpSNmNEeUkvYmZvbE5ZVjZnT0ZjTzEzSnZXNmNlTmNa?=
 =?utf-8?B?S1JGZW1qeGIrZHpyVkFWRmtlRGc5UStqSUlxbmZNdUFINndLRytkMDhXcE4z?=
 =?utf-8?B?cmVVUnMwTkdSZUZwNXRDY29JMFVVVDlkeWxZbXdCMk1DNktyYnNKOEdsRnFP?=
 =?utf-8?B?QmZmeE9lamFaUTlhVEtadE5nMUlWZkxJVDJybElCc1ZDY2Rya05UMkxxcUp2?=
 =?utf-8?B?TmVSalRYQVlXb29aMEp4SkhmZGdKazlTWEtYWFNzY1o4aitRMXFwaTNvVHZQ?=
 =?utf-8?B?VTRqc2lUUm5ySkZ4M1U1MWZLMkRnR2lDYktJWWY4aituanM1SkkwSVp6TjNI?=
 =?utf-8?B?L25SSXIyLzQvWlRCVnYzRHFUOERqdjdTR0NnMnBjZllYditsZnE2cjM5Q0NI?=
 =?utf-8?B?UFZMbXkyd1ZmbHZqWkNSckxxS2g1K3h4NUV1dnFlTlN3dGFvdnZOUk0zZzIy?=
 =?utf-8?B?RnMwVG1vK1F1MXhEQTBIUHI2S0ZlajUxcElGS1l0MENpYk5Pa0t4TzRDblds?=
 =?utf-8?B?V0VDbmo1V3dTbERXanFmMVhDSzdndHAyRVJFdFdGVjNNQWYxTm92Wm5tSXEy?=
 =?utf-8?B?eWZDQWRBeXJQMHF6Tm8vT1RjRlBJeCtRNWprVVh1bk0rTE1FNytBUjBuU0lC?=
 =?utf-8?B?TlZ6MW1IVjJWcnF3VGtxd2pKOTJqYjBZakU4bjdlK0hOOUwwWXhZcFp0ay9h?=
 =?utf-8?B?b0JZYTZibi9VRVVqaHllMmNhbzNMQ1lFQW9mUlNmYkhtb1VTcmZ0VHZJZVJH?=
 =?utf-8?B?V05vQXRsVHlONDk1UWE0aWxRNEx5UUVKRWwxVUFKanRNKzhMeVJzS3RtKzh1?=
 =?utf-8?B?enZybXJmQ2d1dGg5b3A1azk1M3ZlelBXc1oreEphaXRkT0xRS0JFMlBHdWtF?=
 =?utf-8?Q?IBbk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW5YbnNLSXJyK0lxWGRPWVRMUjhyeTBKZTdLL280dkJwc3hLejNUTVNQblN4?=
 =?utf-8?B?QktOZ2RwWnZwNkVFN1RZZlFTL0QzYkd3bjlzVXBHQXV6bzl4T2t3SHBJOUlz?=
 =?utf-8?B?aGozZktaUVIyUUt6aGlpcmhDeEFwSnJ2U2t2ZStEY2ZWY3QyQU1VVVd2djZh?=
 =?utf-8?B?cmRYS29wcDVabHNhTFJLZm1RTWxHbkUwY0dZUXpNQURrNk4xaTBRelQ3MlRD?=
 =?utf-8?B?S3J6MVdCQzJXcHFjUDBRcnB1TXYvOE5VOWlSaFcxZWdHNms3QWtZMnhBRngw?=
 =?utf-8?B?Vkg0U2JDQlBCc0NyaHVkYytuMG5WT1lCVkxXOGRFZlZlZ0IzOWlWTGxVcWha?=
 =?utf-8?B?NVZmaFEyamF6S0VEQUxKdjZ1cktkSittSEgvaG9pWG4rUllQNEcxYVZ2ZTlC?=
 =?utf-8?B?dTY4VWRPQ1hLQllseTVQRTdPVTVJcE5lMHhxY0dQMVpuZDVjUG9YNjFQZVVu?=
 =?utf-8?B?VlhlTmRWbFNXcWlZbnhCUE90VE5BUElRSEt1bTFPOXdMSXB4TWFDQWlhTFJo?=
 =?utf-8?B?ZGQrbHBrck5sbDhlU1ZkcnZMOTRyczdPaDAxbHJzQ2p0TkJBc1Q3cHIzZ1JY?=
 =?utf-8?B?U1JGQ1N0MjFUYjFrcVBJY2I1K2FSVjJDdXpVL29qTnFMQmF6d2pDalJmTGRh?=
 =?utf-8?B?Nk8zZzRiYzljdmVZZ3lTSVdqbklLMks2L0NVQUpOV0Y3ZlBHb05nQ0FVbEor?=
 =?utf-8?B?c3FDTnN6R1dCd2hjTjJNdG02Y1YxWGg3ejlGVFhiN0dqZnZBaGdFN0F3ZDlG?=
 =?utf-8?B?TEVTZTlNa3R0VjFKU1VjK29qYjE1UXVCNllmUWN5eHJPWVk1K1hRbTRTYkNY?=
 =?utf-8?B?SzM1L2g5VU9oc2ZTczVDWlZuQmNtKzFuWVM2aHJKR1Zmc25xbUdxMWw3YjZi?=
 =?utf-8?B?Rk1WK3dUbkxNZVpqS0FvUUxLVVZBSFlJQWx0RWs2TnUrN2IzZUJ5UThIT0ZE?=
 =?utf-8?B?d1VvWUpyK0hvdWRlYTVZTkZhR1Y4dnR0Y3FLbTdFS0J0N2lmbkJoUlZ1dXN1?=
 =?utf-8?B?QVh6WDdyNGpjVy9GYmg0ZGM4VkNIZ3A3OHIrVXhzbWVjUDBiTzdSSzVTWkpS?=
 =?utf-8?B?Q1BlWW80aUxzK1ovRTFoWmpQYzJRbGNSdTFwOFdmV0EyZ1NqVGRqcFZ5c3Ay?=
 =?utf-8?B?Zk0yZ0NYOGJFM3dOVXFxQjJvWHJvSEhESWZtQjR5c2dYVzZ5SDlndXErUDZK?=
 =?utf-8?B?RG5hcHJWTnhGVlBVei9TcGdQWFlNcDVxZ09kZXpTM1R3RGo2bnlEMXZIdmRF?=
 =?utf-8?B?Wk01VGxnVTZGWFFNMWF2TXk3V0RTMWVJZWw3aW1oZGh3M2tWRjdzM0lGNW02?=
 =?utf-8?B?NGJpYm1PcmxUNzV0OWkvVVoxWlA0ZVJhTUtvOU52WndaQWQ5V3F2NjZjTlpY?=
 =?utf-8?B?L1VKSzlTVXJ6U0p4dHBKRXdtTkk4U2ZGVUVtbjNEb1htZVFLckE2eXpWZ1Zs?=
 =?utf-8?B?bUNTbURBNDBUNm8rR3lYUjdTU0oxdGN0M0plZnp6U3hSRFFaK2syNG51eU44?=
 =?utf-8?B?bjUyeXpzaGlvVHNUMi81eTROK1pzWnhQLzc2TS93VmkwRWdmOHRNYU1iMmR6?=
 =?utf-8?B?dG1yaUZFUUdNWURlbWR4WUltWG1vT1c5bXRreVZCK2lXTkNUdVErVGxBUTVN?=
 =?utf-8?B?SmRiN1Q1RE5PMVJuV05RK0F3cllUaTNvRm56ZkdkRXQ1dDFsNmJQcSt6dS94?=
 =?utf-8?B?R3JsSmNsWWFQc1RHVm8vZUpiclBvOFlXZUMrVzNtdGY2czJ2alIzcUs5bGlS?=
 =?utf-8?B?TkFNcVlNNWdZa0pTTm1KR0REQU1OSXdCYXhDYkNUWTVUVHg4a3dNenU4SFd6?=
 =?utf-8?B?Qy9Rb0h5S3JFZ1hnTitubE55MkIwSTFmMERQSVhkZldQZnFKZERPSzJ5c0tH?=
 =?utf-8?B?UHE1UTZuYXRhZGlkZS85K0N3amU0a3NYNU1UMDNGV1A0WWN2ZklOcWhaZ1Ix?=
 =?utf-8?B?anpubGFHa1RqTVg0aXIvaWpUbWNhZlQxelh5eVFsNHBFTmR6dHVlWitYeCtK?=
 =?utf-8?B?K3pGZ1QrUHNKTHVFeVNMb2Nnb3ZGQVE0RHpndjl3M2U3UGd0azhocjZUNFAv?=
 =?utf-8?B?d3RBTDN2OEV0SVlJcE9qRThGOEdiL2I5bDhidzduOVpCdXBteWJVMXBFMGdP?=
 =?utf-8?B?elQ4TjdJaVRVazlCY1drZkhFL29RdmxoeTI0RUh1MHd1UEtuRERHQ0dURytG?=
 =?utf-8?B?MDd0Zm5TUXJGeHlRdGpiM1dDK3JGeWYwL2J4bHdlRnpGNVJhSlM5OTByR25Q?=
 =?utf-8?B?UWlnMSt2T25TT29aQ3QvQXduOUVnU3RzV2pDdk1HOGZheUNvQXFGVzQ4N0VP?=
 =?utf-8?Q?I5nhKOmDMhCXEPeu40?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5431d9ef-81d8-4824-e8a9-08de63546904
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 18:45:32.5870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ac6PlC0RyirtBSdWESa2K/3Rh3dYiHZrOlrcc0RJc5C9xnlmk0UlOu2RyS+Aw2uTXHSTDRaPULp5Pms8dolOsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6547
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: C5BC1DDC92
X-Rspamd-Action: no action

On 2/3/26 12:40 PM, Lizhi Hou wrote:
> The driver currently returns an incorrect error code when a chain command
> fails. In this case, ERT_CMD_STATE_ERROR is expected to be reported for
> failed chain commands.
> 
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index ad5b5cd0bc81..fe8f9783a73c 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -274,7 +274,7 @@ aie2_sched_cmdlist_resp_handler(void *handle, void __iomem *data, size_t size)
>   		ret = -EINVAL;
>   		goto out;
>   	}
> -	amdxdna_cmd_set_state(cmd_abo, fail_cmd_status);
> +	amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ERROR);
>   
>   	if (amdxdna_cmd_get_op(cmd_abo) == ERT_CMD_CHAIN) {
>   		struct amdxdna_cmd_chain *cc = amdxdna_cmd_get_payload(cmd_abo, NULL);

