Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 065963A1843
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 16:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8898789E57;
	Wed,  9 Jun 2021 14:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C9889DB5;
 Wed,  9 Jun 2021 14:58:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjdCA2aXofY7wnpd98q7mVgwQqrH6Y7VxnzItH4GE/2f+DJzUC0U2kPstMgIaQNx8pDkVi94fgw5V8vuchKkFy8FS4U+p7UxOEd3xxCCUa/XeDHbPcose+OrCc66VWkzkAxIYam3G03Y46hVcFBadQWm3KPSxuw4tpvDxOpkX9R34UZb00Xv1DWOT4Ox6qyT4YM99dX7aAMy1ZECxOrvTirytadAVWAyesj1La1gAh3B5iPXApl9VDfNFTkWDl/b6o4Vm6t5R6xtCmAp3lRXRDLjIaVXFZoEMqaVykb5gOB03gAoXoge8d3+OoPGeZhWen5CQ3B1THeHN2G3Qac9vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQTmTUOvyb7MDpKito1sJEHHTe5OjaoNEVZO39jiFO8=;
 b=RT+4PK6EExpIKOlLAx4wWbWVASkylUtVbvj7YP/L+6fhyTEwI5epD1HsuU91akcf2G+ZTovVJSI9baS/UPKouOWBSX2NSFoqhRS4KXP+LXt4BQ3xZ6agidhwoL0I0uf+QFFU/IWeuYXKwPB1IMDPJ/5g20jPPH25jmf5X4mPTwenkyRZEWk/ZKlvDy1FjahO3pQ0vuxjTG48lavSODg4X+je/oLK1oAqP07Fv76z8PLEv7gIK+Y4xo/uUdgzFUhkm3j+PE3SrrVozy3X/tdywX+ebvLhLPXv+rj3xh9/6OMH4nY87hzlwsG2dQEHtytJbY7rR8i/ky7vV4HVPWXIOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQTmTUOvyb7MDpKito1sJEHHTe5OjaoNEVZO39jiFO8=;
 b=HoQdYba0yBBGoB4tKpa69mTJD4NQuD3vZRjDiGdsjsiL2SdNdPzL+PeWp7yR/bFFClMhJKK8xKEh5AJvbsC1UEVIuxuCRIatOXDY0HocDihFQwD1kUywoauCrC8tONleEgUoUAJYKsd7I5w4o2b+a4UGLMa+FzlS0D5+PI8nPNg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4784.namprd12.prod.outlook.com (2603:10b6:208:39::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Wed, 9 Jun
 2021 14:58:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 14:58:22 +0000
Subject: Re: [Nouveau] Trouble with TTM patches w/nouveau in linux-next
To: Ilia Mirkin <imirkin@alum.mit.edu>
References: <2e4987b0-7fc9-d217-450c-943de430dbd1@kapsi.fi>
 <816b619b-ff20-009a-ea05-504497c1946b@amd.com>
 <CAKb7UvjrxXyvr9qpLbkoDQ2eScj4YdayP6OnG8rZnmEn1hyKvw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1c9bdd1b-abea-872c-e23a-8a0e1e777a02@amd.com>
Date: Wed, 9 Jun 2021 16:58:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAKb7UvjrxXyvr9qpLbkoDQ2eScj4YdayP6OnG8rZnmEn1hyKvw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3e79:91ff:ea38:2624]
X-ClientProxiedBy: PR0P264CA0225.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e79:91ff:ea38:2624]
 (2a02:908:1252:fb60:3e79:91ff:ea38:2624) by
 PR0P264CA0225.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 14:58:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f964772c-6b63-4461-774c-08d92b570671
X-MS-TrafficTypeDiagnostic: MN2PR12MB4784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB47841B12EF5E24C0AAA7CD2983369@MN2PR12MB4784.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:119;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yM2muqvvf46g8LPN2cHCivZeURhEMeMwR6qhLl/qiHLNpYms+nVbWfrdIWGtKkRMfyr4VAvESQxxK+zb7BhBLr8Y5mP7NFRoAtDdvTwe4bRRNlaEwjZFeIW0Pgk/Dv45ow5kGvobkR/EToD4CVrrYz8triRUNki9nSHojHGFxSrf3X6z2n/p5DnWbP5ESD1t1nBcdQgMPPkTVGSK3l6Oe2sOIgeEE1pT4mHbOWVFbFqhZMULm7rTRK3LZmF7KnjVARvXgJ++SPBU6JkQgSZfEoz6FgyFfJQzxteVuLVHzo061lZFuzkBh8JSsGhXElSDuUBfyIZVolQXO6TU6snqVRSz6YWfFOizXImk43CPD4xc5siKejAwOu5BXrIR/KQfDinxhRY/sYNCaSxG/K58N7kpqnistVAmyEZVWLMibNPM/sOQi5/zcNaQhHDemORxxHiqcaP7PK2sa6TO15jK785eo6ChREKKIE0qio66Z2FghF2IJmLX2eruqYuC2kir+dW0iccAZqXtyahtbue0CZlFDLQM77FrT35GdQAmiZ8rDORYgAk8Ye9AVLNDB2OS9jWpAVy221LdzyyYHZgU9IVFseiO/KI5p3k461kExJ9iTk06wAhNgiQiM2mbElPXOHF8aneTeS39Fu1TQMrsMoMvwkUepeE9D6NKD8oPEXYZwuLAHhFxISZ9BXlWW+QfFR1mrYcvsPSx+xC5e8qvkQ0B2Wmgd8uWUOW2hE43cAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(316002)(4326008)(54906003)(31696002)(36756003)(8936002)(38100700002)(66574015)(66476007)(66556008)(16526019)(66946007)(53546011)(478600001)(5660300002)(45080400002)(2616005)(2906002)(8676002)(83380400001)(966005)(6666004)(6916009)(6486002)(186003)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnJhOGxhV0dmdk1nVjZuc2ZQelUxVmJCTFNwRTFndlF3MXpHUWFMd0dsSWpj?=
 =?utf-8?B?T09QWklVUU43SHlvNm8vbjFweFhxaUtId1FkTkhjWFh5b0lEQSsxRFlBZFQr?=
 =?utf-8?B?U1M5bVgwWnFzY1RVWXlkOStFeXpyaklDMWZvV2VmZEZpRGdGY0tKVkxuSjZB?=
 =?utf-8?B?a1VCcDFxc0tJQlNWQ1ZQK0ZucVZCZXg0bnFSQVN1V3pMa2tYSjEyMXY0ZlVO?=
 =?utf-8?B?ZmM4UkJwZHFBSXZKYllldmZpcWNnT2Zoa2pOV29EdVFZZGliOFpESVFmL25O?=
 =?utf-8?B?Z05kZmRQeWQzY2ZvWkNYZHRkazRRU0lWQjdFdkVMemwvMk9BNVd3Szlza0Vi?=
 =?utf-8?B?MUdlT2xWREI4S1E2d0Z1dHdVKzZSVWhHTyt0eEhGbWx5OFQreFVwa0Rqclhr?=
 =?utf-8?B?dG1BcVFhWTk0VksvU0w0THB2NHFYMUNZUkM3OUJ5QjEveUNSOXJudkJNTkVJ?=
 =?utf-8?B?TjJJUm5ORFBOaWJ0eTBxTU9tZnJPcTVETzErVDJ2d21mUHdaekx3dWFSUm9W?=
 =?utf-8?B?NmZkaXJsWE9DSXdXTjkwOXFKOS9iUm5GNHlLL1ZvbUYxbE9vd1RXR2ZmT1Jn?=
 =?utf-8?B?SXl0ZlFXMDVPTzFUeDJjalVoRk9RVEM5NTliSmNoaERtNHRRRndDUm15Tys0?=
 =?utf-8?B?dzdGS1FSNXRZSHpCTXJxZlVGck13U3NYajZpd3BFOUp2Tmk5R1NOU2g2S3VV?=
 =?utf-8?B?UWk0M3J2aUxaS1owSmkrYk5NbUdtcUNkUkdRQmhRL1pFRHQzc1c4b1lsZURJ?=
 =?utf-8?B?OEFOSTJleXpIYTlxU0hHSkUxOFBTaGQ0ODhxR2VOVlA5eW44T0Y3cGZIbnVQ?=
 =?utf-8?B?QS8xTmgrcDVPaFBma1ZtV1dIdFcwN050Z1ErWU9aU1d3VkhPb1QzdW5VL3Ex?=
 =?utf-8?B?RXBmcm5JQUNqRnBpQzV0R0JPWC9mczJvTXRtK0pyNDhMRXY1VFdGWkZkcTds?=
 =?utf-8?B?RmZRellTam5aSGNSU25zNE91RS9ySXhvNkt6bDdUM3VhMUJsSlkyMVpMd3Y2?=
 =?utf-8?B?QXhDTEtnS0MxTjB6SkxHUWREVDdCYTcxV0NJNGlpeU9RMjB4YjFkanlPRDIz?=
 =?utf-8?B?ZjgzcllHblFSanFNTGVDaUtrZ21lY2ZVbStFcFdIUGdiUDFjMzlUNW1ZTjFa?=
 =?utf-8?B?TmpkTTJSc1hha3NhTUVQWGFpVjlsSXdyeVYxUHp1TjNNeDY3SFFmaUR2S2FI?=
 =?utf-8?B?ZUxJbTBsVExVcGQxS1BhcG1oekNXdGl1SFdoempXbUFVYWFMY2V5TityTzBp?=
 =?utf-8?B?enZ1SVV5MllJWWdHenhlU0V1SGk0WWlVQm92enN3MWpEeVdDZXZkclNZRzZF?=
 =?utf-8?B?M0F5K0M5VCtMOW82Z0orZThzN01VRE56a0R4WWJ4VW9yWE5iZEdLT1NURWR0?=
 =?utf-8?B?cDhIRXNaRnpTZXhFT3RWa1lnakMxbWNiRTlJK0xiMEhiQmFJU0JJWHZqcFZR?=
 =?utf-8?B?ZHFyMmpxTnZ3RmNUWlJoanFPTGg2a2MrcUJ6VkdqMTQ0QjlOQVRLN3BIN3Vi?=
 =?utf-8?B?UTZJNnpwakt6RDZ3ZVIyOEtwRWtkanBYdlhzSnRWV2I0bGd2TkFRRkZGNU1Z?=
 =?utf-8?B?SldtU2JybHMvUzBFT01CR05hOXZORStIRU9ZSnBlV0I4dkVadWtvMVVnMXk0?=
 =?utf-8?B?cks3dzlabFRtY1N6NnE1TjNjeFA5NSt1Zkk3MVpYVSt1QXF3dlh4Ull1RUdM?=
 =?utf-8?B?bjZRMDBESUtlL0RzSi9xd3Z5dVliaUN4MnlKR2Mrc1ZjbUtNdHVTekx1cGFu?=
 =?utf-8?B?VUdYb1BpbjFiYnRRdHBvbHlYZFp0M201ekJNdTEzMktTYUE1QzVqSGU4cEhU?=
 =?utf-8?B?UTlsS1hQRzVPVHMrdFBvK2t4Tm5yQ3FrMGpESktHa2Z4TTJ5S091TGVvVStQ?=
 =?utf-8?Q?qvdbq9lYwcamb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f964772c-6b63-4461-774c-08d92b570671
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 14:58:22.2312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /o45OGRFyzRpPLdgAlReCDd8sXBJyo/4EUI35uey7B8GwvHW6mGwf52Fpy/uMEbf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4784
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, ray.huang@amd.com,
 matthew.auld@intel.com, linux-tegra <linux-tegra@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Good point, but I think that is unrelated.

My suspicion is rather that nouveau is not initializing the underlying 
GEM object for internal allocations.

So what happens is the same as on VMWGFX that TTM doesn't know anything 
about the size to of the BO resulting in a kmalloc() with a random value 
and eventually -ENOMEM.

Good news is that I can reproduce it, so going to look into that later 
today.

Regards,
Christian.

Am 09.06.21 um 16:52 schrieb Ilia Mirkin:
> Christian - potentially relevant is that Tegra doesn't have VRAM at
> all -- all GTT (or GART or whatever it's called nowadays). No
> fake/stolen VRAM.
>
> Cheers,
>
>    -ilia
>
> On Wed, Jun 9, 2021 at 10:18 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Hi Mikko,
>>
>> strange sounds like Nouveau was somehow also using the GEM workaround
>> for VMWGFX as well.
>>
>> But -12 means -ENOMEM which doesn't fits into the picture.
>>
>> I will try with a G710, but if that doesn't yields anything I need some
>> more input from you.
>>
>> Thanks for the report,
>> Christian.
>>
>>
>> Am 09.06.21 um 15:47 schrieb Mikko Perttunen:
>>> Hi,
>>>
>>> I'm observing nouveau not initializing recently on linux-next on my
>>> Tegra186 Jetson TX2 board. Specifically it looks like BO allocation is
>>> failing when initializing the sync subsystem:
>>>
>>> [   21.858149] nouveau 17000000.gpu: DRM: failed to initialise sync
>>> subsystem, -28
>>>
>>> I have been bisecting and I have found two patches that affect this.
>>> Firstly, things first break on
>>>
>>> d02117f8efaa drm/ttm: remove special handling for non GEM drivers
>>>
>>> starting to return error code -12. Then, at
>>>
>>> d79025c7f5e3 drm/ttm: always initialize the full ttm_resource v2
>>>
>>> the error code changes to the above -28.
>>>
>>> If I checkout one commit prior to d79025c7f5e3 and revert
>>> d02117f8efaa, things work again. There are a bunch of other TTM
>>> commits between this and HEAD, so reverting these on top of HEAD
>>> doesn't work. However, I checked that both yesterday's and today's
>>> nexts are also broken.
>>>
>>> Thank you,
>>> Mikko
>>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fnouveau&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Caaf09cbea0b04d8dc01208d92b5637ba%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637588472445308290%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=ePoWVtHPXeK5RThkRuQSykKrfWCgPOzG5CLTzfw9%2Fuw%3D&amp;reserved=0

