Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F639B2F803
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 14:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8811910E96C;
	Thu, 21 Aug 2025 12:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X2GCkzXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7092B10E96B;
 Thu, 21 Aug 2025 12:30:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/cRSqPC24p9EK8I7Qq0etqQ8UCdXxV0FfBGS9citYsdbwXoASEPO+Ij2AOfK3a9XCK9Z1ba4CZ6+AVs2AqmX+pdknNQVQ5u2g1aD+xNkr+LpVgynYG9qk6X5DKq+xgSX3fVi7Zlm0tnK3iQ/cOq0M4uJpYfWwKI3SH0ScShmy7Kxvy+c1uTalFGm8ir8B1WiTnxRg9zbPWxrFg/8zowHy4QKZTUNY5T07Eu6tDmANW8hV9J8uTszT5jUkth/TG5IttcxxUY8BSyFM7WV+TJNRRGrQ2nhyXplj5Shnnpp3JJbu8A797B14z56HE7T+QTIL/D05luiP/OA1V2w5Zabw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idziomrCmeXnZlqkHwxbH4ZPsuWYQa4r8dJcrMO7LjU=;
 b=PxvqyCc0h1/rVnqTcrnLY5O77R2lUjg5l39rQNkrztSGc+v/cxf2A4hPXfHGLiQUoy4sH7a0n5Ou6UhBlq7eGnxIgciPh3cQ2+wjDHoTnpjbxF7cigJZwrfVGn4iRtW9cWABZvlQOCn8iitVi6ji9KiK01Lrea7Z4QSVrftTYCb3oaCuBZY5tCXJKFU2fYFGzSve2bCLWl37jg8BZmns1ndL8c4W0cDY469HIWtcb4TVZwR7dm5Jzu8tmk9G7e0yyCA+G2ol6cQEyShWZAM5Q3KyuAVnMmwIfumvyas8GCv8i146fj3Y2CCIpbeDWAzbSyhdbEboS1fYyMUflcpPag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idziomrCmeXnZlqkHwxbH4ZPsuWYQa4r8dJcrMO7LjU=;
 b=X2GCkzXkfRGedV+GV8UPOcGIcbZ9nGf+YTknRLr+2x7FPTfnXUfSyfyTfMOE9qgIC4KZf/Zv4BgJalxB7pxevyVfaUht4VFpktKgTXIPWBEYR9/AVF/S2rzm3XtUVzf2PXRhU7HNrx8uMt0UkwWz23GkMI6lrRz35IiNXFDi7DQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5736.namprd12.prod.outlook.com (2603:10b6:510:1e3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 12:30:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 12:30:33 +0000
Message-ID: <1f13c0b6-fdbb-4364-a32e-4344f8526464@amd.com>
Date: Thu, 21 Aug 2025 14:30:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Switching over to GEM refcounts and a bunch of cleanups
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250716160555.20217-1-christian.koenig@amd.com>
 <c5830530bafa9806b9e1b0604d87f7907f651c82.camel@linux.intel.com>
 <5a9c2c36-d1b2-4871-b84a-7372aa547399@amd.com>
Content-Language: en-US
In-Reply-To: <5a9c2c36-d1b2-4871-b84a-7372aa547399@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0079.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5736:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d30f0d-006a-4764-e9fa-08dde0ae8605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVhHWFZVVUNQbVlEUVhVUHkvNVlGUE9LamxoQXpkK0RXdFB3VUVlR0k0V0FS?=
 =?utf-8?B?MUZ6anlrZnRuUHU0MnRXZG9ENWE5SFFLSW02NUlqai8rQ3BpWDJZVjhzZ0J4?=
 =?utf-8?B?bEhRendOZFpKdHl5QVBJcEhSN1hlNGhrYmZkZzNLclpma3dDdG9DU3Q3aGFv?=
 =?utf-8?B?aU1sUEZ3K3Y0bkxqTVFNRXc0NkF1UGsxQnlmMG51WXlKN1pCNVQzd3YrVnBy?=
 =?utf-8?B?cG5lVzQwQXYrME4xbVE2enhkM2F1NmQ0Tm1Ua0FvemlraHRwVVFLMDhaWjhS?=
 =?utf-8?B?Z1ZOK1NGYmNKeGsxUVMrOWpySDBhQmdBVURNWVhrWk1kMENEeHNFVUcwVEQr?=
 =?utf-8?B?TTNxRUQ4eDBjaXhvOEYwbXY1d1FGL210NHJvRUtEb2JITFhpR0JlQzUrOERD?=
 =?utf-8?B?elJqZStxc1hZM2ZicllIcTJEcjQxNGdqZTVJL1ZQT2FTNFl6MkdUV1d3MDQ0?=
 =?utf-8?B?M2UvWnRMNVBQUzRaWmQvNk1ua05JemlVaWRKTklVaVQ3dk9oVlhOcTMwQU9l?=
 =?utf-8?B?UitYZWlNWm1lTTFHVTlZd0pMdUt0cW1neDNTcFhGS1lldHZNRmdJU3pMTFZM?=
 =?utf-8?B?RFpya0JnRWdvRkxFaUFRcHJJV3dVSklqV0xHM05FU3ZDb3JrTXNvaFRXa252?=
 =?utf-8?B?OFZSUUhnbVdTTFJSUGs1ZjdqUjNpRzM1QVdUTnNidWU1WFAwbjBlcHI4aUJ2?=
 =?utf-8?B?VDFoeTl1ZzZ3NXhiWnYxWCtmMkwwbTlVU0svRTdwOWw2Z0xnNE1iUEtaZFV6?=
 =?utf-8?B?cTdwL0o2bG8vc2tWejJudlBtY0ZvMk9VekNIREVacUg2aXZmZExURStFYnE3?=
 =?utf-8?B?U1lnc0VQRTFNdkV0MmdMUm9HeGM3THh4ZHJVRnYvd0Y2WDM5ZFhiOXFxWnBa?=
 =?utf-8?B?eGw5RUF5bUo3S2liaG5yek13dnVsNGNSY2I5VURFSnd6VUhrdTNBanVKaDRk?=
 =?utf-8?B?OHVNWTYyWTNKUEY0VmJqOTErdlZtaFN4QU9kS2VOQ09Ua3hSSGdDK0twcG00?=
 =?utf-8?B?RGg2SDRLWXJUdTZ4bVgvcy95eDBlTE9BQlZVY0FUaUdndXFqRmJpeE5SUEZI?=
 =?utf-8?B?clkyUEEzbzdUZmV3V1lDY2pYK3Bld2FvbC8xMVQzZWR5ZWxIcGZZazRBQ0Fs?=
 =?utf-8?B?UFhJUWw3ZElCOGFaSGNGbTJJOS9LbUFQc1huWjFGT1l0cjYwY0pDYVdFb2t0?=
 =?utf-8?B?ZkQ4WEMvNWxPRTZJRndjeEZNanIyM05CT2k5azR2Q1M4Y3YvS2FtdnkzeTVP?=
 =?utf-8?B?SHNNclVUck5RWEZIQklOdDBZOTlMb0VDcUZtRlgvVmNnMWlpdmxXNFBBNi94?=
 =?utf-8?B?azl4UGNNanRWM2JreGhON2cvQVcrZFlleWp2NHd5L0VuR1k2dW0yZUtoVnRZ?=
 =?utf-8?B?NEV1WS8xMzdvaWJTWlNZRHQwTXJFUDlKSUpVTlhBU1NtSGpQWUk4OWVhR3or?=
 =?utf-8?B?cExhODF5eHZYdjRHYmFTbTVKNUY5NDlYOEgzMUxmcHFxSExwVHJSejJIRGhS?=
 =?utf-8?B?OXpHam1JdTVpdFloNnpuZmUzTTRZbjJVY29NakxGUlVyOGMyNnhIN1NQM2hr?=
 =?utf-8?B?cGZaaXFYWk05ajYvV3hJM2NjWlMwRWhtdEhPVmRvTzRSY3J5OCt1N3c3MFh1?=
 =?utf-8?B?bGZJN2dmcHBvZnlBaHJNV050VFNjUjEydWFNMm01dkJsd1o2dFp3QVlvOURO?=
 =?utf-8?B?RE51THFrQ3BaNjNGMHdRbGpJOU9GSE9pTHIrL0grVENjNXJsa0R4bXFzQk9H?=
 =?utf-8?B?czFpcElVSXVUamFqclB4b2pyeVUyOTg5NXExTEJCS3FnZkczd2h2T095bXVq?=
 =?utf-8?B?eWJYbEo2YUtINXIyNFhsVFVSb0NEam1NV1I1azZlOHFkTVR5TXJnMFV3TjdE?=
 =?utf-8?B?SVU5ZXFlK29XdlJHUFdxNjZNaldtK3d1ZFN1d3p2dXc5aitIeS83ZW1CNDFQ?=
 =?utf-8?Q?oV+cJDd8kHU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzVvY0o4VndiWDYxaDNSSk5ibDNCNHczczRXVEJhWkdsUi9paUlVZ0sxUVp0?=
 =?utf-8?B?SHZlSjcyNlhkUGNpejNjQ1lYYkR4bEZOV2p4aUt5ZFhHVVRUR3p3VXRFL3d0?=
 =?utf-8?B?ZThHTlQ4bWljc3VqQ3NNVnliME1hUVFMclFuaDcwMXBHakZJSSsyZnZwbTF2?=
 =?utf-8?B?Nzk0Y1krZFo2RTJoV2dRaVF1ZU5ZODlPeUlzVHJNMU5LbU55cytPT0x6bC82?=
 =?utf-8?B?Z0xUTW5nSFUyNWswWithTTNLKzVxZy9EQ0F6UGtuVEJKaXhTUTgvcThZUnls?=
 =?utf-8?B?dUF1WWtwcFFlcFN1VnE3MnpHM0F3Rk9oNFE3ejhsdkNLNWVCOW9VWXJYdlpm?=
 =?utf-8?B?cWQxRmloWDF6dTFHOE5DL29teFZ6Tko2bTdvWFJBaWNsRGJiN2NLNENDRHp2?=
 =?utf-8?B?UnlBeEdCMzBiN213TnI0N2tpRk1sQkhkcTZNT1lITmNzajhySkwwZno1K0xY?=
 =?utf-8?B?aGg0eGdLMWFaenBVVDMrL2tTRDZmQmNqT1ZIZWkxaTR5RDdGRFNiTi9HVVZ0?=
 =?utf-8?B?TjZwZ2MrT1kyUEpwalExRkl4a3I3UkNBZDd3Q2RFZmwwazJzV3prVzNkd2V1?=
 =?utf-8?B?NUdoOW41UitpT3V3RTNqZU03cXZoSEhzRE1hdlloRHN4ZHNyNVpGOSsxRW1z?=
 =?utf-8?B?RzFoV0owOTlvd1kzSVlPNkJaVWFHdzhqT2ExOVFDRklVWUJTanlDNzhTblpV?=
 =?utf-8?B?NDdqK0xTNldJd29rMEYrUE1ocVp0ZW5uQTc4Q2tSTzBjakxLbjVBd2d3NTdP?=
 =?utf-8?B?ZVdacGgyUWRpa2duTUdGbExJbHhGZTlhVDFzSk9DMmlUZjFveUMrU0drVWFB?=
 =?utf-8?B?Y0lkbXNIcjhkSmVmR1phcThBZ2NzdHFGVHFnd1lscW12dUdyMXVrNmJCb0J3?=
 =?utf-8?B?ZzQ3c3luVGE5bEhUa2NnSzBHWUpDTW1QdHQ3YnkzeVdEenlITGlDelhRWDhL?=
 =?utf-8?B?eUxuL0hlQzdyVGpxeTErSjVyRkE1STZUVmZtT2x3eGN2b0xHejJINERXamQ5?=
 =?utf-8?B?UkUrRTY5c2JxZUhnUnZadER1aGl4NXhIeCtkUnRFRG1QMjZ2VXJJWndvTUV0?=
 =?utf-8?B?cWxTYmFNU0xGZWZYVVgvdTdtcFR5OWhWa2YrQVZ1dDRkYUdyRkpNWkZ6M01h?=
 =?utf-8?B?QU9WVG9jTnZqcWNqUXVPbm5aaU5za2IzWEdUeDNyQmI1cThNOUI2WSsrdjVI?=
 =?utf-8?B?b2RVMDRtMlVaUlBlWi9oUGF4VVB3blhKMXluNzUrck8yL0x1M29oNXhvV21E?=
 =?utf-8?B?TnMxWHhUdlYzQWliNld1a0ZtQ1hrbVNiZDVqT0diakdIb1BDRXo5TG1OYkw3?=
 =?utf-8?B?V1ZlbkVEZlJRd3FVQUJ5ZXRXTXM3RlY0REdwRkg0RjlxNWVTK3NYd2hWUDlw?=
 =?utf-8?B?Y3FrcFpoSUd4N29Ca2lzbms3RjVZMkVEak5vWFpnZHhReVlGdDNPNC82b0JR?=
 =?utf-8?B?aDdSd3k0bWp3OFZPUkNYaG1KWEdIazgweHBQR1pNeVdnWmlmQ3U5eE9PNWFM?=
 =?utf-8?B?eUprdi8wd1RNZUxuUGVnM1hjTUlkMzlzUHRMYkZ2QjF2S3QzSkkyaDQwV2kr?=
 =?utf-8?B?WFRKYVF0c3JDV3Y1WHZXeEtOeURya25VNmg5WWljTXF6K1dzaHFlRGVMVTdj?=
 =?utf-8?B?eU5tN0lZeWNXM2tpZFdJSHV3VFQySzYyUnA5UjdYeHIwM3VITFY3U1ZvZFI2?=
 =?utf-8?B?T3F0cEQwY3ljK0V1bE1oYTNibS9uQW44QTRXcnFqZmtOQld0TjN0cDBMd3hM?=
 =?utf-8?B?bndzT3pWRjZZNnUzSU9vb0FLOVAycURKSFhUeXBYYjBGcHBUWVhUdElIc2x2?=
 =?utf-8?B?U2szaitSUVJoYUVuSCtlMTlrS2dCK3dWaTVnR2JWVXU0OUJjR0l0ZzR2c2Jn?=
 =?utf-8?B?TVFDbXUvTVNGbXJHcGxSNHcwU2VQaENROTl3L1dFdHNTSjJmNXBIaU80bFlE?=
 =?utf-8?B?K1VvYmxKNS9MdmhzanIrQld4T1p0NzBzbTlSYk5tWVE3bDNucEJjd3JFb2Ns?=
 =?utf-8?B?aUFGc0JIVUNYWFdTMWhIbTI5OCtYMDNxNGl2QmJoZWxJSzJZbXpLZUhCVUlV?=
 =?utf-8?B?dnFMNys3bDQxdWtVbEJHQmJHVVJab3lKM0pldGJqV3JDdnM5YWdDajU4aFhE?=
 =?utf-8?Q?FX7sCxFMaOR8Q64naTXBO/XC4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d30f0d-006a-4764-e9fa-08dde0ae8605
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 12:30:33.6002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alxvyDdZPn4Hny8+JvZL054NjcjCz2q+Q0UZa0kjP87Mg1nU/35WXKKH8eoySUJs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5736
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

On 04.08.25 14:24, Christian König wrote:
> On 22.07.25 14:36, Thomas Hellström wrote:
>> Hi, Christian,
>>
>> On Wed, 2025-07-16 at 18:04 +0200, Christian König wrote:
>>> Hi guys,
>>>
>>> so I hope Thomas is back from vacation while I will be on vacation
>>> for
>>> the next two weeks.
>>>
>>> Here is the patch set which cleans up TTM and XE in preperation of
>>> switching to drm_exec.
>>>
>>> Please take a look and let me know what you think about it.
>>
>> I'll take a look.
>> BTW Did you see my comments on patch 6/6 on v1, essentially I think
>> both i915 and xe rejecting some TTM callbacks if the object is a zombie
>> (the GEM refcount has reached 0).
> 
> Sorry for the delay I'm just back from vacation.
> 
> I have seen that XE and i915 is checking the GEM refcount, but I haven't seen your comment on that.
> 
> Going to take a look ASAP.

I'm not able to find that mail.

All I've seen is your comment on the VMWGFX stuff and that was already resolved by Zack.

What are you referring to?

Thanks,
Christian.

> 
> Regards,
> Christian.
> 
>>
>> Thanks,
>> Thomas
>>
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>
> 

