Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F136697C7A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 13:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A9610E11E;
	Wed, 15 Feb 2023 12:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2057.outbound.protection.outlook.com [40.107.100.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB65B10E11E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 12:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXtSF619yWL+bAgqOOLSURW+Z1QY1Ued2k4Y/s0PssDJfSvZnD47Cd71IfduQx6RCBZIKgif5/63G8et9fkUEUMQ2Cv+KI8gg/zFsXkfbJanK2R8yXk6Is70/FDx9BrXXQjj14Prd0FesA3Y5wuaJ4/sU5ummgYrxhqt4lkAOn42zToX3rDXCguzrZFsUV8Ws2HxgSMNvfXTAS5vZJPlPRvfkHPXf4qXAdWirU7Q65+x7q7pTJ/CRaqKxds3bQMHhI7KRFPJ2uw6x4DASErgMizf9RSeQTJRGu4gsNwG47x6xRK5NZEmN7MKW/f+vOn7i9wUAgk1R2gL1S96DnKEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQwV8eZ17qPFhRPnHkgxcuRZK32Nx7gry/fcbRSVSug=;
 b=H3eL0singgXC+8ITLBso9hhqdeVfbOAIwli+Wq8zZdHoo1Oey8RoPVlUvl/P3rAeduDeQULaQIcR8OkWkt8PCStrqmehwyEa1uMlNrHrNna1avAq9/6NIwvhaY6QFdOK+HIv2NpwPtXfaVGyTMuXpJ7ik4rABlYIytrB71TnBQNVl9llM8oCjFYJnnWsHFFs+BmdEiDGxp/mRvfH55FsfoWIr4FPo1jaz+AwlrJ9Yn1R2ndCkGzgjJL4hqNW0WsFCnPSdmCbbycwRjaxGCVFni6YDdPtgNw9dOcrv13dckmHcE6GQGNdxl+7BGsEXkZ3v8gWb5GtZ2rteSCSQm2ecA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQwV8eZ17qPFhRPnHkgxcuRZK32Nx7gry/fcbRSVSug=;
 b=Y+WnJ/OYw3LIPJ+zdT+bCR0fQ1EkG0ndhcDE/Emu1gf3EuLIc0ca3Qb1eh8UQYFfF/CTofo3c2OlvprV9ZIWhcmf9zEeewisMfNYcbbBq4637yIy6g1X19GX+30VKd+4wN5lHaSc5KN0FFF2o0mDyGHKKdYxgTQZOWhJ7uzpvRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB6391.namprd12.prod.outlook.com (2603:10b6:8:cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 12:58:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 12:58:25 +0000
Message-ID: <c5fe8089-49e9-2bec-eac5-e8a035412cf3@amd.com>
Date: Wed, 15 Feb 2023 13:58:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Question: partial transfers of DMABUFs
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <53ea4d2db570d3ca514a69015488bd5b849a5193.camel@crapouillou.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <53ea4d2db570d3ca514a69015488bd5b849a5193.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: a51c2278-4f3a-4ccd-bfb4-08db0f54532b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H14pUAcku2PxWhhZIKLIeovMoIkNhtwuA6AFOLFFONUVWGnq4wKb9vBq22DpISQ0HyI6WgTxF/3KvTqpzmfhfhCG04Kb6mceGMT71VXVi+gfh06qy0hm1GJeaenyCNRizfuCc3+MyL5pgFAB1wjVprXQ0+MmIheFyLZuNpcyQlHxOOKZgFDUpbkNXBuHbhiXjEVz6Nn1hRsbfS2YRPun2xbJknH1TIfGkDUpP4cxlS3+mmSba9o2vYp83Gl0RyQ6h0eafHAYahoD1W0vG5mG0Ac157PUceagKYESQhEOlgShNkZLf6uWZTR8V+NJy8RgxN18E8lYiTQ1/LrNgrECw0eP23gGMDOdW7gn02UG1uRV9fj4V2+tjJB6nGmWmFlXa0z66VOEdGpZnUJUFEu6GU2Exo+3sOMulhfp2rAxv7dZB9c66nBZx6sFtOdCULlCalwoU7LTcobH+UAoOSkdjLzS/pdvDRvsj2XAFguhRa4qyscJrLldzyjP5fEZb1GQCn4yciNz7s0GzkCjrxdV6j6saAc2jqVXyn+Qj919Mbrr7bAqe8nwkTbYbU+HXPwsd3M/Siicvd9LEVafnGAft+1GHRguO+jRd/zp2QXMDpRud83DNc77awgIDEjSIlZapOcoFManJnEUClK1w2n7HnxzFFFqRLg2f5SJdIzKmNX3y2r09ItK4p405nTvqeruNhbRs2zB39vTp3shNzMpJ+KNAnFgd35hyqklPf08i4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(451199018)(5660300002)(8676002)(2906002)(4326008)(8936002)(66476007)(66556008)(66946007)(316002)(110136005)(41300700001)(478600001)(6506007)(186003)(6666004)(6512007)(6486002)(2616005)(31686004)(36756003)(31696002)(86362001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkhFeklhM25peEhPZVRveE52Q3VHZjZQR01vamJnZnZzYVR4MGgrZ21ScEtH?=
 =?utf-8?B?TkRoL1lNMVVJdzVIamdvOEFybWx0azFtU0JENnI4V1BnY0pmNVk5clZabjdv?=
 =?utf-8?B?ckNnWjZsNzVSSmRhUU1iWXRQNGhZVXlIYUkxRmxzNFV3enR2SVdYUkV5bHJI?=
 =?utf-8?B?TDhUd0Rhb0VVSld3bUROc05waHl0ZnFBSjVOU0VQa3NCY3J0Z3Z6VU1DcnV6?=
 =?utf-8?B?QXpwMEZUR2pYaXlHaFI4WFNFdlU5aFlNb3FUR1Q1R1hBUFJ2dTJpNldRb1N6?=
 =?utf-8?B?amt5blVNUTVubWgrRHRGNy9LUmZERnNxOFhyVFlhTDJid3Z2dFJzc0RrelIw?=
 =?utf-8?B?T3RoL24vNDNFblRqTzEydVRsOHZKTFZKeVFRUmhnWnBTelZYdWUrVjRGSTVj?=
 =?utf-8?B?REM5OUUwenRWdk11emp3UDZWMTFlcDA3Q3Q2enNOU1IrbXBhK0VBYkJZRDRZ?=
 =?utf-8?B?NmdlRFl5dDhiRjlQdjBRSWhHc1JlWTgwUUVuSzZFY1ZxZ0dHdVh6NitMZGNU?=
 =?utf-8?B?RE44aDJLSy8zdG1IWVZKZS9aRGNXbUNXSTkzazJxQjRjMkpSbDd3c0I3VUVC?=
 =?utf-8?B?c21aVEYzSHRQYnMxYzNQZWpFNzRybjNrVDBkdFU5WHhDNTE5M3lnMVJxQlRH?=
 =?utf-8?B?NDVjYlZsOGRUdi9vbmRLUE5DZVkydGt3Q25HeUgwQzdybWsvbXRNNDF2Uml5?=
 =?utf-8?B?RHFkRTBjNWdQdVRMaXJ3RGM1Ky9sQ0YwMGFOeTYxVzNnem9udzRmeVNBL29n?=
 =?utf-8?B?MW1UZWk1YjdIYnBzWEptU3dnWVFoSnRBbGI3TXJjTnJ4aWp6eGRTQ29jUkNF?=
 =?utf-8?B?Nmx5QmQrRko0SVdyaURyWVd3a1pxR1ZacUhORlVkY3U4cEt0V0RTbDhyNG9V?=
 =?utf-8?B?VUdhQjlQU3hNY2ZVN0dNWTJFbFIyblE0eEU0QmRrNjZwb3RjSjhCUk1hLzFM?=
 =?utf-8?B?bXZCMjZ0OHk4aExMaGNlcGtLY25HVU5NNnNjMTdtaEFVL1hDK0tqbk9keUN1?=
 =?utf-8?B?S251UURWTHlTSVhmK242V09UbzY4NENQejhXaGtnZzI0c2xzc29kU3d3ZHA2?=
 =?utf-8?B?bnJQcEVKYlpLZW9zbmdOWkcyc2h5TzBTSCtNR3J1UmE4ZlU4N0U3LzNZZkYy?=
 =?utf-8?B?QS9vSEI3UlNUeFM4QjNGekt4ZnppRFMzRnFjM2pKTEt5ay8rUllYV1ptajVi?=
 =?utf-8?B?ZC90NTRTSkVOcVIrZmUvR05kc2h2MmltZUpHT3JPUUlQeWpQYkRCTUpHQ3Rn?=
 =?utf-8?B?WFJkY0Z3YllLZDZXWEhnczVxNE5SeFc2VTV2cXFpcjc1NExZSUE0aHgzRFl5?=
 =?utf-8?B?REZCaFVwTVYyMU1jc25yQXlsV1lDY0ZjNnhWZ2NMSlAwQ1FlVUhKRnlJdFow?=
 =?utf-8?B?VHIwL3paUlFVZ1hNZllzWEZyRHhab3h5OU9nL3FLbXh0MVFVSmhnbnJqdmtC?=
 =?utf-8?B?a1hmQkRkQ2lUN1I2alJMZnNkS0RqTG5XMlMxSXZ5MDJGVytyRlc2Z2NpdUgr?=
 =?utf-8?B?ZlgwSlpkQWdDNW43Qk1kem4xdUNZcTB4b1Y2aXIwOFYyNWRjNkJLV1U3dWJn?=
 =?utf-8?B?NjJQWjYwV004eUFEUWRNZlVuQm5yOVUvc1RSRElSTEp0ZDNJWUM2bnFnQm84?=
 =?utf-8?B?ZkdyNDV0MUtMSVRMUW82SEhjL3Y5S2czSXpRUkR5VjVOSmFZdTI1TXhqN256?=
 =?utf-8?B?WWRUN2thSEVRODM1RDd3cFNVeUhlSXovS3MyUDIzbzBDSXVQc0dYM1hFV2lW?=
 =?utf-8?B?UmVWQTJoYUVMWnN3dmtWeURSMG83Q1hJT3Ztc2tFYTAyOWR0Y2ZvWXROQXpU?=
 =?utf-8?B?SENLanlxZ0diUWVxYjJtY1NlYm9ITnVlNlV0V0ZqcnZiU0I5RTlscUZkVG5a?=
 =?utf-8?B?MWZuYTRmeXo1WmZhenB1K3d4WUV4WW8wODh2eU9WK2dTV25KclMzMFJ0Z2xN?=
 =?utf-8?B?MTlaeVRJbVpzanJVL0lPS0kySXdWOTVwMnZMaWxHYUNPZnl3Y2lFcnNDeFpi?=
 =?utf-8?B?dFRsUzZZa2dWa3FMZEUwMnJPOTMycEpYOUN4ZkIybzBkZEZlVWhESEFoZDZr?=
 =?utf-8?B?RERzaW5FTUpYT0hrZExSZ1FSZGZzYkJCdUp6eklIVHZOVTV1T2pNMmpiM1Ur?=
 =?utf-8?B?Q214SlNVVm1PZ1A4USsyMzlRMUp2b2RrcTNaZi9tQllkN3N2cXJEMFo2Uys5?=
 =?utf-8?Q?qEp4L+bIoL9PeQdLLKxDkH6V0oYTKag2ZZnr63R/zYL2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a51c2278-4f3a-4ccd-bfb4-08db0f54532b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 12:58:25.2758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2ygApkOfYAtiR3CslJ89WW5geEl8ucqYJOrunrcT3Qr3S13+29VKDopg2cxcyTp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6391
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
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

Am 15.02.23 um 11:48 schrieb Paul Cercueil:
> Hi,
>
> I am working on adding support for DMABUFs in the IIO subsystem.
>
> One thing we want there, is the ability to specify the number of bytes
> to transfer (while still defaulting to the DMABUF size).
>
> Since dma_buf_map_attachment() returns a sg_table,

Please don't assume that this is an sg_table. We just used it as 
container for DMA addresses, but this has proven to be a mistake.

There is work underway to replace the sg_table with (for example) just 
an array of DMA addresses.

> I basically have two options, and I can't decide which one is the best (or the less ugly):
>
> - Either I add a new API function similar to dmaengine_prep_slave_sg(),
> which still takes a scatterlist as argument but also takes the number
> of bytes as argument;
>
> - Or I add a function to duplicate the scatterlist and then shrink it
> manually, which doesn't sound like a good idea either.
>
> What would be the recommended way?

I strongly recommend to come up with a new function which only takes DMA 
addresses and separate segment length.

Regards,
Christian.

>
> Cheers,
> -Paul

