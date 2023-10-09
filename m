Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B977BDC3B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 14:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918CC10E002;
	Mon,  9 Oct 2023 12:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DC910E002
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 12:36:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzyAfxtchGmksVw8tqXK0YDpfcN5OPBSH2QI4IBYJcwvlabB0KxJNbd5IpvtghSymSSChJ79dGYl0q0IXnEuJrWfjXQXd6kUJHtS0RkDs3689D9gR8bCh3or+5/Tm+V6QbhSBtY+cVP4Rm6N5fHXktCdEVEWVHFiGfT66QbrWOuFeXkT2fnSglWf7d3icvFh3XhAOHMZg/UdhBZkAgYU67F0yc0SjkVbTURAyasoWfoIHOYHFkjkyGaliZIeHtI/u8JIRe7kmSBXC7hdKOpxO4b4JHTY95H82ysY99351CWMWaTDddg3iiMZTn9uiimwNYqEKSwK2Pl3qW3Eso+kcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpbxcF641nv7wd6dDNcBQ/1/ZCO9vhvY2s9EefKsKYk=;
 b=NIDybr9bYcjBVEaNGiK2YAx1rwrSDR1vvpsCPjel5uybH31v0ipl0add/WqE0S2cuVKx0GXkA2pW0XPY7m3iXMMI069gnrrM6/GIBkzlu9NacRTF8HISBQSUD6LggGYFmC35hf1UjIMeIJvOa06AQFYTV2GQrhpgTaxWou7wgw9OuEmi2D2PRYs0rDQViaT0kI+ovJVAXbqaqa1s5tVGxflhR4Dq5TcyZClPi4/1e0NAXbAT+j2LtaJ1GtIRnW1wDOve+dQE2noj/c9iBaHfYXtgp/km+zM3XANZyXv1Kmfd1oBkT/tXt09iO9s7tJ0bkiTw8+C+CDfQoKae27Z3Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpbxcF641nv7wd6dDNcBQ/1/ZCO9vhvY2s9EefKsKYk=;
 b=oh+x0q1Oj56ml7EJoq4hZjSLlqggznZQDXr0jxOG0NkbyJjBvNmC3jBcGFsegqg37GR1yxsKqVX5ulG3ut5+1m1pejlJwW1jjBoRukMoK+rigYx4oyFr8vJDN8VbO8jABjNPe5cjdzL0p2SphzsHJTgQ9b7Y4mvlnIHkbtEMe0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB5931.namprd12.prod.outlook.com (2603:10b6:208:37e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 12:36:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 12:36:22 +0000
Message-ID: <dc0c733e-df75-42f8-a920-cca8eebfa0dc@amd.com>
Date: Mon, 9 Oct 2023 14:36:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
 <CAA_UwzL=2PjeH_qW2GJa_XzJCeWkz9NcokPQX3-qn2f0iPz+Rw@mail.gmail.com>
 <90e7f66f-96bf-4e90-88c8-75019bc506a4@amd.com>
 <CAA_UwzJ7q8aq_iw3wimeQXmvKp8Z253J7oqi3UQqcKdkRmAcAA@mail.gmail.com>
 <9f9b50fa-8bad-4e96-ac60-21c48f473fc6@amd.com> <ZSPv1iAwJMgnsDu3@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZSPv1iAwJMgnsDu3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: f95b27f8-354a-482a-d0ec-08dbc8c4587c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jPh7f8RnAkSLhBs7KAp/6MDIRPBwr1eRSnGTaWZL+mqdRtvnIvWV0ANRhcFcsZb0gvqtkaEYbuBo1nsWFUvLJcGk8oP7EgBGTnfaaCWqiIjedIouWaK9+879Qhz3ktf464NVuTWsbYu8AymbCSivnQaQkeCDURIw/shOcF+P81xY00ur74o4/nz+JF9XRdwNWAH3kMOmyJ1auJsLDRGWVpEZ49P00iYp0nbx9Iy1RiMHXKjmTmIsZDn9TLcLhjJjivrEgzXHj7zUNefBY8WRJLNYw/h2J9Ct4q8vwsp9PkfErDx9lNZKet0ALELx2nOVRrltQJ9Yft/FUnwtCMRNkoK/w6DgJ5v59/mjCBQ4B6yjWQKWIC30zRVK6rze4/vu8Q5Zq4gaMgPSgYTyXbVexUSfA8LlExtwfyoOeSux2S+DLGlawNYCnobEeZt2YR0fiK2MJupt5TfYLpT/pKzQhSL4cqpiGD55rbXzPTkUqV5rBx4CqqF5az+YvbpFxZMxqOpBsECLZUKPiX5kDoSQJEC42Pum8ULEZJ9JMfnToPIq/1DpaVFvJIRxr0GdNGIUk36JGRoESForaI7z4IBlGsgvkXGJh5lG2aUGY2xrhdOeIrteYL9sMJHihPPeYYu99LC8BCGwh9krggZ4y8P43Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(86362001)(31696002)(38100700002)(36756003)(31686004)(66946007)(6512007)(2906002)(6486002)(478600001)(5660300002)(41300700001)(8936002)(4326008)(8676002)(6666004)(53546011)(6506007)(83380400001)(2616005)(66556008)(66476007)(66574015)(54906003)(316002)(6916009)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjUzWFd2VmxkQnVQT2xRQ0JmYzhPOFl4VkloL0VzSVlEeEZqWnl5QklMbDd5?=
 =?utf-8?B?RTdGcmUzb2c1ZjkwSENpaVpiOUxVekFEN2wzdWJPSk9rcmhIVlBhKzdwZXoy?=
 =?utf-8?B?R0hya1VMSXdTaXZ2RzRsSVBmaE5HczRuaTBENUgyZnFyT3FHY1dQLytFL01I?=
 =?utf-8?B?aUgyaWNFa0pac2pjZGJHVnZqbjh0Tzc3ZHZxbVFxTlVwbEJVTHRVclNZdExW?=
 =?utf-8?B?RDcwOWJBTkpZMHBxR0h0ZHB0N1FUY241aWVEK3R3UlZHTGp3TXJyRXEvMWx3?=
 =?utf-8?B?Ulc2aGIxWVdpdEdRbUFuSEpVenVndHpDbUtGWTFMa3hTRGluNTdFOGpkOVB0?=
 =?utf-8?B?ckUwMGVPRlhpQ2NzQTFMdDZacjRoWUZITDZwL256VTlNQ1l3UWhGckpXeDZo?=
 =?utf-8?B?ZGNDTFQxTTVJOExob2xxMTJlVDI4SlJPWEJlaml3OHhGL005RmFpSmErbzha?=
 =?utf-8?B?S1d4am1WQnJab0c2UnBIdUlFTngrSFBaOHArTi9PV2VWblhrclMyeEorRkls?=
 =?utf-8?B?bFhFQm1IUCtIUlRRVVNab0o1bUc3ODFyclE5NEs1dW54VFJoTHdKMmdvU2RM?=
 =?utf-8?B?OWJVZTRGbGl5YlpzRVhpK3dMa2l3UUk0cXJ6WXN4a0gydFViT3R2SFZFNDkr?=
 =?utf-8?B?c1B6VlpwQTRzOTA0L1poYXBHUWU2OCtTaFFUVmp5bFFtd0lFT2I5R2ZVZW00?=
 =?utf-8?B?T0YzSWFzNHhxOGltcTNhaUx2cVhRaWRPaTJtTTBBUE5reGtsdFNERHB1cXIy?=
 =?utf-8?B?QXNOU01wUFN1M3R5UFA5aTVxOEtoZ3VpM0k0Q2FsUGVxckJobUVMeVpXUDVI?=
 =?utf-8?B?ckozV1VqN2xDOTRuN2k4MEltWkhEYm9XbWFRSnJmNkVDQzYySG50RU1wQy96?=
 =?utf-8?B?Q25vcUovcUgweVFkaktIeld0K1U0WEhvTHlieUhlSzJFK1lhQUprOUozbE9s?=
 =?utf-8?B?MElhM3lQSm5QVmJ5N2h5cFFQWnc1U2dmd3dSTTMzUFRwaXhLbzBUQkIydWt6?=
 =?utf-8?B?Mzg0b0duQWJMUTZCNitoYW9OcXdMZWJQMmNmT29MQ2pjWXNQNS9YYVhkeTcx?=
 =?utf-8?B?WTVWMkVqclBsTDJiQWdGdWtmZU9RYTNkNXpJb0tNVFJ4VTYxbjh6bjluODFB?=
 =?utf-8?B?WEFsOThtejNaRXNhdGJZRUxNeW9yKzlYVkpDOENySUxuUnlBS2hsY2w5cHhq?=
 =?utf-8?B?bWQ3SXExOUpveklhbmwxdzl4R3pxRmpDMlVITVZMZ3BZSW1SMStVNEoyS1Vu?=
 =?utf-8?B?MFRHU1NucXJiNHlRN3RYM0wzQUNnWEdXaEcxOWFacHhhM2YzL0xFWm44UXBu?=
 =?utf-8?B?TlA0K2ZyVzhKZGFWMUN1TDR2R1UyZHVjcjhEK2JxWHgxaVJYTnM5cXZUcVhV?=
 =?utf-8?B?MUFMM2tleVRxS1FvRUJVVmlqN0VwSTFIU2pLbi82bEpDOEJMcWVmbnRKeXh0?=
 =?utf-8?B?amtQRHNJTG5jeTlLYnRYSThYMnloaEVYV0lqSXh0RWZjSE5hTG4yb3JZSDZ6?=
 =?utf-8?B?NmpRZ3RORm9iTWRYMGQyWjM0dEFnZldRaStoMUk0Zk9MUm1WUWxyRUxtUytl?=
 =?utf-8?B?TDlTNWtmQzlSUUlMOFBYQzE4Qno4dGV2b1djQkUvekYyTGpuOUJuVzdFcWNV?=
 =?utf-8?B?K0Yvdjc3UElJb3NobHZTNTNsUzVqMmJqcVU0S2l6WVkzTUdIMWVaelNNem1z?=
 =?utf-8?B?Sm1GbzJidUtTRlhXTHBpUXFhTzg4WitRZnd5K09nT0xBNkZpbEpqTHROMC9X?=
 =?utf-8?B?YkI5T0QrZGQ0M0RIZy9UUW81a2NOODRCbXNWMUlGRFlaWlRaMjFLMzczd2hk?=
 =?utf-8?B?SGpqaUZaQ0NHL1VlcTFieGw0UFB0M1dFOVZwK1dYSXlTbHExc080VGNCZ3h4?=
 =?utf-8?B?Nk53TUtMQTZ2TUFDYmVqMk1KdktVZzhObDdpZDNsSUV6bEF2S2h0WlpIaFJz?=
 =?utf-8?B?UEVma25hM3lHY3FBcHk4cE9qeG9JZ2NmMW9DZVdBdkNFTHBSTm5KNWg0cnVt?=
 =?utf-8?B?VXJBNTNzc2Z1VnNrd0xhSWZmUzBsVXdFVDlrV0kvNlF1b2F3UFI4b0xwYlpk?=
 =?utf-8?B?aU5EV0pYcDFuU2dhZzQ4dkEzTTVIdy9tdERhNEYrajl2NHVoZ3dYbkFYejJr?=
 =?utf-8?Q?AXNA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f95b27f8-354a-482a-d0ec-08dbc8c4587c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 12:36:22.8615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzYN1Ki3XVdSvdC259yowpqnXI6XYrEtX/ts/kDVht5wWLV8bopNgpbqwb3q9m2e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5931
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
Cc: Ray Strode <halfline@gmail.com>, daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, mdaenzer@redhat.com,
 alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.10.23 um 14:19 schrieb Ville Syrjälä:
> On Mon, Oct 09, 2023 at 08:42:24AM +0200, Christian König wrote:
>> Am 06.10.23 um 20:48 schrieb Ray Strode:
>>> Hi,
>>>
>>> On Fri, Oct 6, 2023 at 3:12 AM Christian König <christian.koenig@amd.com> wrote:
>>>> When the operation busy waits then that *should* get accounted to the
>>>> CPU time of the current process. When the operation sleeps and waits for
>>>> some interrupt for example it should not get accounted.
>>>> What you suggest is to put the parts of the operation which busy wait
>>>> into a background task and then sleep for that task to complete. This is
>>>> not a solution to the problem, but just hides it.
>>> Actually, I think we both probably agree that there shouldn't be long
>>> busy waits in the context of the current process. After all, we both
>>> agree what the AMD DC driver code is doing is wrong.
>>>
>>> To be clear, my take is, if driver code is running in process context
>>> and needs to wait for periods of time on the order of or in excess of
>>> a typical process time slice it should be sleeping during the waiting.
>>> If the operation is at a point where it can be cancelled without side
>>> effects, the sleeping should be INTERRUPTIBLE. If it's past the point
>>> of no return, sleeping should be UNINTERRUPTIBLE. At no point, in my
>>> opinion, should kernel code busy block a typical process for dozens of
>>> milliseconds while keeping the process RUNNING. I don't think this is
>>> a controversial take.
>> Exactly that's what I completely disagree on.
>>
>> When the driver is burning CPU cycles on behalves of a process then
>> those CPU cycles should be accounted to the process causing this.
>>
>> That the driver should probably improve it's behavior is a different issue.
>>
>>> Actually, I think (maybe?) you might even agree with that, but you're
>>> also saying: user space processes aren't special here. While it's not
>>> okay to busy block them, it's also not okay to busy block on the
>>> system unbound workqueue either. If that's your sentiment, I don't
>>> disagree with it.
>> No, it's absolutely ok to busy block them it's just not nice to do so.
>>
>> As Daniel pointed out this behavior is not incorrect at all. The DRM
>> subsystem doesn't make any guarantee that drmModeAtomicCommit() will not
>> burn CPU cycles.
>>
>>> So I think we both agree the busy waiting is a problem, but maybe we
>>> disagree on the best place for the problem to manifest when it
>>> happens.
>>>
>>> One thought re the DC code is regardless of where the code is running,
>>> the scheduler is going to forcefully preempt it at some point right?
>>> Any writereg/udelay(1)/readreg loop is going to get disrupted by a
>>> much bigger than 1us delay by the kernel if the loop goes on long
>>> enough. I'm not wrong about that? if that's true, the code might as
>>> well switch out the udelay(1) for a usleep(1) and call it a day (well
>>> modulo the fact I think it can be called from an interrupt handler; at
>>> least "git grep" says there's a link_set_dpms_off in
>>> link_dp_irq_handler.c)
>>>
>>>> Stuff like that is not a valid justification for the change. Ville
>>>> changes on the other hand tried to prevent lock contention which is a
>>>> valid goal here.
>>> Okay so let's land his patchset! (assuming it's ready to go in).
>>> Ville, is that something you'd want to resend for review?
>> Well, while Ville patch has at least some justification I would still
>> strongly object to move the work into a background thread to prevent
>> userspace from being accounted for the work it causes.
> Aren't most wayland compositors using nonblocking commits anyway?
> If so they would already be bypassing proper CPU time accounting.
> Not saying we shouldn't try to fix that, but just pointing out that
> it already is an issue with nonblocking commits.

That's a rather good argument, but for async operations background work 
is simply a necessity because you otherwise can't implement them.

The key point here is that the patch puts the work into the background 
just to avoid that it is accounted to the thread issuing it, and that in 
turn is not valid as far as I can see.

Regards,
Christian.

>

