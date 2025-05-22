Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1402FAC0F40
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 17:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37CC10E937;
	Thu, 22 May 2025 15:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ok3bcYAY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2041.outbound.protection.outlook.com [40.107.96.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8235610E88C;
 Thu, 22 May 2025 15:01:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLaUUpSHKXA2f0eQcyGGS4MOd00Ol8wCh3++R0I3OeWbs0WUHVygNupJqMQ4p3USicuAxFlWzKqRF2sQTTsN/bqZ1BnxflV3p+d5Fttd5EAH0Vq4G4XFdg1yq3GNKC72JqdRF69j+IqrFkoqyejtsIIPOU5Q4oOtbxreeL/AtEzjnijq9H9DOyigQj5c5tFbm+q3MZSmpwwaNyuGlAzpejzL3Bs5GaSXA4+ntKoXH20CXxg671oRjX6e8d7seEF2j0bzr7f8ACB+eIzwhWduaSs7/vD3XzKQY64qXdzeK/xlbfjTCeTNDBlzroxIV6v47jAA3UBPwKXFX6aTUzVdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbb0PNuDcNQX5IXLvKPOREyk28cjEP6Jln8Xh4/jL2k=;
 b=jb+YJFuZkG6pv8u0pe2zQAzmH8/DNFyA2H8KeULjP+90TXSXbPvfC4dm6rgmQrY6okM5C8fPeJfiHCxIVK2b1B1mbUKGjBlFnkQnDHhyhYPllDpuLjFHi7wSKckP6fWrETQ6oa3g04aCOJB7V4ZbelAtow+nu3XYUpC1b2ZKeCOp5KMn0O6+rs7S1A8PfgZCvoce/MvgWcXi4hJDKtRoVdZ3lT1rdfnoH/R1eEOjFha4nhXlOuXcaUfQR4NB8OC0MJmrINrj3qy3XgWAriAJfrrrzFfpaCfj6kLp9xSFZFqKSGt21b09XnX2/uymq8qHYMHAn48bXUhxkXpsCXme0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbb0PNuDcNQX5IXLvKPOREyk28cjEP6Jln8Xh4/jL2k=;
 b=ok3bcYAY8hwlTg7JeEC5w3N1BVGIsRRZ0Fg6n1beY+D4dty5XBuCN5zodHDUDkWqaV7ttzNfckdbKN9vMAhuo+LJIGq3XpamUHyNicMQQzrXH+9vjuP/SClrbu620MBncTTT55WlOiPQAtssQ7BsdUBT8MEkej1MELVG3EE2WIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6990.namprd12.prod.outlook.com (2603:10b6:a03:449::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Thu, 22 May
 2025 15:01:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 15:01:32 +0000
Message-ID: <84a885ea-f49c-473e-9144-828260ebd615@amd.com>
Date: Thu, 22 May 2025 17:01:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
To: Danilo Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
 <e5d74c0be68d641171271cdff2e71ec5eb312377.camel@mailbox.org>
 <aac87a7e-5a45-4b54-a43b-cb92c5df669c@amd.com> <aC8rjBuqzst-SHMD@pollux>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aC8rjBuqzst-SHMD@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0230.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bd92a4b-6106-4ba3-fae6-08dd99418a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eU1NOUZpVHhlNGgyQkEwdCtQcUZIekpUSzg1dUJMdk0vNUpHZVMwdFEySmlX?=
 =?utf-8?B?em83R0xVREE3M2FMdWhHMG12dCtzZkUrelh1dDRvdGx3NkkwblJSaHhyQUhN?=
 =?utf-8?B?R0xkVzdVY3lHQmkreGtLeXM4K3BKSFhnMHR2NndHcDdwaGNZZ3Y4RVZxbTl1?=
 =?utf-8?B?cjkzRy9jRU5TNVFiNHNVWnByWTd2NDlGWi9zZ0JMdUlpaUFTNU5RZHAyb0VU?=
 =?utf-8?B?YlhnNEpJazhJZzI4bDRDQTFlUU5BdWphNWo0eFFsbyt3SnRKVUQ1R2FlNGtB?=
 =?utf-8?B?RXNQOGhwdTRaQmttcDJTNCt4V2cwUTRManhNMlBuenpMSjExRHRiTnRWekNm?=
 =?utf-8?B?SSs1TGpuOXhxenBIU1hiWkZTV2J0eXJmejZWd2lxWTFrZ1YvSmNIQUw0U05W?=
 =?utf-8?B?RlYrMmF6WXllU0lhdTFZenRPRVphYlZhM0NrK2M4Y3JlZy9jL1JsdjJsYklX?=
 =?utf-8?B?OXNUdytXKytSMkR1VGF2dm5lZDdmR1NiRjFmSHRJSzZWV0NUVldSZktDbXdn?=
 =?utf-8?B?a0haWW0wWGp1aHg5dy92L0pXMy9pTWo4Y3lLSlgrREtZZ2RRZDIrdkNtMk5y?=
 =?utf-8?B?dGpPckNZanQrRnV2cnc3djdLMytZb2NSRkNhRmNiRUNzQk5JQWpxNTEvWlMz?=
 =?utf-8?B?Sk5oMTZuQjBZZVV1TWZ3SXgzYkhNYTNVMCtDTUdXYmVVaU9oOGZlSzFwdjlW?=
 =?utf-8?B?VlZuVjIyRS9uemNiSy9IQ0JxMzVWSm5tZkZJYVV2emoxSFFUWHNEUUVqMlJN?=
 =?utf-8?B?VWpaTVhuQ3NHSEl0dTJaU2RDdWRJcXhTcHdZNnBacjZaa2ErcHcwUThzYUx1?=
 =?utf-8?B?THNKQVhQUjNoV1dIVEFKYzZGdHZjeFpXYUdmUDgwL3BkTmhwbC9wTTJONkpl?=
 =?utf-8?B?SXZNYWVnSmNCQkZjKzhFeFl5aWRKaWxmdjBab3RxWGxGZWkvZXpkWWRGdlp1?=
 =?utf-8?B?VWZab0lPa2U3b24yd1BCUTZ3SzBsY3Erc2t2SmIzbllXaStPUHFhVWppbXJT?=
 =?utf-8?B?dnhwaDZlY3N6TWl1N2hNTFNGMnJpVlNUbjJsdS9xR2pxVCtqa3UreHpJNjRq?=
 =?utf-8?B?K25taVpOQVB2KzQxOFdmZktDVUtMRGpUNkRXNlFCVXVsS2NOMzBEcWZocm9Q?=
 =?utf-8?B?SkpyK1hlWERib1BoU2RrbHZMZVl3aUttQXRVQTkrUXVCd1VGamphYlUyOTRD?=
 =?utf-8?B?NHVQaW5hekdBR2JMRURaWDlBajVqRWtXVHQ1ZDRhSzJsemFHVXlkOC9Qa1hH?=
 =?utf-8?B?RDlYSVlObzZOOUVXbEdTalA1WFplOFQ0NTIxd1ZWMEJYdzRJODZ0K1RGVHpk?=
 =?utf-8?B?ZEtDZ09iY3ZtMmxBNEJCTTduMzdST1ExZXVjZFkvL0FOcEF4cmlZaHVNWTA1?=
 =?utf-8?B?S3A1dHdJNFQrNTFEMVRMWnI3eTRlWGhjMTlzczRKeVRyWDRQZlZXNTFZMTdW?=
 =?utf-8?B?Y3orUUxTekorUHByeVJqU1ZEN1hvZGd2YzJ1NDcycHNaR2lLR09EdnR4RHhh?=
 =?utf-8?B?UUdxdWhBVGYzbzJBOHAwa0lSNlhBcXh5VUJRaWZpZDdzQ3NXRFF4aGsxaHgr?=
 =?utf-8?B?MDFpZ1FlcHVPdHVxQTN2Z0J5ejFwY0I0bFpLaXpPRmdsR0FmSVQrZTBqb1Rl?=
 =?utf-8?B?YVpvcVFhQkMwTTBTdGZoV0p1TXpWU3lncE1SSHNoY1piWkhvR1Nlamd5S3VJ?=
 =?utf-8?B?TEx4MWQ2ZGZoYTQvRGllRUFGWm10QXZOalY1bk5GaTExNjZWcm4vY2xSQ2N2?=
 =?utf-8?B?ZGZPWGJJdVExUHlIQWZsakFleUp0dkJmSlZVN0s2VHZFblUyRFpsdVV2TERh?=
 =?utf-8?B?UVlFSEdrcVVrWVZ2MkFrU054MGRTb1dLYnhPMWV3blB2RnJIeXJzeXR1YkYv?=
 =?utf-8?B?NzZLeWZaR1FxcWdTc3dwVjRCc2ZSMVZzUDRSdVBNZ1Y0aFNMNis0T2h2N3Ru?=
 =?utf-8?Q?YkJclsvselU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEhpdk4rV00zSkFSRmY3TWtoZU1weVEzR2p0b0tQbHY3VkwzSlllcUo0TXRW?=
 =?utf-8?B?V25QQzg5OHhuYmkvV3N4S2VVOURRTzBqYU1ZbGRHeDhyR2RWcHFNMWo3S3c4?=
 =?utf-8?B?TXhSS3F3OUhTamJwWWFPa09oUVhobWQwSlRVeE9hQWVXanJjVldvMW5Qc3RW?=
 =?utf-8?B?eGN2aTdUeHN1UzgrYWZ0dzZ2WHhKdysvSzVPclk1Unh4S2xJNVpieEVxUGps?=
 =?utf-8?B?SGxyVVErNDBxZkVZdTBiYVZ6Rk1iNXNvYjRjZ0NqdGpUZnZLdEcvUmVibnJY?=
 =?utf-8?B?ek1sTGxOOFRmb2NlL2VnWlY3UFgvRjdDU25mbm85MDVpZGRtTzkvZ1o4VCtZ?=
 =?utf-8?B?Z3lSTUVHRXRRSHJBTGtGRDNYRFBFV3hCK1dCNVN2RzlHampON09PT3IvbTFI?=
 =?utf-8?B?Skc2MjhpVjlsSTFOSjkxYThJU2Y2eDNxc3FFRENHVk9nb3B5L2l2dEQxNVhE?=
 =?utf-8?B?SERmc2Z2eTVVNmZ6MFhFcUdEdDZRT09FZGd5QTI0bWlCYkNjMDNsUFlzQWRP?=
 =?utf-8?B?M1Y1ZWhXQnFPVnVseVZIbTBBakZtd2VxUmE5S1d0WnVidlRUUWVrNURqb1d2?=
 =?utf-8?B?NmQveDZSeTlCS0hEVnFNVS90dzNkZVFCN3l6OVM3WlU3Tlh1LzFWV2VHRmY1?=
 =?utf-8?B?bWlCSlZlSjd0d2ZpOUJFVnZiY3NIOCtZWHUybzd2bnVuNnBPckpHdEhMRUp2?=
 =?utf-8?B?RkMyWlZ1Q29idHVETlFxcTVOK09Gd3dsVlY3enlzZUNFTU50Rmw1dkE2aWZt?=
 =?utf-8?B?MHVzU2JJZ3p4TGRLMlR1Y2JhbXk1bXRBNGcxc3ZVcXh1Rk9rY2EvdjZkeVZO?=
 =?utf-8?B?SXU4RzZUajJVUzJqbTFzam5wWjNFZ29Od3RLTW5lU3hiMG9sSC9sNm1yVDN2?=
 =?utf-8?B?elBSVnBUUVpNSXY3em5NM2pQWmVGVVI3eTRaMmtUZGpJY1lwcVRwcHlCL244?=
 =?utf-8?B?S2QvV0RzOWdzYm5qUnZpaTQyVG1oczJJbUtrVE03MitmY1VuQjBDN25GcU5N?=
 =?utf-8?B?VUdqK1M1WWZ4NEJzaFY2cnN5NDBVNjJjekFEOG1uRENCWFBUNlQxWXdJTmtZ?=
 =?utf-8?B?RitUeUdGamV2dVpzVEM0aTNZazZBbnp0aTd5c1Vqa3piNC9MUE5mdkx1Vnlk?=
 =?utf-8?B?QWt0eW1ELzlBYjMvV3VJcysyc1BaRkFiMjFGc2dQVkpJYS9vUnpYZ05ZNXFK?=
 =?utf-8?B?aG03aGhtZU1Oa1FEU1pqd3pJUVlFbStneDZuL1NuRFBhRG5FRHJnMUtKMjdX?=
 =?utf-8?B?RW5yTGVCaDZMS0VFY0xMNi9JcVZ3Nnh1NGV3KzRFUExOR1NBYkIrbTdtdWFw?=
 =?utf-8?B?UDFONW5PcWd3YnJRT3dNdEZ1MVZUTjh5NVlhdFdvaFBxT1hVVER6WUY0elZr?=
 =?utf-8?B?TnZUSExvOVJZK2cyV0JGUFZ5QU90eDNQTWhaYmpiMzRRZi9RZkQ4bHRyK3Av?=
 =?utf-8?B?dnJKczdKeVBoblVYVG5qV1MwS0I5b2tPMzFFazAyR1pUczJVWXVrakJOWkVn?=
 =?utf-8?B?Zm5yTWNjY09lWWxjYkhUNEYrQ1k3VThEaWhsVExRcVRiY2o1aFptUVRaam5Q?=
 =?utf-8?B?c09URk8wdEJIZWVmdmxuRUNjbC95TDRET2xUN2ZZV2NnbWRxRWhDQ2liRk9D?=
 =?utf-8?B?aWpDa3Y3Zk1iSEdpcWJCOE5WaXlUdGs0YU9tSVNocnZFZWhGWFhuaUI4eE5T?=
 =?utf-8?B?Q3ZBVlhNRG1sRXdvRkxlcjRDcG04OTZ4bSt1alZNSnZSZUtKZzRxV0FJMGg5?=
 =?utf-8?B?Wi9lSkxSMGZEUnBGeTI3dEczeTExdlMzd0p6b3NSVTVPMWVZcDRkeDNRdnVO?=
 =?utf-8?B?b2FiWVd3QkVZV3FBeTVHYUN3T3FmUmN3R2Y4TENnajhENGJtSkdMYU51eSs0?=
 =?utf-8?B?WmtRZGFHYWF5alI2R296aXlIL2w4V1RnOFUzUlpGZ3AyQ21YZU9FRFkzZHVW?=
 =?utf-8?B?TUt2THJNbnk4RjdQdnhyY29Eb2xYeGJkYlBtdVZ0OG1aSmFCV2tocFVmL3U0?=
 =?utf-8?B?c3ZWTHdnblhZTW1GTk1abDZMdnJyWUF3TjA0WE92UVRkcThybFQxN2t5UjlV?=
 =?utf-8?B?N3d5cWJMbUJnaC9SNU5oN3FxOTk4T0tsMUhkN2xmRVdrTFlSTmM5aUxjQVdU?=
 =?utf-8?Q?fQFeYfMVGJFYZuiPYKPKPFYwI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd92a4b-6106-4ba3-fae6-08dd99418a33
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 15:01:32.8687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69z60KzmoCyY1nZQxSoHUp3+l/Ijo3toCxbWhvPckuE9rtZjNmN/RcR6hEFewX5v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6990
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

On 5/22/25 15:50, Danilo Krummrich wrote:
> On Thu, May 22, 2025 at 03:05:02PM +0200, Christian König wrote:
>> E.g. when you don't know the implementation side use the defined API and don't mess with the internals. If you do know the implementation side then it's valid that you check the internals.
> 
> I assume you meant this as "bothering with the internals of you *own* fence is
> fine, but not with foreign ones".

Yes, exactly that.

> And if the driver messes with the internals of its own fence code that's fine,
> but in this case we talk about the generic dma_fence implementation, i.e. an
> internal flag of the dma_fence implementation.

Well the flag is under the control of the fence implementation.

> In general, a driver should *never* bother with implementation details of a
> generic component, regardless whether the author knows the internal details.
> Things are *always* prone to change and then this may result into subtle bugs.

Yeah, I know what you mean. The implementation kind of sub-classes the dma_fence component to use it to implement it's specific function.

In C++ we would distinct the function between into private: protected: and public: sections, but we don't have that luxury here.

But you already convinced me with the argument that this needs to be better documented, I'm just not sure if adding the function documentation would do it.

Regards,
Christian.

