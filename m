Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3FC786ED2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 14:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7E610E53B;
	Thu, 24 Aug 2023 12:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1FF10E53A;
 Thu, 24 Aug 2023 12:14:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oqm1nEZNUaWXQ7ic+3+TUqB5pwwKbJzDpxL6dzq7HOQWkCUZmbVYMNHN5MLrf950Bzz8UvT86cigPleL4csro9ei5t5+Fd21RKkuub/ETYR/sYdIWaHtqbFdFlMlFczBlu64NqFrfYcywlApbADMqNv16b+ILtn1AVcAdkYYDcmTUGpj4k9PKrT3ekw+nENgZKFGy3Rnvql4uiP6Rudg4kjoYDqXNFQk/N1pkdC82OfIbQgYI6RLLyfUTvPteq6UtfJ8h2xxusZtbVz3wEMXQhMCi04THIh8pVeaqOaEQKVM6nW8cnj7rRM0a4lQ2fRBT5GB6O6gLU6o53Yo28p8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Zo+CsY04YIaWE3Q+dAIa64vt+otS7yVI6VMJBMcN84=;
 b=mPHdRJmxmtcRNCTasU5mmAAoeaL0l5cJkkOM5cdG4cJvoZ9bJ97lNFRJbuWjWwZ6phOA6SCn1HDHwHDq+f9ky5H51DPSx5IDidXF8SVUtc5Fx+3amF5QA9IrRZxM3ABRjpOkRJbtQqTRfdgh+64R1RvO+EP5umhOWoXYarYtNVnPvatX5P7R8K9KQQfbpp7oWtvNXZU4GLihfRudb6gBvHtogLym4yD1HXbSJwKOoHuwCr8OFcLNLUZvQfJ/QewGc06SzMAqpMniXjF/gxg0FeCnpoTKN8X212YZjJiKsR4whZxCWNp8Wo5VeNhxi7CEDiINEDMgiWTZPbqLUTUyYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Zo+CsY04YIaWE3Q+dAIa64vt+otS7yVI6VMJBMcN84=;
 b=q9bOpr8i4nfTJjN940s5Rt40CuUE6H61zkjGYm8S3VEkx+2k7rcRAu4IcG7cKVhzwKQ7H5WQU1C9/7LsXMIG3hfIF0J1hVNMncprOjOwQnD4UeyDY62InVr/x14oesHF2yknKIE19VG+qLBTr9yRqJJzc986BxgiMYoFR0cZ0o4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 PH8PR12MB8608.namprd12.prod.outlook.com (2603:10b6:510:1bc::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.27; Thu, 24 Aug 2023 12:14:32 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079%3]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 12:14:32 +0000
Message-ID: <a3c4c781-2f74-4b09-9db4-7b947897ef5a@amd.com>
Date: Thu, 24 Aug 2023 08:14:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH (set 1) 00/20] Rid W=1 warnings from GPU
To: Lee Jones <lee@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
References: <20230824073710.2677348-1-lee@kernel.org>
 <87wmxk4xt3.fsf@intel.com> <20230824120735.GS1380343@google.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230824120735.GS1380343@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|PH8PR12MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: f238e3d8-548c-4cd4-3d73-08dba49bac4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OgDGeuFeN9MW1Xj7fkLtmJWsYhvIQYoI8kb+ljMkqrwB+q2IHN6gzcYnR1qPrKxSm/9JvJUYl05TDDo1/FyBoVLI1hbuvak1vcE6IKJYHdQeufSNUBBWNjHIdZ6YA4gwtopTBjapWbkTrxt20No0CQcrjKVoNs7p2ubyqUE48i9uEzKI6ooTGqPnvgiOH/iUjksZwfFPdxIH7b459eJ1XJlPwOXAv/avzeTm/6HyIL4ZgjXXYfhUcfYj/sRia8ubXRDpSxUcW3KcBvGdnAqLWew6qSbVoa1LYrAhs3aJlcHupiIuiKucYWg/OQOgoMO3LRchLvW4aV67isFI4oOZAFM7EP7qzpeofP+I0phDzLVOUdl2KgODCdyX3+Cj1WblUl5EMuQuIOxmHPZ5Ku2mLImWViJuEX8aVluFz0Op+5r97PuBRJ7RqnxR2osp9Jn3gEoAjtRYq+yILUjxGVwF2SmjG5Es5M8JMtwT1uiL10W6b/3pdb9A75aV55+qPwv7m5E62VE1Dvqkwr5//eEeqlOCYCYY5OSFNc6Vcn0ktnJQ17+ThleMKGRtYubNJbxkurl1CRD1D5MKKdueCUUH8eaArNDjKu4eyARFJhhzY69LitY1CsQn7SFjHa/BMW1J4Mnfyg6vU45Ls6CtWCrqpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(346002)(39860400002)(136003)(1800799009)(186009)(451199024)(2616005)(4326008)(8676002)(8936002)(83380400001)(5660300002)(36756003)(7416002)(44832011)(26005)(6666004)(38100700002)(66946007)(66556008)(54906003)(66476007)(316002)(110136005)(478600001)(966005)(31686004)(41300700001)(2906002)(6512007)(6486002)(53546011)(31696002)(86362001)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVRVRXB5NnU1WTV1TkU3RS85d041OEp3dHorR0JTNEttSktiQWtOd2hjYXdN?=
 =?utf-8?B?ajU1U3A5RE1waG8vS2tRUnBtVTdkWFVnNjRGSUVLSURsSjFzU05wMUtaNGw1?=
 =?utf-8?B?N3pZQ0c1ZElwcGxVeURTYk8xNWVlbm04Mm5YYkZ3OFhSKzZkWDVIUHp6aGtv?=
 =?utf-8?B?eFZVS29LNWl4a1BSU0haenlXVVd2ZFd1V3dGcnNPUmhvdklKNVpCbTJVK1c0?=
 =?utf-8?B?UDJEZWRaS1JVNzdMMVM5K0lyMjlKZEVTSTJuYkthWmlDQTMvSFI2cWYvb29q?=
 =?utf-8?B?T3BGOE16ZjBPZHBCR1FSbzJkd2hBTWhsUVhIMW5pelk5eVRWbzY2ZTY1Y04y?=
 =?utf-8?B?S0Z4YTlGVlZqdU9LdVRGU0NUNXhLSzBrdnJoZzhxUHJVT1JtUWp4bkdyNkpY?=
 =?utf-8?B?STBnOFJVSkp6blBrVFg2Z0NqNVZielhPbC9KK1FVbkprMXdCVS9ER1lzV2ZJ?=
 =?utf-8?B?WnNjdEM2N1dHNGYwYWQ0cmJQSTJHMDZBSUg4R1YxK1Q4SEs3UFlNeTJnbzJD?=
 =?utf-8?B?bFppTjNMQjJGYXhpbHhaNWJ4T01qaUxjSDIvenhmcmxtdkc5MC9tcUNTSURo?=
 =?utf-8?B?V3lsQXRxQzZyTkxGVWh3RnhoanN4SjcweFdhZ01OeEFhL2dEWnp5K1lLanhW?=
 =?utf-8?B?Wk5QSUhud3NVZUVtRzJHdGpmUUdNSmtPODJLZmFweCtzOTVwZnJsci9jbk1T?=
 =?utf-8?B?NG9rdmtNazRsbVMxWkhEY0VRbzZ3N1cvc2Vib2EyL2Q0VnBubHY1N2U2RExu?=
 =?utf-8?B?OXNWdUR1Z04reFNQZjJsWEtnSmJWUGJ4RHF5OTBaSjZqTmp1ZE82UnB6TkE3?=
 =?utf-8?B?T3lldW5ORithYVJ5V2pSVm9rWTRkWDdIR2ZYU1Y3YVo3ZkQ2U2xFMUJ6VWsz?=
 =?utf-8?B?cVMvcHN5ZXNtMGp4THp1d2hlc0V0T21pamdIU28wNlhUZDZHRmt3UmRwRTZ4?=
 =?utf-8?B?cWpFOTRyQi9SS1FpN2N3VW42Ri9kWGV5QjJnWTYzUUZmUXpibFBsOHpDODQ3?=
 =?utf-8?B?YnN1WnhQeXZYK1UzM3c4UVFQQXRxY21oVnQzNzF6cXFrWCtwQUQranp3QUlW?=
 =?utf-8?B?WlovOVJpd056QXdIZytkNlRhOTFjWWcreitwMGNBRXBBMFdybXFFSVZ0K1dj?=
 =?utf-8?B?dDNlQ1pDUEZaZGVkS0xGZWhxRDIxTzhmV2ppbURqQTVKbSsvT1hneE95dXpY?=
 =?utf-8?B?YmVuVFRpOTVxVk5YWEpvQnZuSVR2TlRGUVY4Tk1URk1KZXpWelo5VjBXd1d3?=
 =?utf-8?B?akl6WlU0TnQyczJQNUttS2MyelZpSml1cWdqUVloSTdiOVpUbTNlbVpTQ2ZV?=
 =?utf-8?B?c1RDMzQxa1Bwbmx6aGlKYTBKSGVicXNoemg4QTIwTEtMUUdMMEVTMmNjcm54?=
 =?utf-8?B?ZFJuZzJLSnB2eTgreE8wamNYVi80SWgvS1Q4QkZEUUZ6dDMrc2lkUjZzMmtJ?=
 =?utf-8?B?K0JyclpOTGxTbG16YXkyN2E2RW9VbmswT3Z0UmRrbHhYVXZJWnVJQ1VybS9G?=
 =?utf-8?B?ekUzVHZMN3Zyc0VlMHZna2N4bS9nOUN2blUwc1Qxc1BLZEZhQklGVFZnN0cw?=
 =?utf-8?B?RFpCd3E2RCtveVVyZmVzUHFGYUhkbS9sayt0cWo1MVVpczNkMjVKTTRWWWd0?=
 =?utf-8?B?MFArSnRuejUyRjllRVBTZFdjWFhzeEJZMytGTE1oNzYwSXlmUFo0VDBUcldi?=
 =?utf-8?B?U3llbUN5alNrRDNod0dNL3htUHRUUDk1MWVubVAwdUttMEhoczNvWmlkRit0?=
 =?utf-8?B?bGVnREdFTzVGRkNYd1FjQ2FqZHA0aHM1YWcvSjhSRUJLVlFWRzV0T1A3WHNo?=
 =?utf-8?B?ejdybnZVaTlyaHI1TjhEckNnaWdwOE9jUHBucFlIYjlQUkZ3aXZYd3d0WmU4?=
 =?utf-8?B?WHBmOUJ2S09TRFJpeTFjNUh5OWFmS3NRNGZXc1JHUlVrcllLK0lEWGVhdWVN?=
 =?utf-8?B?NDhnVFZGSWQreGZMMk8xZDJuNHBoQ2dNM0dnaHdvRjd1clRlRkdCU1RNa0Qw?=
 =?utf-8?B?N2ZwRDBPbk5LZ1ZPWUkrdG9jMnN1ZVJJYkU5OUN2bmtVQlhFc1ArNHpYcUIr?=
 =?utf-8?B?MEprRzZKNU53eGlqRmNGZGhWcTFhTG1QQ2NUZDZFYS9oSkFrTGFpUG04ODNy?=
 =?utf-8?Q?iZ6v/AZxS78ixomVd1O49p5/1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f238e3d8-548c-4cd4-3d73-08dba49bac4e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 12:14:32.2402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1FnG434c7Ma3mBdV/gKKwFyrkOYZp2ByAqir9ULENp73ypqd8SA9+Lrffbyegt0H5uG3wjFb6puZ8sBf+IeUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8608
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Michal Simek <michal.simek@xilinx.com>, amd-gfx@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Stanley Yang <Stanley.Yang@amd.com>, linux-media@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 linaro-mm-sig@lists.linaro.org, linux-tegra@vger.kernel.org,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Hyun Kwon <hyun.kwon@xilinx.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Jerome Glisse <glisse@freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Gourav Samaiya <gsamaiya@nvidia.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/24/23 08:07, Lee Jones wrote:
> On Thu, 24 Aug 2023, Jani Nikula wrote:
> 
>> On Thu, 24 Aug 2023, Lee Jones <lee@kernel.org> wrote:
>>> This set is part of a larger effort attempting to clean-up W=1
>>> kernel builds, which are currently overwhelmingly riddled with
>>> niggly little warnings.
>>
>> The next question is, how do we keep it W=1 clean going forward?
> 
> My plan was to fix them all, then move each warning to W=0.
> 
> Arnd recently submitted a set doing just that for a bunch of them.
> 
> https://lore.kernel.org/all/20230811140327.3754597-1-arnd@kernel.org/
> 
> I like to think a bunch of this is built on top of my previous efforts.
> 
> GPU is a particularly tricky though - the warnings seem to come in faster
> than I can squash them.  Maybe the maintainers can find a way to test
> new patches on merge?

I guess on that note, do you know if there is a way to run
`scripts/kernel-doc` on patches instead of whole files? That would make
much easier to block new kernel-doc issues from appearing.

> 
>> Most people don't use W=1 because it's too noisy, so it's a bit of a
>> catch-22.
>>
>> In i915, we enable a lot of W=1 warnings using subdir-ccflags-y in our
>> Makefile. For CI/developer use we also enable kernel-doc warnings by
>> default.
>>
>> Should we start enabling some of those warning flags in drm/Makefile to
>> to keep the entire subsystem warning free?
> 
> That would we awesome!  We'd just need buy-in.
> 
-- 
Hamza

