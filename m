Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 084DE576EAE
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3B610EBC0;
	Sat, 16 Jul 2022 14:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2183210E06A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 15:18:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKTJpvyMlliQ7bQ25bc28RrFQPraqbYTWztYtbUNi+CvKt4ojik4hlOFrX7qfb7HZ4PZxyJ8tRJ0f9Gq6mg0SN7XZe5g44Ivign+RbZPCEA1ckga9Dj5nTWfXRF91q3iKe8swd5KWBrvUFKQum7h0Kn/9ppyqkWVaSqFoUD+cPqkcjsbZOWY4ehfUA5wdO/lnCvVXfcDZV+pSyBrn9GWjE+UyCURiguQj+MZ2dNsVueoJTIucdR5EPS1o6k0GHHgWMMGksF+3oDVWhEPsmeJj/cphgPoYXrVht1wxEv2kjy2B0P5zo2Hj8go2l77QkwMTYOcePQ6Sp6/iH3404p6yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCgsVZExQzPJm4oARXXFYMd6ACwqoVIMnOnRWVacKiM=;
 b=fTM8MhfMdakO3jL7BtYV0CdUi80xN+IT4SWPfumSk8yrnc0pOVX0JgxJFFePvA6eNDpcora5b15rYfP4eF2kk/PIU5rrpFf7TwOzzexyKrNgb5Fh//AQtdhvhBff4z+SLF7ZWfxLy9IkZUVWV47N7447L53qtUrf8kNA167FlNQWKybRsMCfONRXIEPVZubP/119k9nQRowlUtcMHtK/itIdPe3ZwZH5/K38LFALJHej47p7G2AzbosVdZiiUXxKLEVjvfARUNE0P7aQJQ/mfslbHi3qGwiZXh/pPvEugA5AaUNwb0rYqDhKUnU4WaUFI/x+x3BhxzJEA8Sm7ns7/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCgsVZExQzPJm4oARXXFYMd6ACwqoVIMnOnRWVacKiM=;
 b=LNYBizDPDaVdsbZmh5a7yiOVGNq5z/NMRn2PA/XicP/QqfxFOVrip/TIMnfdNFM0AEtg53t/xe+AS5fxKonoequjPfGBHrXryGS6N74015ILcLeOwJ9dbIBqCI52UKW6CjOGKqq+vf5vUtr8RC64qX8g7Nxn+M/Wpe/mygBFXTQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by IA1PR12MB6115.namprd12.prod.outlook.com (2603:10b6:208:3e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Fri, 15 Jul
 2022 15:18:05 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91%9]) with mapi id 15.20.5438.017; Fri, 15 Jul 2022
 15:18:03 +0000
Message-ID: <e18a645b-a3ec-9331-d480-1693221b8d31@amd.com>
Date: Fri, 15 Jul 2022 11:18:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <a78343c8-2a6d-b223-4219-6b6b0a4fcb1f@arm.com>
 <CAK4VdL2hCEoshWZbCh5mkHuS6wYMiPFR3v4MWTnrEKM9zyv6Mw@mail.gmail.com>
 <ef88ec2c-77b5-fa0d-49d1-fdd2451713b7@collabora.com>
 <573fae0d-c9ab-98b0-c6f1-5b0d4e52dd01@amd.com>
 <a33ab7b9-738f-db91-f6ba-78a9641365e8@amd.com>
 <b05f9861-1966-72f5-132b-aebb4b6e0c6b@collabora.com>
 <107fe968-8311-0511-cc31-22feb994a6d7@collabora.com>
 <3e07a8d0-2cbc-8f3e-8f9f-5b73fb82028b@amd.com>
 <CADnq5_MMmeWkiMxjYfrG7pip8BEkbkRc8ADUDLEi++kRF76sqg@mail.gmail.com>
 <bff42c98-045d-2e5a-2cf9-eb563425375e@collabora.com>
 <6e0c7590-6ffb-162b-a98d-0a39333453f6@collabora.com>
 <4ca27cee-eda0-0a65-f972-c69cc3b3e53e@amd.com>
 <CADnq5_Mms=UbPc7D0-Z-HNUHfCHVWMO82NO+jh5Yg8DmkKwH3A@mail.gmail.com>
 <4c7e7b6d-8dcf-41ae-c853-b95e6efd9c32@amd.com>
 <CADnq5_NQ+BCQKt1cJX_V0ZmLE6O2ve5UwSxCzXbDrtkcig4=9Q@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <CADnq5_NQ+BCQKt1cJX_V0ZmLE6O2ve5UwSxCzXbDrtkcig4=9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::18) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc2aba48-4f93-4f88-15d4-08da6675360e
X-MS-TrafficTypeDiagnostic: IA1PR12MB6115:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tVhwDd5iVh0/fT/lwIP6s3uV1OFc2LbKl099LPy7FcGuk7dRRX6Qz6Uf10O5WHi/ibnlwLTet5j/hpnjYoHdju0vGCpUaywVgGqFdpUEwB7vHU3EHZK+U+IpC96CsdrCej1igCDpVyRy94xAPQ4oaHdC7kMUlEQqdTExGY8AJHvh/9CqEXhoZqNBfMCAsVgI/TEpqszpzZN6iqZo/PZX3470VgFC2xvqxJ+Owv5gto2a01mmaMA1Ar3yQ6laNAjMCsDBdpY2ftl0WeKEEKIbh/noVwx76TissfinHIT6AGfco3B2OKGTtRW8T6697IwSyigTvaZAT5i6YMFpg8z8DmUsG10o3oCBpJrcpsdDC1FPkkvJQU7P2rBPD5aW8bucitgKO9xQOn3aV6BqHuKV5ao+d9MQAuubPDSsG8LM1f+hMX10c7LldKDnWkf/d55gciFignXRMLAIknl64zHGXB72FhhZlA8g0zj4Y5Z6Vl5pDDRP4gN24pg1+tq5fOkjQDbeZ0B/1e30xYmFOxWx0J0cjFW9TrQ92TbiOURvpPWNTLwoxi0hXthB/eY9K9CCZjKLpw5GGb5d/AoAWuW2Lk/Y7TyINj8KfDzzR3X3WNgUAbHvJdCnJT/17GJcyaKwebaKQBIMW+TMaV8DgGUHjIomoW/Mr6+vQ76m35SCEmp2dQcpZjUOrbKfNFZVOxfH6vL9/dOyltLGsFkD2VqL0fXRuiXgGyW2hFBA82bTfndObyt8SN/wCqsYw4rhlRL0sESIDO0lIDQr86mgBKl302oqwfTYS5Hg8qzETAULHU1YowrkQxpPu9WZX3YRk8e6YdSqluDenOT7Sh6uJZNy+PwoKJkCfzLgFB/4w17r5GzV93DyRQJ9Cyzp3e4gibzE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(54906003)(45080400002)(6916009)(86362001)(7416002)(316002)(966005)(83380400001)(6486002)(186003)(2616005)(41300700001)(478600001)(31696002)(53546011)(6512007)(6506007)(2906002)(44832011)(8936002)(38100700002)(36756003)(31686004)(66946007)(66556008)(66476007)(8676002)(4326008)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlhRd0pOaW1pSHpnT2xCZmQ4OXZrSUNyNkphdzRLKy91OTN5SHNzMVpUUTUr?=
 =?utf-8?B?WlNJVkd5R1BQM1g4ekVkVWIzTlZIdmdiNUZ2SmVGcVczbmpkcXYyZUg0Y2Nn?=
 =?utf-8?B?V2srUjZBeEpQYW1pYWw4VjlGT2dmM0VleEtnQ2pVTEo4K3c4QURlWGUweFVS?=
 =?utf-8?B?cmJHeDcwajQ3M2l1NmJpRVdteXVKQ29IKzFZSlo4cXFtWUhQdDEvUERpWThL?=
 =?utf-8?B?Sm12TDZPaVh4aVFkcHJpeTBhNWF4TTNXSk92QmpTUUFyU3JDMDJHVTI0YWk3?=
 =?utf-8?B?RkxSQmYxSmlhUjhzcmdTdWFjbTdubnpxTzE2citYQXoxaS9CWUZjVjBJYno4?=
 =?utf-8?B?LzRyRmMyWXNJcldUQkk5ZmkvQTJRZnNMa0tmY0RhR21FSjRGT0xQajBMUmFI?=
 =?utf-8?B?TVBFanF6UHAxVjJFZkNlYVBLMnlaNWd2RTF3S2JvVXdLTFF2OWI0Rnk2ZE1p?=
 =?utf-8?B?bUxZUHR1NXBLK2VuYWd3SFJ0Y0dPdHdtc3VOMktiSWJBVVJGa2lEV1dSbVZN?=
 =?utf-8?B?czd0Z21ROE5DcEcwaGVkRmg4RThsellhWVExOWkwanROZldoejJkRnNJT1pq?=
 =?utf-8?B?ckYxTzgweUNjV3B1NWkzS0h4OXRPd0xMR2RybURubGxTSk1ZbllSM0hZWTJK?=
 =?utf-8?B?TG1WMWowNjdSSHZ3eFYyQysxZWJoYVk4WUlSN3dlVVdPN3VxM01UOUJmQUN1?=
 =?utf-8?B?bHNERS9PdnU5b2o4cHJmVndTZnQ5K0t0WWJSbEpNakpkV3dQMmtvZVdOSjV3?=
 =?utf-8?B?YXd4T3lwUk1JMXYxYkVuYjZLQUM1UGE2RVY2aVJlUVo3c0hEMnZzb2ZJeU9q?=
 =?utf-8?B?Z2thNW5DdUdYZ0xYMlBwVFpSa0NPSEVCTHJ3ejVnL0toNlF0dFV4blZDWHhw?=
 =?utf-8?B?VGMyNi93T0JuV0FqMzlMSzN1VjYwekpmNENnRmtBcVNzMVgxZ0FsTEtVV0kx?=
 =?utf-8?B?R3hoSTU0TnJjY1ZtY05DUHdkc3NHWXlOU3luaEF6cHU5VWRtUDFJeldOR0dB?=
 =?utf-8?B?cFZlMXd0cElHZDl2RTJnbXkzelFNd1BVMG9ZNUM3QzMzYjdINllkcG96OFhI?=
 =?utf-8?B?NDZBU0VITEZyV0VQZkZLd3Q0WEwwWSsxZDI1TTRVbCtMTWoyekRXVnh3eUxD?=
 =?utf-8?B?MHJyVnBDSHBmb21PWXhlNG5GZkNUTEZ5Y3FJVW9ud3VxQXF1R05ka0RNbG9Z?=
 =?utf-8?B?R2NqcVR5ai9UVFpIM3VyREt5eC8veEgwSTU0MWdJZWdKdHZoNi9HYWRtY0VR?=
 =?utf-8?B?UGpIbVRldi9POVNCZFpnQkdKTEJtWW5jUWY1SzFTTFlORjRnd0orRzdBY0ls?=
 =?utf-8?B?YWxvYUpRSEdvZXM2Nm5tVEd1VlY5VDRMS0o0UlRmVlhrdjRYTFNENU0rakRB?=
 =?utf-8?B?VUp5QU5aVzZVdjcvd1VyYVBpRmxVQWZTMm53TmM1MTZLbVBpNWkzdWhaOTJ3?=
 =?utf-8?B?cmI2VDAyZE12SGQwQUxINTdBcm9PVEYwMWJveDNlcGRmTWE3VDArOVVKL2F3?=
 =?utf-8?B?Ty82L0hGQ1dmbGVrQkpYMUVvK0lXOVRYQWptcGV2dUEyeUtaZzczK0NBRjdT?=
 =?utf-8?B?MGhQa0o4aW5tYWRYNlVxeDV1cUdmTEpOYkp2bk9FeVBUNENYWWZoZDhtZjlD?=
 =?utf-8?B?M2VJOHFkM2Z0OTJlMDFuTmhtL1F2ZmppemVWcUduRmNISmlDK1hBTUhkamdy?=
 =?utf-8?B?b1lIR1hmNWllR1FhZjN5Vmh6WHl6WmRETndBbi80K2h6bzhhZlc4VG56NENn?=
 =?utf-8?B?aGh1ZzVDeTYrenJ2aEhuSis5SXBSTnJZWFhtNExicERYeWx6ZFdIU1lYWThn?=
 =?utf-8?B?TTlIL2k1N3hnakYzckdiRFo0SVNKeWp6ZjZ1SHFQM29DOHpyS3A4N0prZGNq?=
 =?utf-8?B?bW5sWUZoK2NNMFdJQ3VtTFBEYmpySk43UTNkeU5lQVU4V0tFSEI5aVpPMXh0?=
 =?utf-8?B?cG5zcXhnbHJQTERzWWN2c1g2Q085UUxXLzRMTnZlT2g0aGExQmxkQWp6RGpC?=
 =?utf-8?B?SlpmdmQxOGNPcGh4a2VnK3drNS9pMThucjB4eVQ0YzkyMW40UlZrYUg5R1Vx?=
 =?utf-8?B?YjVlOEVtMThwaUJsc1F4UG8vOVdkTWxBZnAraVU0UHFhY2R6MHdHVEZpMEhX?=
 =?utf-8?B?VS9pa28ydGZvRk1nNjRVNmx6dHUyZFNHOTZZZEpIREtDQmdXTTVnY3Q3NERL?=
 =?utf-8?Q?ShyoyIH7arSAoscqaihUYX1D3HTuqSlUhbCJ86b/buWf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2aba48-4f93-4f88-15d4-08da6675360e
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 15:18:03.3258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwNHgk5xysl2SO8y5TOEDalIv168hiL77IwJdG/Kh/kSIz8lgjDd6qVNQGxYiIxBu/52D+e4DPlqzdPc4KLBKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6115
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
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-07-14 17:16, Alex Deucher wrote:
> On Thu, Jul 14, 2022 at 1:58 PM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>> On 2022-07-14 12:22, Alex Deucher wrote:
>>
>>> On Thu, Jul 14, 2022 at 10:14 AM Andrey Grodzovsky
>>> <andrey.grodzovsky@amd.com> wrote:
>>>> On 2022-07-14 05:57, Dmitry Osipenko wrote:
>>>>> On 7/12/22 11:56, Dmitry Osipenko wrote:
>>>>>> On 7/6/22 18:46, Alex Deucher wrote:
>>>>>>> On Wed, Jul 6, 2022 at 9:49 AM Andrey Grodzovsky
>>>>>>> <andrey.grodzovsky@amd.com> wrote:
>>>>>>>> On 2022-07-06 03:07, Dmitry Osipenko wrote:
>>>>>>>>
>>>>>>>>> Hello Andrey,
>>>>>>>>>
>>>>>>>>> On 5/17/22 17:48, Dmitry Osipenko wrote:
>>>>>>>>>> On 5/17/22 17:13, Andrey Grodzovsky wrote:
>>>>>>>>>>> Done.
>>>>>>>>>>>
>>>>>>>>>>> Andrey
>>>>>>>>>> Awesome, thank you!
>>>>>>>>>>
>>>>>>>>> Given that this drm-scheduler issue needs to be fixed in the 5.19-RC and
>>>>>>>>> earlier, shouldn't it be in the drm-fixes and not in drm-next?
>>>>>>>> I pushed it into drm-misc from where it got into drm-next. I don't have
>>>>>>>> permission for drm-fixes.
>>>>>>> The -fixes branch of drm-misc.
>>>>>> Now I don't see the scheduler bugfix neither in the -fixes branch nor in
>>>>>> the -next and today Dave sent out 5.19-rc7 pull request without the
>>>>>> scheduler fix. Could anyone please check what is going on with the DRM
>>>>>> patches? Thanks!
>>>>>>
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Ffreedesktop%2Fdrm-misc%2Fcommits%2Fdrm-misc-fixes&amp;data=05%7C01%7Candrey.grodzovsky%40amd.com%7C9585d3814d9b4e51bfcb08da65de368d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637934302314091129%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=QjSspRJyOZpFOoaA988nH2V7Gq54gSUl6mm87B1sYhE%3D&amp;reserved=0
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Flog%2F%3Fh%3Ddrm-misc-fixes&amp;data=05%7C01%7Candrey.grodzovsky%40amd.com%7C9585d3814d9b4e51bfcb08da65de368d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637934302314091129%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=8ysjuD7Ufsyu5c%2BfRdpT9nkWHjotsd1cjCfy4yRw2uw%3D&amp;reserved=0
>>>>> The patch is in the drm-misc-next-fixes, so it wasn't moved to the
>>>>> drm-misc-fixes.
>>>>>
>>>>> Andrey, don't you have access to drm-misc-fixes? Or you meant
>>>>> drm-fixes=drm-misc-fixes?
>>>> I have only accesses to drm-misc-next to which I pushed this patch.
>>> anyone with drm-misc rights can commit to any of the branches in the
>>> drm-misc tree.  You just need to check out and push the appropriate
>>> branch.  then push the changes.  E.g.,
>>> dim push-branch drm-misc-next
>>> vs
>>> dim push-branch drm-misc-next-fixes
>>> etc.
>>>
>>> Alex
>>
>> I see, but what  is the reason then that Dave sent out 5.19-rc7 pull
>> request without the
>> scheduler fix if the patch was merged into drm-misc-next long ago ? All
>> the changes from
>> there are usually picked up for pull requests, no ?
> drm-misc-next is for new stuff for the next kernel (e.g., 5.20).
> drm-misc-fixes is for fixes for the current kernel cycle (e.g., 5.19).
> See:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdrm.pages.freedesktop.org%2Fmaintainer-tools%2Fdrm-misc.html&amp;data=05%7C01%7Candrey.grodzovsky%40amd.com%7C9585d3814d9b4e51bfcb08da65de368d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637934302314091129%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=8IW3uNvSEogYjj%2BNKh1b9jkT5CaJ5osZ9GgEcI8zyqo%3D&amp;reserved=0
>
> Alex


Got it, Dmitry, I pushed this time to drm-misc-fixes so i hope this time 
it will be picked up for next rc release.

Andrey


>
>> Andrey
>>
>>
>>>
>>>> Andrey
>>>>
>>>>
