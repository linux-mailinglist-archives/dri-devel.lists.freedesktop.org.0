Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AA1AF0C8E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 09:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3F110E2FF;
	Wed,  2 Jul 2025 07:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eDGIP1sZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2076.outbound.protection.outlook.com [40.107.102.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5EA10E2FF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 07:27:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8MWcME0DzQIgW51Ab0LMFEU2aJbaBTmcE5nM3/TzVgDxm8/oQ+1XvtXPnDuxqCRWv4ct0Mml3jo0Vs7LUTvjILLDZufI1yaOchG1H+kwjTx6cVALvarNOegXAcwwhdfuq7v7DU5OZABBJgSqEMkPcLT7sen2EgbtB9UmxFO9qzMt8c5HHfSFCELnirEGAD+3gmhz8bKAMHbXyMSGhCyu/kvy0WaCFOr2GbmvVcFKlzf9gaZXz0j6dDEDkgy4y1aueT/CFzzpOCPVL3IRigmxCIjKjHB6qL4PaAx5D9FTFlMvu4p9rZLTsyp9BuNpOvnocOTznWQPQ5koQgfUw77Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHlykQXgPL71pDAxOA9DA9Vkux8z6EiXK3MxHm8vJU8=;
 b=BUVvfZX0Qu14F3g7rL6aZC5FzQrW7EQLpvV8wn+/aVgO3ktmRtrasjxuX1nM1jp41ZKEuif/q3jTkfndc/MsJmZT8pMd6mHc3iHQfLz1GeUmLbkkWgTtckUQPOvDykQIjTFOC5g1ENk6+xfVB0qGsr4zZUoY9C/PkcEVmazMq8aXuf+9tubrTtwUGaoPjrqXassZju/mK83ufmrQFIjZH72LbrLy+A1oZcbGk9hkejkD40ElrSalUpjKOX/2mBVHS9vY6d2LOuPCt+JdAareGSTs+9FKRX6F2TDRjg5gywfzOsBp0UieiaVIHvO+9TKmVB2/8ckr8deAIWpjpAt0qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHlykQXgPL71pDAxOA9DA9Vkux8z6EiXK3MxHm8vJU8=;
 b=eDGIP1sZuKQWcQ1qWKG3Ggda5f66mJsrimq2gU41wlmg8MagtxUIRjNTJQBqp6FGOB8Q8PQoeeveIpDfVtZR3CffGxZbb7PyZuvdj9D1LgM5rNIrHYUGkJzGnXS3IxI99+yHOZOCH95qeF0HezqK1BCrz0hnSUWAfhWZqn0MuXM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8843.namprd12.prod.outlook.com (2603:10b6:806:379::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.37; Wed, 2 Jul
 2025 07:27:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:27:47 +0000
Message-ID: <54b2ee4a-0f2f-49a1-a680-8dc1193e2d30@amd.com>
Date: Wed, 2 Jul 2025 09:27:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] ttm: add objcg pointer to bo and tt
To: David Airlie <airlied@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
 Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-13-airlied@gmail.com>
 <20a90668-3ddf-4153-9953-a2df9179a1b1@amd.com>
 <CAMwc25ok0Q93+EeyyoR-S0Ffvi-GswDiUGA8rPBwZ+C+5Y8HVA@mail.gmail.com>
 <cf6cb95f-df79-40ae-95d5-dc5a7620a136@amd.com>
 <CAMwc25q-kBRGDrphU+iAyqENZhgdRtEnSrR9z6b5bQ_JFzzK2g@mail.gmail.com>
 <26c79b1e-0f7f-4efa-9040-92df8c5bdf1f@amd.com>
 <CAMwc25oMQ_=Hagb9N6SN3pFFPwZ8+8ZBOGvziCPhUypMpPeKUQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAMwc25oMQ_=Hagb9N6SN3pFFPwZ8+8ZBOGvziCPhUypMpPeKUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: ce51ff86-d715-4e60-c27e-08ddb939f19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVl4Uk5ZSkpxUkxFQTZIM1FqV1M1b1FERVpXaXNyelBxNTJCaTlrZnBNM2ZC?=
 =?utf-8?B?RVRlUE1UcWZiMjVkbjdMYVB6RzZzK3lrWWVnTkM5M2xFdFdmWXBnczhLUllk?=
 =?utf-8?B?SCsyVG13enNpZ01ySk1HQyt1N1ZaR0V0bGJ0a3Q5V2NocDBLak9pQzdLSm54?=
 =?utf-8?B?TDhxdzJKcFl2eTduVkQ1SUwzTzBOanJyZ1NXYkNoRnp4OExpVzZLdHFVK3Mx?=
 =?utf-8?B?Mk9zUzkvUGM4RTNKWFR5SnBmTm9ZVGFNc2lCNDlDR1JvdGEyRGNoT2hja1Q0?=
 =?utf-8?B?T0RkU1kxQlNlWm12aUFCVWVxa0NoNFhJdXE3MmJsT3J4eDJVY2NBdHRHVHJ6?=
 =?utf-8?B?RUVVK2doc1hqSnM0RngvcHZ5RHFsaUs3SmhTd2dJU1cvbDBIMjFsbTJwZkdv?=
 =?utf-8?B?WkQ5WXJ2UWpYVDY1WkRYQlpWUDc3eHZQandIM1RtQlU1a2E2L04wRkhVSHpV?=
 =?utf-8?B?ZTIyVHhiK0dxNXQydDZ0Z1h1cUx5U2hwdUdVRkwya3RKc24zL0VLMmFhcEc4?=
 =?utf-8?B?ejByeFlXL1RRMUpYeWVubExONlIwbjYramJicitSSUo1ajJlSWNUM0pNQUNB?=
 =?utf-8?B?V2lyQUJZYjFmVXJGUDcraUlzckEwSCtMMW5QUEdvalB1d0g2cE5VU2lwOTRY?=
 =?utf-8?B?a1hTVFRuRlVLVVduQ2RsZWczUEdneUFTRmxtTVhHREpYQ0cyK0hVMGRQclpF?=
 =?utf-8?B?b2NzRHVZdHZNbGZQdndjRm9uclQ0V1BONVhlcnFsWG5OMTBVRW5YUGVYRVNC?=
 =?utf-8?B?eWt3aVFRWlFmaEUwYnIyUXNUdUMyR25SS21BNFpSdEM3THZaVEZKUzhKREpB?=
 =?utf-8?B?S3FWdy9ReXVOaEpZVFN1UlUwOEY0bDRnWG03Z0xseHM1Snd2WllINTVQS3Bm?=
 =?utf-8?B?SHFGVkRiWDlIOSs2UHk4RnpwTk5udEZhd3NGci94WHM1TUFONkh4eTU0a3dB?=
 =?utf-8?B?WU1lWm4xV3ZOSFF4UXFEaHNoaEV2VXRMSlovQzZ6dzVGTytaQ0xDeFBKeDBP?=
 =?utf-8?B?eGJRc1l6ak1XMTVWVHVXektMK092QlFIb2lwZVlEUHYySnBTeEthczlhZG5a?=
 =?utf-8?B?dWVVK2FrV1FXaHEwSVdXa2F6U1d5SnRIUHJ0d1ZzQTZwQmw1NmFJbzhUZ1JR?=
 =?utf-8?B?MmU1VjhTQUhKNFM2T1B4eWxrcDdmaW40dFcrMXA4bHJwR3pLUDY1cUt5bG1Y?=
 =?utf-8?B?TnFBV09xeDJNWUZSVFdPdmRkMGhuRUMzMWhhUmZzQkxLbnBGV3dsNWx4ckZs?=
 =?utf-8?B?QTZ2MTM4dnUvMTJ6dlNHZGtXd0pNR2dsMWo3MmEralFSNWVIWHozbGhEUVRG?=
 =?utf-8?B?SEFkb2dhQzNTRy9qd1o0a29FNG44Mk03K1loU0ozREFUQ3haajV3Y0F2L0Fh?=
 =?utf-8?B?VXRtSHIyZktIcVM3YlQvQ3ZFNXYvVGVGUmtRU1ZRZ1NNUDEzazIyajhnVUhh?=
 =?utf-8?B?ZHZvbXEyV0VrU1ZtZVNmNUQyWXNDbTNncUdnUEM4M2h1aCtxbzA4R1FSa2ZB?=
 =?utf-8?B?MjZHQVBsRGhlbWJKL0ZFTVVEYlpJT0JXODY3L21EL0R5d25GUW5XOTdTZ2lX?=
 =?utf-8?B?bTZQTHF6S2hZWUxmcndiRDd6akc4S3BIdWlwS25nTDJJaC84KzFsaW1KMTNN?=
 =?utf-8?B?UU1kcFhxdXFnYTNidndEb2k2Y0YxR2t0bVdCMkpTdGlVTjE2M1pueGZUVW93?=
 =?utf-8?B?cjRKNml3bFM4RDZBOHFIbExCV0F6aTgvVHd2UjBBSm5iVzRjRzBjRlkyVWxr?=
 =?utf-8?B?aDZRdENMNFQ3L3RZQVE5a2pCdjIvYitWV2ZFV3gzUGJHVkFXT2RFSFg3YzNa?=
 =?utf-8?B?MWIwSTdVb3ZVNU51MnVFRHU0S2VWZ2RTOXYrN0JQWGdURWYvL0F4czRVV3BC?=
 =?utf-8?B?ZDYwTm1zbDhKRm95NWw2MGQ4a2V3TzFrOTRoY3BRaXpYNHNvOXFETmFEOFll?=
 =?utf-8?Q?U2rIykOFbbc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmNOWVJBS1VjZVFoK09YZll6dVEyOTJ4ZEJmdkZLREd0OHBGRXRhb2pKMXFx?=
 =?utf-8?B?bEpqck1Nd042TCt3TFRZcTRpWmtEeDRpZWFlV0VQSENEajdqS2VLdHJSWi9Q?=
 =?utf-8?B?cG82Y1grQ3ViREZ1Y2lURzlnM2Z3enBQM3A0NkY4dGdKRG1wcjhWSStlWHJY?=
 =?utf-8?B?SkwrcUl1anNncXYwbStzZHNBaG5VQWRBc2h0K004SThXK1E3SGZiME9Bc3Ey?=
 =?utf-8?B?eis4QlhDWURhbkFMR1RNR1ZUTVo3RTFsbTdKNTFIbEhXdzFQN01PTVlXNS8x?=
 =?utf-8?B?eUQ5cHFkQnlpQ2ZOcTZBaU1HT1M1TzhGaC9GTTNlMjNxUUZ1dXMzZnFTYnpl?=
 =?utf-8?B?TzFTVTNtZnVwVmdpMm10Nm9UTjA3MkNFQUxYNlA0b3FwbEpCbU9aa3Q5QjMr?=
 =?utf-8?B?clN4Nlc3ZWsxR1lpbzRYTlVYeTh2eGNoN1p3OElQbVF2NG5mQkw3Vno5UmdL?=
 =?utf-8?B?RTBzUjkrZUpHTkwvY0lIbm5uYWphdnJudXFlUS9EQk1ieFNOL3ZQRlNiQ2J1?=
 =?utf-8?B?QWd0N0NsZkMrQmNYK1JLOWxMTUFCTTJTUGsrTE5scUpRdVRPeWF4UmtiQ2JO?=
 =?utf-8?B?YWJzdS9mUEEvblR5OXk0YVU2eFBmT0tsRGIxc3MzMFJ6ZVh4SVBpVmtPNUVo?=
 =?utf-8?B?Y1BEWktWbldHS3paclFTRkNUVlA5b2MvS3g2eVVEdmwvNi9Ud2c2b090V0tZ?=
 =?utf-8?B?TkFYQm1NTFRoQXRuRlhzaVI1d2k4aCt4Vk5aeUFmUkRBWVlkTlhlZHhiZjc5?=
 =?utf-8?B?K01uRVZsM21tQ21CSEQveXFwdVdMVlJOVkV2MHJ1TlI0eGNCVXAySWNLUFdW?=
 =?utf-8?B?VTZDbmxWa1hRYXpoSk9uT3Y5TTZ2ajBpd0tpTlFlU3FwSkRXM3BwWVByNWNr?=
 =?utf-8?B?U1VhUXNjdE9EeVp2d0pFendNaVNhSDV3THBvVHVESDlpTVFJQndvdENTaVVT?=
 =?utf-8?B?V3RRTjRWMm1pNTcrRU1BOWhWaWRISTgvdEpSa3orcUhWMkYvR0V1L1diR0hv?=
 =?utf-8?B?SmlTQ28rNExpc0IyUlUwNmZSSHNwYVQxNTdxL1ZROFRFTTdJSEdrTUdGa0wy?=
 =?utf-8?B?S1Vib1BRQ3JUL2NQNEFjRzFlVnNWeWtIV2REWGtDQVVrUnFINEgzUnF4REZX?=
 =?utf-8?B?NWJKaHF5MU8reENaOFc5SGhBeEN5YVdHYnkxa0hGK0FyZ2oyYUhXQmU1T0tW?=
 =?utf-8?B?SFUzLzVrTTdseXZZaGNTc3VzbVNxNWYwbmNmV25lVmtzRzhsT0hzeTcxdUFI?=
 =?utf-8?B?anZLcGV6SWNUb1BYejZQOGlEWUtpUVM2eUl5YkNCUVpNZnFxOElNakJHWFNF?=
 =?utf-8?B?RDIwcUxxV2xKeStpTThJMllaUDBUT3JUSTVIQllKcE5XNmdoYm5keTZJY0Nv?=
 =?utf-8?B?Tyt2OGZzbEUwdlVYcDlpeUYwU1N3eEJOWDVabGFOQlpsRFRUVWx0ZWZrUGgx?=
 =?utf-8?B?VGJUcWZhZFFCNGxTS3g5SFFTM0laZTZObDBEcWZwMnZNMkFUQ1J1UEo2N2M3?=
 =?utf-8?B?bEFVQkQreC85ZDRUaENGNzBOYTdVVysxYjYyWkNwUkcrZTQwMGNERkdNSmNZ?=
 =?utf-8?B?WW43R3FlYUpTSmhuL0o1MmxYYkdodEZkVU9oS0dlK0l3bERPMVdnUGlxbGdz?=
 =?utf-8?B?bklzK3ozVXAydXBxbC9JcUo1bmpzK2xOVXh2aTFnWWRnajJvYWE3aFNma3JF?=
 =?utf-8?B?MmNsWjhkSmxSRnBWTTlTSVdDZTlhcVpjU2p5cHZ5ZEV4LzBBQUhqRlVad2tN?=
 =?utf-8?B?WG0wTVFNN3dxY083dXZXazRscGd6NkRHcVhUc0h0b05sNVAraWY5Q0tTd2ts?=
 =?utf-8?B?MktJOWRIaVlnemV0d1FEOW5WWXZrc1NRRy9Sc0pHOVhtUGNRb2xFTDJXbytl?=
 =?utf-8?B?N3VUK0RhUFE4U1JjSUtFcFFiTk03WWtIYnNIZGpEV0FnL3dSd09FU2dmUlpT?=
 =?utf-8?B?dlpKQ1VNVytoR2JjUko5TFZWZnhkWDh5OUhhQW5Pcm42YjJvaEd0ckNVNmFS?=
 =?utf-8?B?aVB0cS9PYjZ4WTh5T3FsT1lJRWxYeEtKTmZmR2VmVEJFSzFlMUtUMk9iNjN4?=
 =?utf-8?B?NlgzK0o0d2p1azBQUE5GNHBIT3lCRzUxWVV6KzEvdG9FaXNxRmlHaWM1dlFm?=
 =?utf-8?Q?Li30MFqzzcfx1h0VGVGoPLmqq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce51ff86-d715-4e60-c27e-08ddb939f19c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 07:27:47.6629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEFd/cl1DWDY8OFoFOzVmUbz1a47q6rQQ29SN+cA61+coO/qj9K11FUyG5jSzFzC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8843
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

On 02.07.25 00:11, David Airlie wrote:
> On Tue, Jul 1, 2025 at 6:16 PM Christian König <christian.koenig@amd.com> wrote:
>>
>> On 01.07.25 10:06, David Airlie wrote:
>>> On Tue, Jul 1, 2025 at 5:22 PM Christian König <christian.koenig@amd.com> wrote:
>>>>>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>>>>>>> index 15d4019685f6..c13fea4c2915 100644
>>>>>>> --- a/include/drm/ttm/ttm_tt.h
>>>>>>> +++ b/include/drm/ttm/ttm_tt.h
>>>>>>> @@ -126,6 +126,8 @@ struct ttm_tt {
>>>>>>>       enum ttm_caching caching;
>>>>>>>       /** @restore: Partial restoration from backup state. TTM private */
>>>>>>>       struct ttm_pool_tt_restore *restore;
>>>>>>> +     /** @objcg: Object cgroup for this TT allocation */
>>>>>>> +     struct obj_cgroup *objcg;
>>>>>>>  };
>>>>>>
>>>>>> We should probably keep that out of the pool and account the memory to the BO instead.
>>>>>>
>>>>>
>>>>> I tried that like 2-3 patch posting iterations ago, you suggested it
>>>>> then, it didn't work. It has to be done at the pool level, I think it
>>>>> was due to swap handling.
>>>>
>>>> When you do it at the pool level the swap/shrink handling is broken as well, just not for amdgpu.
>>>>
>>>> See xe_bo_shrink() and drivers/gpu/drm/xe/xe_shrinker.c on how XE does it.
>>>
>>> I've read all of that, but I don't think it needs changing yet, though
>>> I do think I probably need to do a bit more work on the ttm
>>> backup/restore paths to account things, but again we suffer from the
>>> what happens if your cgroup runs out of space on a restore path,
>>> similiar to eviction.
>>
>> My thinking was rather that because of this we do it at the resource level and keep memory accounted to whoever allocated it even if it's backed up or swapped out.
>>
>>> Blocking the problems we can solve now on the problems we've no idea
>>> how to solve means nobody gets experience with solving anything.
>>
>> Well that's exactly the reason why I'm suggesting this. Ignoring swapping/backup for now seems to make things much easier.
> 
> It makes it easier now, but when we have to solve swapping, step one
> will be moving all this code around to what I have now, and starting
> from there.
> 
> This just raises the bar to solving the next problem.
> 
> We need to find incremental approaches to getting all the pieces of
> the puzzle solved, or else we will still be here in 10 years.
> 
> The steps I've formulated (none of them are perfect, but they all seem
> better than status quo)
> 
> 1. add global counters for pages - now we can at least see things in
> vmstat and per-node
> 2. add numa to the pool lru - we can remove our own numa code and
> align with core kernel - probably doesn't help anything

So far no objections from my side to that.

> 3. add memcg awareness to the pool and pool shrinker.
>     if you are on a APU with no swap configured - you have a lot better time.
>     if you are on a dGPU or APU with swap - you have a moderately
> better time, but I can't see you having a worse time.

Well that's what I'm strongly disagreeing on.

Adding memcg to the pool has no value at all and complicates things massively when moving forward.

What exactly should be the benefit of that?

> 4. look into tt level swapping and seeing how to integrate that lru
> with numa/memcg awareness
>     in theory we can do better than allocated_pages tracking, (I'd
> like to burn that down, since it seems at odds with memcg)
> 5. look into xe swapping and see if we can integrate that numa/memcg better.
> 
> So the question I really want answered when I'm submitting patches
> isn't, what does this not fix or not make better, but what does this
> actively make worse than the status quo and is it heading in a
> consistent direction to solve the problem.
> 
> Accounting at the resource level makes stuff better, but I don't
> believe after implementing it that it is consistent with solving the
> overall problem.

Exactly that's my point. See accounting is no problem at all, that can be done on any possible level.

What is tricky is shrinking, e.g. either core MM or memcg asking to reduce the usage of memory and moving things into swap.

And that can only be done either on the resource level or the tt object, but not the pool level.

The whole TTM pool is to aid a 28 year old HW design which has no practical relevance on modern systems and we should really not touch that in any way possible.

Christian.

> 
> Dave.
> 

