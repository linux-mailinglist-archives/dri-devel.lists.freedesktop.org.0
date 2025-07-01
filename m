Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6A4AEF12D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDE510E52E;
	Tue,  1 Jul 2025 08:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xlB3Dp8C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D7A10E52D;
 Tue,  1 Jul 2025 08:32:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iuu54nyqrPVqL8lxtjbqd4SrLdRD5u15PUO2iigSBFpj3Pf+3iVFYw4cVz6R6J6NFNftqtEGk0d0veRrnFQ/GHv/08CkPvieIfD8V5t9HoIYeiSwccHLw5lKbKR/lAVNr3KwK95JZvvLG7bhe40FzYII2L5oyCnlsJsl9jDxivSezL0U1ejGO5wrgSI7DnwkzaliTTGLR20RWcf3hCNoTVFrii+kk0LZpvupyZEqFCKEt/Ah1/hjkk4vMgK/qEZj8QzmVG2uzywzRuVFa9MixrZNlaMNkSKhWHTNtuGinjJD7ThFmU3LU0J/hvX4RX/OmF64BUQ6HxcktoJBTr1ytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ph1kp2gmIVBr5cUGa228IWTaFdXefZGk1BXBx/n0x9s=;
 b=K+9H6zjcLugi2+alHFnRI13XN1yrFPCiwLi5tXS4rvHXVM8TFF9V061b/o5zhRG4BiUtJe7/TPDtClu1eADNEO/vRiDhcZQ0LZDFPSHoQSrNUbXZNERfpjWMiFJXz4/h3sT8hyGMzO9Dj7gEdVh8jqT+I+vzYwLUoQZnpg7C06InQseXBoLwGYzQ+N3D2hAwgaxBclugUOz0ZcO6hIyZ/1PNgKzhhfEszh0Bg66zg9ZCR1olL3GCjS6XJrashlzTkHvgcSJJkw2SNQjYdNH54flp/FVK27Nz/3bu1BB3AxgiEYIv/SSmaNh2kPmAHjTYGXdMi58Kk8Mq8vy63v+FXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ph1kp2gmIVBr5cUGa228IWTaFdXefZGk1BXBx/n0x9s=;
 b=xlB3Dp8CRd5O+YB5VJaX6EriXp3VaIRvr5BF8iLXFaOU8Xf7f0R/9RLwMeklNgTKNQkIMQ+5qkm7yAuMsS1d+8SZs7W0VXme6p8yiA0zuEzL+1Xx1lpZr0Ye436dCreH4i0vqfEdHqkNYn047w47BPCf2+fGPT3HhhwovOycetM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN6PR12MB8543.namprd12.prod.outlook.com (2603:10b6:208:47b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Tue, 1 Jul
 2025 08:32:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 08:32:42 +0000
Message-ID: <019a15d5-142f-4761-9408-58c103d3922b@amd.com>
Date: Tue, 1 Jul 2025 10:32:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amdgpu: skip kfd resume_process for
 dev_pm_ops.thaw()
To: "Zhang, GuoQing (Sam)" <GuoQing.Zhang@amd.com>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "pavel@kernel.org" <pavel@kernel.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>
Cc: "Zhao, Victor" <Victor.Zhao@amd.com>, "Chang, HaiJun"
 <HaiJun.Chang@amd.com>, "Ma, Qing (Mark)" <Qing.Ma@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
 <20250630104116.3050306-4-guoqing.zhang@amd.com>
 <8806781b-90d1-4b99-a798-dd1d29d4c8c0@amd.com>
 <8eb1700d-4d60-4a1e-9d09-718f65baaf1e@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <8eb1700d-4d60-4a1e-9d09-718f65baaf1e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:52c::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN6PR12MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: 6783223f-8b6a-4566-8c65-08ddb879d87a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|921020|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODhnUzNJZjd1cDVRWFJiZ3lQU0pNcFU1c29YWnczSEZIVWF2OVV5aVRPdmtE?=
 =?utf-8?B?S2szNnV4eHN5R3VzTlBNMCt1NG1LY1p4NlZkZkZZR0pXMmk5bTBIY3ZRbmZv?=
 =?utf-8?B?ZitiRlVDWDFGZGJvR3FIVVdWa1hqclNHb29adGREMlhwZEYvWmJnQTVFN1NO?=
 =?utf-8?B?QXpRbjB5T1cyUEp0Z1dERmN2Q2M0UEZJS2xLTFhsQXhlNjQ0UjVjYmprN2NE?=
 =?utf-8?B?c3EzZkN3NCtDNHhjK25BRkhzamxTSktzbFpKQzJRTk5zNllOb01ac1A5Uk00?=
 =?utf-8?B?Umc2L2FFMlN0YW5wbGQ1S0d6NzRlTnZNM0lDZ2ozMUdxYmlpNVF3VUtldzN1?=
 =?utf-8?B?NDZPeG1PMUhFcDN1NjhCQXpSTDY0QnhVelpUeFNsRm9BUHRaV0Y5bmJEa3hz?=
 =?utf-8?B?b0p2MFMyK3R4cHdBbHFWOE5kRTdjeisrb09vUlhvMTcxcjNueCtGaFNUa1JP?=
 =?utf-8?B?R1c4cUlCb0xBSjErTGQyVlVJQlV0WXZjblRmTmRYWlV6cG40VTdsS0YxSEIr?=
 =?utf-8?B?bXFJS1lLa3dRSGtmZzlYbjBSVHZjOHNQM3JOSmtkaklnazRycVd6V3NncFpY?=
 =?utf-8?B?SVp4RWF4T3R1OUpVSExSYlY2Y3dJc25xRFBCMlhSVnFZTXNEOHhxdWs5SXhq?=
 =?utf-8?B?RGRhSzNmV1U0T1FqQUtTT2FTVVNVT2ZmTjBRRzVjanhrZ1ZocWJQeHBEdTZz?=
 =?utf-8?B?MU9ONVVJZGN1Yit5aE9VckdqMTNPZHhBeko4Zm5MeEphdVoxQTl3M1huWFZN?=
 =?utf-8?B?MWtGOXhseElHWDN5WWZ2WDVTTDhLcmVFUEoxUlVlQkJ3bXpBT1JiN3NiR1VP?=
 =?utf-8?B?TnNLU1NQanBOaU9pUmx2WXF2ZTNwLzdBMzZybTMzaHNpT2JXYnNUT1M4SkZJ?=
 =?utf-8?B?YUsxeHBuTE1zOVBOcDltZFI4b0U0SXFLUVBiRW8vY3I0SHpLTjVMVlJGUEJx?=
 =?utf-8?B?ejk0aTNIN1FKaWJsN2xDTGhCMmpuUHFoS3JUNlZaVXFBNnR4ZlRHM1dVMlNZ?=
 =?utf-8?B?TW1odmk3RGZRdkxUK0d1aWRRU05rUE1EbUtGcUdvREdnUlhKdmxQbDN3STFr?=
 =?utf-8?B?Zk5sR2xobjZQVEZ0azBGdmVlbHJSanFjYnN6bDNkZzhBekFhM3hnZlJYYWJ2?=
 =?utf-8?B?cDFZRm5mRWNoOWY0ZjdmV05yc2lzUzRzT3Z0aFZrdDB4TUVMQ1J6Zmt4QjRm?=
 =?utf-8?B?S3dKQ2F1VjE4N0RqWjhrVVBIb1h3WEo3Y1Mrdy85M0JuTHcwU0ZDeTU3Y1U4?=
 =?utf-8?B?TUg0Q2VJU3VKcTNaeW84UnVpL2JhOVFkZVRGMFlRck1taDhsWEppbGtWSzQ1?=
 =?utf-8?B?bkpNeXVZYzl4SlBzY0JxTlUyQXI1VGpRTHdpWHZqUk9TQkpqYnc3OXhDK2ov?=
 =?utf-8?B?blNIdEJzL3dTekJnQ0dYZ3gvYzlHaTIyNGNmK0RnZ3NGZS9HeTY3OXFwcFBM?=
 =?utf-8?B?RXd1VE5nYUVTY3BqZzBtWFQ1bVN2c040N3hZS2RIS3NDWVBmRDhRNGMrODZu?=
 =?utf-8?B?WUNkZC91ZEZnNHhpVFdKTU11WWhhcjFPVVQwRUNrOVFZVEp5amtHaUppdU5M?=
 =?utf-8?B?cmNzVUpOMWE2SkF4UjVSL2dUUWthcWNlVGswSzJCVEo0cExPN3Bmbm9mWFlS?=
 =?utf-8?B?cVQ4d205ZVE4TktHVkpCMFpDa3JyV2wwQWNGVXdxaTloN1FCNmRlMjlCMmpY?=
 =?utf-8?B?TzVMbDIvelhMMWwrVDNHdUx0dVNXMVRsb1NMVkdacEY3ZHVjOWVvVjRKc1JU?=
 =?utf-8?B?aSsrM3piUTZvbXhoM1dVdzlRTzd4UTBRblQ4bnVvNERjZ0JDU29lb3dEZGpX?=
 =?utf-8?B?UUN4OWZOWCs0aE1QdmI5emFjRTQwalYzTG9uc1ZESmU2N1hGZVBIZW9kT2lF?=
 =?utf-8?B?Nmtya0wvOHl5RWdpTllDVVRGL1FlYjBCTXVSaGcwR05KY3dNMmltcFRESVJt?=
 =?utf-8?Q?9EHESUFetBc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(921020)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVFZcDYzcnJsMkNNUy91ajZaTXZoWVlTUWJ2cWFnMmZjQTM1ek9yQVBPK09Q?=
 =?utf-8?B?bThNM0ROeUZIK2xYeVl1M0NRbVpONG9KN09OUDNtMDhxbmpEME81TmxyQUtZ?=
 =?utf-8?B?eUZUeUxnVzFmaW5HVzJwKzMvbHdQZTcrSzk1Skw0dEE1UnRmWGVHOXQzbU00?=
 =?utf-8?B?OThuRkhZUnd0aWI3OHYzMFZZZjE0aGQ2NTZNby9yV01IdmY0M3k2TGJROGly?=
 =?utf-8?B?UlpVZXFBYTUrTWY4eDlGQXJIU2JpK1FLdFBMQWZNLzljTngrS2lZYU13Rk44?=
 =?utf-8?B?SkF1YjRVbDRqd0IrRng0cVNGc1FMSE9CQnBINktQTmo3cklCbUFGLzZXcHdn?=
 =?utf-8?B?djRrZ0VUamJRcnpvMVNKU1VWbmJZNEprc1cxVWNjdUZWRGFmT2piaEZKNytI?=
 =?utf-8?B?aFRLQVhuSFhjZnIyZW5RdjdCSldrTmtwOVhsNlB0Z3BQekF2elp1MnVtUlNy?=
 =?utf-8?B?RldyMWNWc3A2Snd0VGRaUDkyR0dPbkFRTkw3VEhCK0FZUnFLbDNSL1hESmNj?=
 =?utf-8?B?amdleURZV1VLcGw1QVpDVVAyOVJZSDFLaVU2UmllT2tPWGd2bnl3TElIOGlF?=
 =?utf-8?B?eVdEeWF3YWN6eGZJaHJvZ09NNzFQRi8xOVYzQkxXMlpqR0VvWVBPR01aaU82?=
 =?utf-8?B?KzBMN3ZXaGZ3TlYwaHp6Zi9xNCt3RmFha1hrTnl3bUh6a1RyTkQxbnRRdllW?=
 =?utf-8?B?SFhNOWZXd1AxT3U0SDZzTDBOSmdFZ0VMbHQ1REt6SVlFYlJBeThPOXkxdGtq?=
 =?utf-8?B?eXBDSW9iMEhORzFoQnBFSmk1Wlk3REI3Szd3d0FuUXgzdkhnSXlobEEwT2Jx?=
 =?utf-8?B?VmR0WjhDWWd2elRpYXZmWXRSUlFsTUFqMERIWmlySkR6UmlVemVWSDQ0cDQ5?=
 =?utf-8?B?SlNoYTg3UkhRMkJ6Rk8zVEJabGxKQk5nUDc4bm4yUEdDSWRJcEZ4cVFPOXVw?=
 =?utf-8?B?b2Q3QlNkOExUekpPTnFGdE5RR2JqRWxWNktObVMrUkNYQVcyZ1M0OFZnMkRE?=
 =?utf-8?B?eVRWWXJMSzNockI3dXR6TTFEWHI0cEV3MG1SSC9mNzFmbG9pVnpRcGZSZkRi?=
 =?utf-8?B?azE2bzdHVGt0U0k3S3FDcmtDcVpTcEludURGV1kzV3lYRFZtd2I2ZERQTmRn?=
 =?utf-8?B?WVlEbVpONVdZSnlyVnVMNjhCVEpMRlZTNTV0NzBaemVtUFRQQ1d3SHcyYWRY?=
 =?utf-8?B?WXkzRGdSekd2WGpRVVZ1NFBudzhyZTZKRzZjWHYzMjZ2ME92OFZxRXZNSENK?=
 =?utf-8?B?RGRMZWNUbFJMYVErMWNUdXlHaEE3L0xGTXUraDNxbUF4YjQyRUoxNDUybFJ3?=
 =?utf-8?B?cTBPRWVNMm9Dd3cwc2JxUkpMeXM4MmNFbmtWWDNlL1JBN1U1NXVmTEhzVEVm?=
 =?utf-8?B?Y0doMi9weTJoRmptWEtBaFBxSHRtSk9iZFR1T2NZbnhnWG9IVVV4eEkrVGxZ?=
 =?utf-8?B?SzlFZkIzQ09XNUlWMDVET2ppSXQySzNlTmpRNEhVMVNmMnEvVFdHQlVnVzIv?=
 =?utf-8?B?YWlPSFA0QnRUeFVraUZHT1l4TUh5UEpLOFpCT01UWXdJWWNTMldka3NsclZq?=
 =?utf-8?B?Q1JwTkhWZmdJclhxTmlJbElXY05xRGFmR01icDhzTTZLMzlYRHBmZUtBQmkr?=
 =?utf-8?B?enFadE14cGtOL0JwYnI4cXdYQWxwL1hiRWVNQUtvNnRQUnhKaFc4OER3MENZ?=
 =?utf-8?B?N3oreGRHMGlJRUZZM1lLQk1HQ1RDb0hXY2FCQm4vbnBLUXI2b0ZGM05ySmtw?=
 =?utf-8?B?M2prSnplemtNajdTRUhKMFJGK0NRcU9CWFQwckRzTU1XSEx2ZWhpUFFsUHpH?=
 =?utf-8?B?SGswbUJWbVI1MUxRckdpeG1tOVlqV3lCbkRZUTdFTzcxQjZRZEsyOWM1T1Er?=
 =?utf-8?B?T256ZDNMQ3VlRldRUVBjcnVxSUl4TEhSc3I1OTBPTjVDNTVHU2t3NTRqaTZ3?=
 =?utf-8?B?S2ZsSjhiVSs4bnRyNWZ2cWRpMC9GOXV5OEFDdDRXQzhNeTJWY1llZFp1V2JI?=
 =?utf-8?B?N2hZTDZuYlJuWER4WWhHTW43UXlCYk5EalI4MXZya290NnpPSzdIa3FVUmh4?=
 =?utf-8?B?V2tjQURoa0FFQzM2ZlMyMXVHWXF1cUpLVTJ4T3k2UXIvUDZXbXp5bUFqaEN0?=
 =?utf-8?Q?Imm66+muaEJspuoU2IZalipPW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6783223f-8b6a-4566-8c65-08ddb879d87a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 08:32:42.0442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csfcrAiAhua7J0ncGPpaBGRZCMfYLT7w14vNSD7ZfC2Z41hGCW4NKN+rCRz3M0o5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8543
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

On 01.07.25 10:03, Zhang, GuoQing (Sam) wrote:
> 
> thaw() is called before writing the hiberation image to swap disk. See
> the doc here.
> https://github.com/torvalds/linux/blob/v6.14/Documentation/driver-api/pm/devices.rst?plain=1#L552 <https://github.com/torvalds/linux/blob/v6.14/Documentation/driver-api/pm/devices.rst?plain=1#L552>
> 
> And amdgpu implemented thaw() callback by calling amdgpu_device_resume().
> https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c#L2572 <https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c#L2572>
> 
> This patch is skip amdgpu_amdkfd_resume_process() call in thaw() during
> hibernation. it is not skipped in restore() during resume from
> hibernation when system boot again.
> 
> 
> I just found the following kernel doc. Thaw() is intended to resume the
> storage device for saving the hibernation image.

Ah, that makes much more sense.

> Our GPU is not involved
> in it, it is not necessary to resume our GPU in thaw().
> https://github.com/torvalds/linux/blob/v6.14/Documentation/power/pci.rst?plain=1#L588 <https://github.com/torvalds/linux/blob/v6.14/Documentation/power/pci.rst?plain=1#L588>
> 
> So another implementation is to remove the amdgpu_device_resume() call
> in amdgpu_pmops_thaw(), and skip amdgpu_device_ip_suspend() call in
> amdgpu_pci_shutdown()for hibernation.
> Initial tests show it's working fine for hibernation successful case.
> Should I switch to this implementation?

No idea. Alex and the KFD guys need to take a look at that.

> But thaw() is also called to restore the GPU when hibernation is aborted
> due to some error in hibernation image creation stage. In this case,
> amdgpu_device_resume() is needed in thaw().
> 
> So I need a method to check if hibernation is aborted or not to
> conditionally skip amdgpu_device_resume() in thaw(). Currently I don't
> know how to do this.

Yeah that approach here looks fishy to me, but I don't know how to properly fix it either.

@Alex any idea?

Regards,
Christian.

> 
> 
> Regards
> Sam
> 
> 
> On 2025/6/30 19:58, Christian König wrote:
>> On 30.06.25 12:41, Samuel Zhang wrote:
>>> The hibernation successful workflow:
>>> - prepare: evict VRAM and swapout GTT BOs
>>> - freeze
>>> - create the hibernation image in system memory
>>> - thaw: swapin and restore BOs
>> Why should a thaw happen here in between?
>>
>>> - complete
>>> - write hibernation image to disk
>>> - amdgpu_pci_shutdown
>>> - goto S5, turn off the system.
>>>
>>> During prepare stage of hibernation, VRAM and GTT BOs will be swapout to
>>> shmem. Then in thaw stage, all BOs will be swapin and restored.
>> That's not correct. This is done by the application starting again and not during thaw.
>>
>>> On server with 192GB VRAM * 8 dGPUs and 1.7TB system memory,
>>> the swapin and restore BOs takes too long (50 minutes) and it is not
>>> necessary since the follow-up stages does not use GPU.
>>>
>>> This patch is to skip BOs restore during thaw to reduce the hibernation
>>> time.
>> As far as I can see that doesn't make sense. The KFD processes need to be resumed here and that can't be skipped.
>>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 2 ++
>>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index a8f4697deb1b..b550d07190a2 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -5328,7 +5328,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>>>               amdgpu_virt_init_data_exchange(adev);
>>>               amdgpu_virt_release_full_gpu(adev, true);
>>>   
>>> -            if (!adev->in_s0ix && !r && !adev->in_runpm)
>>> +            if (!adev->in_s0ix && !r && !adev->in_runpm && !adev->in_s4)
>>>                       r = amdgpu_amdkfd_resume_process(adev);
>>>       }
>>>   
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> index 571b70da4562..23b76e8ac2fd 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -2734,7 +2734,9 @@ static int amdgpu_pmops_poweroff(struct device *dev)
>>>   static int amdgpu_pmops_restore(struct device *dev)
>>>   {
>>>       struct drm_device *drm_dev = dev_get_drvdata(dev);
>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>   
>>> +    adev->in_s4 = false;
>>>       return amdgpu_device_resume(drm_dev, true);
>>>   }
>>>   
> 

