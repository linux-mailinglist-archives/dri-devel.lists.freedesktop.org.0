Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD4C4D2DD0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 12:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC5C10E775;
	Wed,  9 Mar 2022 11:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2083.outbound.protection.outlook.com [40.107.101.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B6510E751;
 Wed,  9 Mar 2022 11:18:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ia8fELwLnRseAK22vr3DK1nM4wVUuna0eaU1Ih2Nvj/HwklNFPLXhp+Si9jlbci5cqwC4qcUxZyiRbpWn0sgW3bkdsrvLKJ5tgWNdGFpufoTjmXjo75AvSkBbncaNJgw6LiUoTWoeRAYe6bKL1dprVXo98q+HL0Z1CKzoQJrRaWtVxXsstfMWoy/0x5XQIsS1VqI8dhWyU7QFQeNExNIqCQ0zuTa52izbSAhFwY6Fcfogqt7X+H29OQth1o934TzBuGMM2M4Zm6vbTLCcsPuqKF/LYTKcfc3viq7HKYZLZt1gNi/McE6eVQPKG1MQodVQGAp2NmYrEMaL7wiyfWaag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lt6Ops85G/6uPKNNL7F4x4cnQbjfniz32QyHrHZLTLQ=;
 b=Qc72E1/8rxqd8tGwe137UfXQ/4SPhE714F1Q90C/RLfSghwjlLa9m8iHGjHAXX8ZnGE4AyOMNJRfOM1TKt4o7PDPhVyLBPMrxESAqxIxkkRoJSTqr9+mBEu5zuZe5U4s1SbC0OP+ZDDT1zH/jPmSn9+xdNFY29AE8EEgLL+E9TxudGL1YwsYJL9P1rnDtbSvHa+oZV9B6HOVEtKkEXAjDDCXYFeBLujM/11XcMj99hMq0zoBx/d+Nwj1nlO7uLYh/dQT3z0NjN79T6yw3W+KCmtkf3G+BrODb2JVRplt4TGz126h2yWBfTHH+l8V6kAX0YuQ9d08yY/JrKOuhvP8Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lt6Ops85G/6uPKNNL7F4x4cnQbjfniz32QyHrHZLTLQ=;
 b=Pgv80mZ513LF/qP5xVC/VOzmDdzF7L9FnLxLtf/xrfC8oSTCx8IGhfMamOYyWl3z1rmtXHjyynbNXEWX9uJU7lIY9PgjS4zAqt68LQNJKwX2MdMNlDruyNnp+3+r0lcWh+4aC/5UOOrgmNF1qun2a/BEsSk+f09CJvLaXdqr30k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by BN6PR12MB1345.namprd12.prod.outlook.com (2603:10b6:404:18::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 11:18:23 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::f037:e2a1:f108:125a]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::f037:e2a1:f108:125a%8]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 11:18:23 +0000
Message-ID: <b6029723-e6fc-4c4e-9032-d303ea428db5@amd.com>
Date: Wed, 9 Mar 2022 12:18:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>,
 Shashank Sharma <contactshashanksharma@gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <Ymb96aes4qNvdggMW_Icw6i6kbswV37jJ6T_8N6JmHlaZazbaHL8gV_LFbvLydLIawvKn1cN01mh6sWORSlLZ3BqzJtjsutf7OmCqBOzGag=@emersion.fr>
From: "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <Ymb96aes4qNvdggMW_Icw6i6kbswV37jJ6T_8N6JmHlaZazbaHL8gV_LFbvLydLIawvKn1cN01mh6sWORSlLZ3BqzJtjsutf7OmCqBOzGag=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0067.eurprd06.prod.outlook.com
 (2603:10a6:206::32) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5fcbe11-e55b-4010-284d-08da01be8611
X-MS-TrafficTypeDiagnostic: BN6PR12MB1345:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1345F38FEB47FF4FFCA73964F20A9@BN6PR12MB1345.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vgZuV+NnUpUZHixrXfKYpmPsHof3llVNfHgoWL+oMzkH+EvRRqxr8txOe8WJduyDtZXhwHnqkfa25AzEYou2iuqEdaSUgvmJFZXekF0mv17H5WnpaY2JnQ+I0hLG75zr221F4/aKCVLzUwA3EJCuUkykBWvZh1qg0LiZExU53XRjrqV1Q8kJLab6C8rjJuGqPtmNPcsCpp3mybPDZQ+E+/qE8FlcXLNclrBMQNwIQcMz47KmN6aPLRk67/2eL33QCfDIZzP30pWu+3wcXf9Onh53T7LdNVJfMJSJbyqDjrnbVGMBaHLh8tWVgXyAWdz4wn2v4nyRfwIWabu25HKau7/Ilz6fWbyO/sOM7W1IpLZwNYfVRWjYKNmnNgF+Vw0v5BGOIGyBADEbtboCZ25MwtyeGgynocM/DhHfcyXTX12cgZ4A6U0wKRODJFK6RLvszSP75j6BM2orPUVKekknhmQhP3SIytGNeDj+O0Q+1ktC/vzaufYb0x4jXDpii79EDPPWkay8kwBYwqsVXVzSVSFZZNrv8SRUSrpIECpWIPEpo0OFuPIRTHSrWMEtUQGuDNJMkNc0fr7dLatLkhjbVBz7bb2bBysBn8CdQHmk98usRlwLqsGDekLiKbBUWxnWFSVLYO8LasR9Ky6cUxm2eqXTgJA92amERne/zBmUWX13wLnw64bs9haAa6mwU4qq+DsMJ6Abx2LF69Nl6IZsxGPIf3QRK01rJj4O7O+XJX7hX5vzlHGlfxvE5Vkys2zL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5040.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(8676002)(66946007)(66476007)(66556008)(4326008)(508600001)(6512007)(5660300002)(110136005)(966005)(6486002)(8936002)(31686004)(186003)(26005)(2616005)(83380400001)(316002)(45080400002)(38100700002)(2906002)(36756003)(6506007)(53546011)(6666004)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnNISlNmS3BkYVhycG1wWEdmaE9FRFpBa1NCaldQQ1RiYUR4QWJCY25wNkYx?=
 =?utf-8?B?bndTamtTQy9GWFJic2VPWktGMWwxOXNrWUp5YWk1YU04TWFvNWF6Y1dkeFRQ?=
 =?utf-8?B?T2QwVnZwcElMcVpJc3A2bUp2a0twWnVsb1RydXRoc3Z3elhDZForNldRM044?=
 =?utf-8?B?V3F3R1NiTFg4U1FpMnBCSnRSdFhKNVNBWUgyZWVaanBidGFac3BsSGg5R1Rl?=
 =?utf-8?B?SVRLMGh5bHBYKzc5Y3BheGtOZVJUWTMzZlVUTjQ3R0ZsR0Z6Wlg5RVh5SFRi?=
 =?utf-8?B?NU12RmdWREk1TDVqV1JESnpQaXVtd2xyamp0dXVDQjhOcjR3WDNEeXNWT1Zi?=
 =?utf-8?B?Q3d4Z1Q5K2NMUUlRYnRvRFlNd2VhY1RWVzJkUGMrU0Nrcml6dTk1Q2ViUkht?=
 =?utf-8?B?emM0cWFlTUw3b0V5RHl2UmJIb1VIZWhWd0paZm1PRVhHOUdzQi9uZGRrdThJ?=
 =?utf-8?B?dEl0NlhiMHdlQlNQSFlVVmo0Z1cySzhBb1BYRFFmcFlWYlhJTTBCUEZlMllZ?=
 =?utf-8?B?NFdxZm5vVWpyaW02RXVqRTk5UUJNZzRqNFFTa1duaytQeWVRZzd4YUZFcnlS?=
 =?utf-8?B?WFF6aW81eDlWWmc5VVpBUUFOU0h2VThsc2UweS92enJ2cFFLTTU2OE9Oa1Rn?=
 =?utf-8?B?NWQyY1NYc01WL0V6SDFHdTRCQmNYSFRWdmQ1bXc3YW04aTNjN3Rla2FTRDls?=
 =?utf-8?B?Y1NIWjNBbFJPWThoVTZ2OXRhMmhzeG5kMlNuRmk1dkYzVnVIeUkzUk1qSWx6?=
 =?utf-8?B?R01UK3ZQOVVUeURmcm9JWUNFbStaSXA3STdIbGhWVGIyYlJzbHZtdWNKL1F4?=
 =?utf-8?B?WHg2WCtOaWEyL3V2QkhISDRYV0c1cTRjdnFzOXJLM3grTjVubEJVTEZQRXBV?=
 =?utf-8?B?TjRpNW93OWVaOGh0N2s5cHd1S1dXTXRmSjdiQVNNbUNLRTB6TFpLaVpaUE1M?=
 =?utf-8?B?KzllaE15K2VkYUpybTZjVi9HUVBJWlFXSjUzRTBqbHFkWXFYZlJRM0xpQXNY?=
 =?utf-8?B?MTRkK3NpNnBEZElIUFg0SW1OOFBpRU5JQVB6TmNXVW81RmFjaE0yNi9mcjFq?=
 =?utf-8?B?RHFpU0Y1QjgxcVV0TjF4T01VcUI1dEQyUnFjZnZCNHhhd2cyd0V0Y1pvcUpQ?=
 =?utf-8?B?a1g3bS9ZMS9xMUxQd3crMElteU10eXM3M1VqY0VxVVZzNGVmMklySTFkanFo?=
 =?utf-8?B?K0FYL2tLUGZpSUE1YURpY1ZzOWpRUW1Yc3o1cmluUTc2L0RnZmZJUzQ1U1RQ?=
 =?utf-8?B?RGhKR3Z4TjYxMmJWdTZCNXRFSmpsZVlvVW1ScllOdkpHcGlMZnJNLzdGR1lO?=
 =?utf-8?B?d0VoQjBxOWdPUHA4R09GM3FuRkdXTGNXbGtDT3ZKT3FONy9yZ2xUdTlFTlc2?=
 =?utf-8?B?cnlWQzUxQWgzQWlsaitYZDNDS2QrYzhYOVpLOW03U0p4UnM0MkJmUUsxRUdB?=
 =?utf-8?B?RyszSmVVNjV0blBWUU5xdyt1b2t3ZzMvSVdpd2Q2Vmc2T3hFcnl5bkJLN05x?=
 =?utf-8?B?S2E5cW11N0kvZFJFeFVYRnJpQXJHTEJYSFQraHJlUWgvSXFpeWcweEltMUZE?=
 =?utf-8?B?MVE3NFVSL3Q4Znpzc21HUGg4VXZKejlqWVBkM25zUXpWWlB2SFVtSklKdkcx?=
 =?utf-8?B?M0pQeDhPS2FlcENWVm0wSVJOTVo0dGEyWHJVdzZBQm9FbGtEajdZVmFadG9M?=
 =?utf-8?B?RHJkci90SmVvVTNyYi9mVldKVXl4NjJEeEl2VTl0REh1cFVIOSs0RVF1MGJ5?=
 =?utf-8?B?bUJQaWVZZjNGRVdqVzlqYkxNZlVJaDFKN0w4NDVLZlRPNzZrdHF4UUhRQXZl?=
 =?utf-8?B?b1ZSWTlSY1Q0REN5RnlwV0RTYUNWMFh0ZkNIaG80N0tDNHdkLzF0OGhXSU5N?=
 =?utf-8?B?U3Byc2ptZThyeVovWno5eWpyMXJDbTJJMGVJdGh0Y2Rxb0RKNENnOVZuRWxi?=
 =?utf-8?B?b2lhMEtYbTEvZEorNm4xcVNPdGRydVpOZlIxeWVsbDBMa0dTWlFWYUw1SFRz?=
 =?utf-8?B?RG5Hc2sxa2g2NkVGUXlncFhQNFJZRGFaaUE4ZnlaLzRqanppSFNSUUUzci8x?=
 =?utf-8?B?ZTJwOVRvVTJxbmFSZ0pzVzZHVkxYUW9VeFZPVW4xUWcveFNsU2ZnTFJZZWtm?=
 =?utf-8?B?VWMzNVpPb2dvUC82TE53QjNUTEw3TnpoNmpsNmEzSEN0TWo3MmdoeU9iZ2Uv?=
 =?utf-8?Q?4zQxGVpWzOa83+6yuwkh68g=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fcbe11-e55b-4010-284d-08da01be8611
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 11:18:23.3687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvRWJd42LHgD6LXGm6/3yCPsLrcuG4+ubMavtWce9i131CWtdJrUovKe5uCyzRpd0j2Wby0G3MwShwMnnTEx6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1345
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
Cc: Alexandar Deucher <alexander.deucher@amd.com>,
 dri-devel@lists.freedesktop.org,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/9/2022 8:47 AM, Simon Ser wrote:
> Hi,
> 
> Maybe it would be a good idea to state the intended use-case in the
> commit message? 

It was added in the second patch, but yeah, it makes more sense to add a 
cover-letter probably.

And explain why the current (driver-specific IIRC) APIs
> aren't enough?
> 
As you mentioned, we also started with a driver specific API, and then 
realized that most of the drivers can benefit from this infrastructure, 
as most of them would be more or less interested in the similar 
information.

> Since this introduces new uAPI, can you point to a user-space patch
> which uses the new uAPI? See this link for more info on DRM user-space
> requirements:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdri.freedesktop.org%2Fdocs%2Fdrm%2Fgpu%2Fdrm-uapi.html%23open-source-userspace-requirements&amp;data=04%7C01%7Cshashank.sharma%40amd.com%7C85e8e40c84524f3272e908da01a11b1c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637824088716047386%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=%2BMTzBIfl3FGHdAv%2BSx%2F83a86x8eksbOhdQVqdrJ2Rq0%3D&amp;reserved=0
> 
The userspace work is in progress, this was to get a general feedback 
from the community and the interest.

> Please use drm_dbg_* and drm_warn_* helpers instead of DRM_DEBUG and
> DRM_WARN. This allows identifying on which device the uevent happens.
> 
Well, I don't want to break the consistency across the file, as other
functions seems to be using DRM_DEBUG family of prints.
> On Tuesday, March 8th, 2022 at 19:04, Shashank Sharma <contactshashanksharma@gmail.com> wrote:
> 
>> +void drm_sysfs_reset_event(struct drm_device *dev, struct drm_reset_event *reset_info)
> 
> reset_info can be const.
Sure.

- Shashank
