Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED112A99C0D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 01:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF9D10E43D;
	Wed, 23 Apr 2025 23:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="j/UIBfcF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9CF10E43D;
 Wed, 23 Apr 2025 23:30:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tq+GsJzWg7SMLTAclSwuceZ5PdYe0Ku8tej6746KO9EPGvbBPhfQx4HV6QneWI8hfFjlFm5LKL2oSUjgB5uZ53SDpEo046oanflE4joY6QnNDLdJEKmmae0unQ/EYi0bjc/wu08XCCIg+Cef/N6RZWBnlOf0lLi8NxbEbVqVhc46xspC20pIiE/2MbS1rO+E/IE3CnYWFJ6oFihYYrC9zQWsDRpuDsn8Ww/VSK4un4kyjxoTzEbIKz/iSYlVIIzbMAyRlUI5ggLp7O25sZKT3nMCKknDvj9SIP25ZljM2pNeAB/mw1V0g71OgGKiunqqkjIZAVeYCwuUFl0HQSK+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USMPcIse++J28pVu6uqexSc6bs1xJ0Eqy4KJAaR+Jkk=;
 b=ni0t6D57yIU+bbVoZ2/1EvdKjWzsFPTCAzfjmBhW2v88yIBDBrZgzSsd+5h5a/LorSEwaCcmOgMewTfvNYZXN4f1vrKwjOi+78NySJKfFkWbB2YEv26RYv8x5rsOBofQcLl8VjoXWg/mKjlrd8C0tttbmU+b4CrnbVFTzdkYfm1t6XuAx6dpFL9ACE5iJzAQ3toCdYV6fhBlXAZ8JEzytseBSYXSgnT71IBwGNtYAyHsF0G9r+UhF/SHsGLEABLFXoYB3E1rhF43KiM6PNMVBKpxn4ayR3Cn7Q0QfVx87DNAIq79WepbpJjaFr36h1N5HYgyQ174aU41wNErYv4Pdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USMPcIse++J28pVu6uqexSc6bs1xJ0Eqy4KJAaR+Jkk=;
 b=j/UIBfcFZ0FhoO7pksAYZZXNG8FYgl9iZiHY4U0acu64jc4IYf5Ee2QpOXRo/a/AH0AF7guCc3+JLs6xQK7phlKSTDSpH0BSv05Uy95xGnbUCbpO71c/LFbAKIiO6ruM2FBZ0JFQDQAujg2Wq//mxGV+5hjyz6cmUTLiuA2iViTidUfboLaSmUUt6d6T0GwR3AYBuuqM2R/0bBjaM6S2EBBpLAz7WAWG270gELixC5QhSHz8d0v9sWJD4iJQ703BfXOP9uRrY6vzs+sK3LIa0ceTCxkeLmq3jJaEcq08pJDtEj+YR4isTOjXt/PLRcXaZikZpacjNHXctmoQMBQonw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA1PR12MB5613.namprd12.prod.outlook.com (2603:10b6:806:22b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 23:30:41 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 23:30:41 +0000
Message-ID: <e98eca0d-f195-41de-89d9-d169c28d1a6a@nvidia.com>
Date: Wed, 23 Apr 2025 19:30:38 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] nova-core: docs: Document vbios layout
To: Timur Tabi <ttabi@nvidia.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "airlied@gmail.com"
 <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>
Cc: Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Ben Skeggs <bskeggs@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
References: <20250423225405.139613-1-joelagnelf@nvidia.com>
 <20250423225405.139613-4-joelagnelf@nvidia.com>
 <74c540b50d9c9fa70689ef0f4451a126265d1715.camel@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <74c540b50d9c9fa70689ef0f4451a126265d1715.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR01CA0015.prod.exchangelabs.com (2603:10b6:208:71::28)
 To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA1PR12MB5613:EE_
X-MS-Office365-Filtering-Correlation-Id: a6cb8dbb-bb1b-442f-0d79-08dd82bedc8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2Q4VWl6Q1V2dVZ4N0o2UXFlVm9NNHZlc3h1SFJvYnEvenNUSDhFZy9mOWhi?=
 =?utf-8?B?U3lZdmNlZ2pNbCtVbjRFYXkzaDZucHNUTmMrbjhWTVFFUFlydjNMZkEvYnl5?=
 =?utf-8?B?R2pHNUhZTmQ4M0RLbnhsUGw5NG85b25MZCtyMWgvV2JkNDVuQUFwb01LcnMy?=
 =?utf-8?B?SVBIdnUwRC9tbjUrZk0wU21NekJiK1JkY0kwaWV3eUZQNDc0dmw2TkZBQURL?=
 =?utf-8?B?dVhNTUo3SlA1dXJaNGVES2xKTWFkKzcwVHFZMEo5RHZpMnliRzBjSERwYnRU?=
 =?utf-8?B?eWxmRmFVSFpZdFpxTWNSSmZTcDlyVjhFQWIyRlFsb0trTTk0RVFnQS9Hckov?=
 =?utf-8?B?Um5DWVl5RHdpeWpNV3lMeEZxeVZyY3dmT2VCWmVnallXYjJHUGMzWkprWEtH?=
 =?utf-8?B?dm54VnNjVHVHSFY3MjJxaVVFZlhrR1ZWRGdPYlU1ZXhTaXhxNEcwQXNnZ1Vp?=
 =?utf-8?B?bVAvZlRETEFsZ2xRM2JiSHQ4aGpJL0Q4U1R0L2kxOElZaWVPdFJTMC9wMnph?=
 =?utf-8?B?YnRiZDMzQ0JNZFdMaldrTC90cHBSeUp4UEQ4dEM4MDU2QXpCbDNLVkRnNnI3?=
 =?utf-8?B?c1RVVU9HZ0VMRHNCT0I5L2pMK0ZoYUsrdXNOQkZBNmJsZHl0SmkrRU9zTlJk?=
 =?utf-8?B?a3RjZld3RGV6ZDYxQXQ4MjBRd1JtY3VXc3JiNWVNNDA3YkJwWEEwdmdhY3ZT?=
 =?utf-8?B?eHlIRUNxNnZDMnQyNE5Fak9vVlVWY3h5ZVBidWwyME95bExUblAvQi9KbzE1?=
 =?utf-8?B?M3FJZWY4V2NVWTEvektMNVYxaW51YjlINHRuTFV3OFE0TlJiUjFTaTU2SUpj?=
 =?utf-8?B?elAvaE9KdlRJQVpXN0tQeC9yaWJKZUNPQlN3aXljQVBLSUo3MWp5N1l5aXRJ?=
 =?utf-8?B?MXF3T1BQOUNKbE5vTHRyVDBWcWs3Y3J1NGI4czdESGF4SUFYSEtGQ0VrOWwy?=
 =?utf-8?B?MDJVTFF1SnZKSVMwVVNidm5PeXg2OUdnVGFYNzlYRFk5dVB2OXBUbE9FcEky?=
 =?utf-8?B?N2JhK3JESXk1aCtMM2o2TG82N2llTmdpUEs1VTRLclpYYVRMN055blZLNzJ6?=
 =?utf-8?B?SGpBZGY1dFJ4QzJnWnpXRmo0cktxRnh2MUtEL3hac3VQc0dwMFJjNnMzTHZM?=
 =?utf-8?B?SWZOeVVlbGY4UjR3eldoVHlTZTZhQm9GaWRSSS9kaCs1WC9hUndDMXJ2L1ZR?=
 =?utf-8?B?V0xsT2hMSzg0a05SM2V5eS9qRlk5eDVKdXNRTkcxclJZYU9KWmZ5Z1FsT3d4?=
 =?utf-8?B?dy9hNlFzNERKdlB2UlZrVElzeHdqQ3I5R1crYmtTMDVOanYwRjdvaDVjUlVm?=
 =?utf-8?B?a01zUEtaUVhCR2lnblBHbU1YK0ozenRxYU5CSUNqT1MvRWFmUjIzY21rYVFx?=
 =?utf-8?B?N1RUbFlQMkRLV3lFVGxXdkJDSTczZWF0THNWaUdJTmkybmt1ZUlxeVBTOUNx?=
 =?utf-8?B?dzBHVFo0NklUdlVOOVRyQ1lWbUE5T2xTTjJpeXJOdVRtL3QyWWdteGwxMENu?=
 =?utf-8?B?eE1PTzkyR1BLTlEvN2JkSDlFN3JHZHl2c1pKQzU1SEJkSitzcFU2MC8wR0xQ?=
 =?utf-8?B?TzZVaXhYMTVPTDJvTy9HN2U1RWNTdnRWSHlpSjUrNUk3L1V3NHVSMUV0Q0lt?=
 =?utf-8?B?OElrNW5PaXlvWG05bTlabEhNdUNMV1VHVDFBajNwZUc3bjlLMUJOQWdTOWhv?=
 =?utf-8?B?UklQYUQ1U2sva1RaZm1XakhKUGZ4MjU5Z2IrM2pMdHczNEpHSEJpc1VZT09X?=
 =?utf-8?B?VFYrK1lYWHpvZjJnUDk1cDhZWnVBTGJxY01GK3Nyc2VPd3ZySjBWZHhsNC92?=
 =?utf-8?B?ODZEcnp4bTM5U1JuN2oyRW1HRGFXUjBNRmtJeUw0VmJ6VlJDTVJMK3Rva3Fj?=
 =?utf-8?B?cEI4N1NJM3NHV01VR0lBTm0wVnkrTStZSjIrTkRQNFM2dnlCemd6N3NOYzQw?=
 =?utf-8?Q?J5uWlmD7YT0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2orTDd3RmxUTW1ES0ZsNzFGM1hsL3VncjhXc0RIMVRFSlVqN293NHdyR0FQ?=
 =?utf-8?B?UWZIT0hhRUUyQTFFNGduYWl0Q0VmaVRxNFhwNGp0bHl4OXpPREQ2UnBDbDl4?=
 =?utf-8?B?cGRVQi9iQjkyd2tVY0dsNWJ3cmZEYlY3SWdVTGhLQlM0Y21KUDdUaE9Fbitw?=
 =?utf-8?B?V01tVlJhaUVzWXhNVm1BWEx0ek9ZUDlsNG9oNWZRMldRWGxyb1B3ZUlCUVhU?=
 =?utf-8?B?VFhleHN1b0tmdjg2eUJNMEZqRCtZL2VDbmFjQzBKc2lPS21GdUdWTy8xZEli?=
 =?utf-8?B?STdOUVhWTzU2OGNXcmhxUldQVkhoUmdkb3RDblhFSE5pNmU2SHBHVEdaTkxU?=
 =?utf-8?B?SEI3YUZiZS9ub3NjTDIrSnV0emwweVFkYzBQUFl1UURwRVJoOWo4RlZ0VHhB?=
 =?utf-8?B?YXV3R1d3SGZqYlBpS01JOXozeEVHbk54Q0VtVDhKVHZhNHlpR3BMRmZqQ3pF?=
 =?utf-8?B?WGQ2RFpTOFNiMW4vRFYvN3lGQ2FicGZqRmZtc3pGL1VWYkJUYTJvSGx0RS8r?=
 =?utf-8?B?bXdLQXZpNWYwRDN3aGlqRzFSeUtXb1FyRXpGTEs5Zlo5Q2wzNkRnVlFsZEdx?=
 =?utf-8?B?MFRud1FhQnlDNENuUFRqR1dBUTViWTQzNmZwckNrdDIzdnBnMUVHZ3ArYUMr?=
 =?utf-8?B?SXAwM3dqbG1kanZKTVEraUFQZW5WaHN1a0FSbjVlcWxhQ1kyNDdsam1SUkU2?=
 =?utf-8?B?ZnYzRzQwL0tnV2lRUGtmSFZXd2dTUUhRMlBpa2REYk1vTHN5MlV6bzNpNUk5?=
 =?utf-8?B?QlVVVXdvZytQV282YkFMK1JYQTFOcDA3QTFFamFWSFN4WXNqakdWdGYxcGFW?=
 =?utf-8?B?dFpXUitjUXNHQk80T1E1Vk5nS3YrV2tuTi9KVUN5ck1nZkJaWGhwejMvN3Ur?=
 =?utf-8?B?Qm5BU2F0Q2JvWlhhVFNJRUxJREJhcmFOWG00NXVsajRMS1NlbGpWZVk5UU9i?=
 =?utf-8?B?bXo0R0ZtWENmRDROWmFKaGpnTFNUbGhLSXJRWHd3dklhcmszcFliTFRicThD?=
 =?utf-8?B?Q3dVNkgzUEdId0RvNUlxMHJNeDdJMnByNUpxeGMyZ3NYNGpldS9KcWt1Wmtv?=
 =?utf-8?B?UmlvL2VLU2xUbm9QMUMyb1Mza1JSdnFYSmt1d2MyM3hsVUxERUhRRzZxOWdS?=
 =?utf-8?B?TGhTdHJZRVRRWWZmemF0dUFWT05CSDZpTUsrSG1TVlJYa1h4ZFJ2N2xHa2ZZ?=
 =?utf-8?B?SVpRR3RKVWo3YW1tcERFdERWalJUNUs2c2Uva3o1cnUvaU9GVHZkSGRHTmcw?=
 =?utf-8?B?V2QyWGVHWWRKVnQzSWtnOVp5a1czdkJxOTYyVnZXSG5jRHBpSHBUdHYwRjFC?=
 =?utf-8?B?Q2ErS0NzNkRzaTEyL2NCeTQ5QzZXdmxIMXpqSTZlZm1TaFRZRTZKbDFvcDAw?=
 =?utf-8?B?dWN5dXdmWTN2dDF5K0FkNEUzN0dEUnRtT2pFSEUrZGlndUFlRElSVGpMVEo2?=
 =?utf-8?B?d2N2KzhhMDVJL1Jtc2VuSk12SnJmWTdRbC9RS0dXUUFIYkRoWkhSOE41ckJk?=
 =?utf-8?B?ajVoQmZSdFpDdkhDQWRHZkJaa3VZR2ZLR015bEFvY3NOYmQyK0pkVWc4RUdj?=
 =?utf-8?B?K1BQcHM1OWxHb3VFeXV1b3J1WUtneTdZWEh2UXhIQU5kMlNEaVNKOHQ1MlVx?=
 =?utf-8?B?VzhoTXpKMlhUMjFhUzhrZ2tOa2pHbVhFa3F2bGZhdHJWcTlKdlM3MVVWdFp6?=
 =?utf-8?B?K2lCVlo5WHNUUm9qNktQVEhxeVUrbUk1aTNPK0Q2cnJORmlPNGw5aTlRYldv?=
 =?utf-8?B?cWJpV2hZbnoxWTFTSkN3RFkyWGF6a0RxVDMzYnc1a0FIc0xpUG5VbjBmenZH?=
 =?utf-8?B?QjJNc3I1Mmh1OTdNZ0tqdjBiZklGT1prMXg1eTRXL0V3bWkxMWRnN1lUTlBU?=
 =?utf-8?B?MHMxM01xY2drRC82MGc2Q3N0YktMdG1ZZUJKc2hnR3FpMHdZd2puSzRuRTQv?=
 =?utf-8?B?RFQ4RUJ3UEd5NjB3eFJWNE5YY05Tb1A0MkpSN01pczZUclYyV2dmemNUUmxS?=
 =?utf-8?B?aGd3YUNTdGpCTExxQ0UwSm5uK2MvYkIxRVc0OVRVMGo3ckFKUTFjM2hTOXIv?=
 =?utf-8?B?Y0NHM3ZRM3M5T28zQUlJQTUzMmVpcEVkWTZtenNFcDhrNEpvKzBuTFozZHRH?=
 =?utf-8?Q?h32vLZyVhaEQ1Ot1lQW1019Pi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6cb8dbb-bb1b-442f-0d79-08dd82bedc8a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 23:30:41.3699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVxtQf9/piC/QgxPXIsHsWbi3MSap47sbKZf9Y5j8917VFcPw8UR+t9n8LezCyvR7pMUFVBAG/yyQuzrutr4Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5613
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



On 4/23/2025 7:12 PM, Timur Tabi wrote:
> On Wed, 2025-04-23 at 18:53 -0400, Joel Fernandes wrote:
>> +This document describes the layout of the VBIOS image which is a series of concatenated
>> +images in the ROM of the GPU. The VBIOS is mirrored onto the BAR 0 space and is read
>> +by both Boot ROM firmware (also known as IFR or init-from-rom firmware) on the GPU to
>> +boot strap various microcontrollers (PMU, SEC, GSP) with critical initialization before
>> +the driver loads, as well as by the nova-core driver in the kernel to boot the GSP.
> 
> You might want to add a link to this page:
> 
> https://download.nvidia.com/open-gpu-doc/BIOS-Information-Table/1/BIOS-Information-Table.html

Good idea, will do!

 - Joel
