Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6977249DF1D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 11:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D495310EFEA;
	Thu, 27 Jan 2022 10:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2070.outbound.protection.outlook.com [40.107.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8E710F021;
 Thu, 27 Jan 2022 10:21:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqBcK05wFQuXHTCaaDEWielaG/dlgOK4JRMkCr7INIwUlbodbN1YeeojYu9xmJi/V3bdysWlzkCKxtgPUUJ16wNpHs+I8CbDwPonTVBuxUMyRp5xPY6GbxffUl/82cpoGvRo9HfV5OaEvvhor7RgAJbguAVEJaxsH5f2tRLIa5/XJ5a9Ii7Rilin414jhHoKH621wq49wIUYx4myJk/LXC/C+DilsGcGAHTFcRebO9npB6vF5iQlVZH1hE9/utYyORtNHod8VySVGPKnIkeEUuEnBSJ+xNjZpuyU4Axd+IY2efYmhVqXR+p/I0rPNoX/j2n8IhnBzxbjislCkvIjcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SCdIfOO789rzOSsB4ZGDEKz+L9VoHHN4lXQypsJrq8=;
 b=Lmtcb8HrscRs/nsOt7Uncvs4LC9gEGpC97ySVjUyngktAfzsCxkYd96iu+XUEixvnqQc4SqjYlXjS5RB9IiooKto6MYTYXVVxQd/hOhqfQdoXE8q9SCJaexoyPuR00Vhu/SCWpGmwy7o1oc9hfAwo9bKxxAJ4TrE+IdokLKjVZH396vNC5hq5SOMJ9CyaaOMgmlRb8ujatCYUxulrtvSGxrDTcgSbu7/2nviojFZ9A6bB0FgJxUSHJqr1Srmp6eRhcvB1X8siDnuWLzZrWbNeFg4Q8Zpe1uAyM8hMzZ9g/6ghJzFyw+ZXwItc7TQsdG1MxhH/1Nj3kmP8T6cSQz1CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SCdIfOO789rzOSsB4ZGDEKz+L9VoHHN4lXQypsJrq8=;
 b=d4saxqYuEq/8NQQJyp4oGLLRL3by0rfCbOgk3QJtPb4MKwkI3GrONYYvVqDTTv2Aigax/7+o3WUIbVRYDpeovxm0OzozupHiCDllWBeJr7qXQ3AIHWn9HRLlel8N74NH9dbbGQHT4p8OcOBtF2zFiH7hyY4VBxPUpe0ygHAivHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB2730.namprd12.prod.outlook.com (2603:10b6:5:41::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 10:21:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21%5]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 10:21:26 +0000
Message-ID: <27aed6b1-b465-6a52-2b0a-d748c9798414@amd.com>
Date: Thu, 27 Jan 2022 11:21:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 02/19] dma-buf-map: Add helper to initialize
 second map
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <f0dbdcc0-13b5-c484-0bf3-a1f8c3e48954@amd.com>
 <20220127075728.ygwgorhnrwaocdqv@ldmartin-desk2>
 <3066c6a7-fc73-d34d-d209-a3ff6818dfb6@amd.com>
 <YfJedaoeJjE3grum@phenom.ffwll.local>
 <20220127093332.wnkd2qy4tvwg5i5l@ldmartin-desk2>
 <YfJtLkdkh4yde20f@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YfJtLkdkh4yde20f@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR0301CA0011.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::32) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d856c0d3-5431-4084-696c-08d9e17ec660
X-MS-TrafficTypeDiagnostic: DM6PR12MB2730:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB273075A2C6E8FA09EE8ED4D483219@DM6PR12MB2730.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aCd8l9cQJk+5jM+DcUStQneLm2p2IdPf/E84Y4PF36W03k6N7lhmGW3hLKag9kvUNM9JD62d8EaQnXjYkQuGccUo/4KJZR0fYxobrVFjIyt3mENJ+G9V6+m0t5ugIfQNb9xE5JYiZcXjQbcJMooGjfouJRUqwP7reoH4S+LjLtrx05tiN6Hh1+zSUh1BkfRoZGbEwZyZi3+M4yLCxHiveUUg2lLHDOwqfDFe34C5gQPdzWO936kVgHBcDJyQCR3qo1Sk2vRb49gUgOymrM3Vxm8HjbChPNXAAv2AkLG7y3GgTzOSwo7kM2c0On0GSbsoWYK6CSB7hWn1uDL+ecavzDcMZHenmnJqHzToIxTdyX//E2k8s8eiaCjvQvk23n+Ewb/pESOLnVhjRYGI/wzkv9eWmcgk7EmdTyWXw51hrfsdtSH61Py82ZBiLkT+auQS6VWNm5j8431DJ1zJoKoWsj+2vchCZ5vi4ShppHgvmPwXqztmiLa8z1QKvayGUSjRkqDtd+bpvdcS3sF/e+ZDJOO9+1PvNb91HHjNRSJ/mts/jh0pnKqwWIePQheOUMPkNoa2L1GE1hUzLrqRUMbEHwlr+xLAhYidJL+59vA2wIljPULQHmObPRRKCZ4rMMGW+oIo1H1OTCRgwscuY1QZ7L5aASI/iB9wCQYnwGPNQ9BuKJoz3nxUuprYWKpucKvzz64E14JdFIxcRu6hskfm1uE/xHuxPTV6fbCmQ32JqP3hwCRWTNkIehMgeHUsUt1s57l35O2SKTu05nWmZ4Tyz+balO9KpQdKjYTBmqy7kpJbSlOBl1d7L9fPH28s3HZ+8WVb+irTE5HVj9ZQheVoCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(66946007)(2906002)(6486002)(2616005)(5660300002)(508600001)(45080400002)(6506007)(6666004)(966005)(66556008)(36756003)(31686004)(83380400001)(26005)(31696002)(316002)(66574015)(38100700002)(8676002)(66476007)(8936002)(186003)(86362001)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkVrZktUTDJXelBDT2tuSHcrNXZUcW92T2sxQUh1cWU1MGVhcnROYzNtSWxX?=
 =?utf-8?B?ZVJpbUpIejFobG43blV6cWRDUnd1d2dndlpjNkhkVmtnRFliempPWFM1a1FX?=
 =?utf-8?B?WDc1RjlsanJrZ1RvSzVnMWxjRUlBamNjeUUyY2VaeVg0OWExaFBleFRORERE?=
 =?utf-8?B?ODRYRHdJLysxdk5OT3FjQmUyMzU2cHR0cWZRS1ZGc21zWFcwY3NDcVlQU3Rj?=
 =?utf-8?B?dmgvbzc1TnFtcHVxYVdKeWFWMWJNZ0lpVUpHcC9YdnpBbllKKzZhWFFpVUJW?=
 =?utf-8?B?TU82QVI1MUw1VjFIRFpzM1kxY0RLdjZ5WDc0NkhXb2R6d0FoWmhJQUlSdUlJ?=
 =?utf-8?B?dHdrTFlNSTdXcHV4NERUcGFoWDkyczZBY2kxREFLTHNXaWMzdlU5RmlrODYr?=
 =?utf-8?B?MXBTV1ZCenlGNEVaOFhiOVJ1eEFDUkxES3VzMng2aUFNU0hGL1JlNk9FSjhJ?=
 =?utf-8?B?LzhCZzVRaGtVSENyeE9pNSsrcWVENHRvdFdQa0lNS21SWC83Z3UvWWdJT3lj?=
 =?utf-8?B?ZnB2akc2MmUzNkg5UXc4OFNTTC83a3hCc3AyWGFPYk5HRFhYRVp5STBsM2lT?=
 =?utf-8?B?Ri81SkNyb0tpZTQxbmtEeThYdGNzWmo1dTJvN2JWM2RZdlBUdlFjVEZ5VGVs?=
 =?utf-8?B?VXQ0OUcvS2tXTHRrRDZKdU9Za1pyTTQ4cWFJdk9EYzJuTklNcmJrbGM0NkJK?=
 =?utf-8?B?RFdjZERYekh2bkc5Tk82QmM0WVR5aE9OLzJhb2djWEErODlLNnJJVGNCVGRY?=
 =?utf-8?B?QmpVU0lna1hHZFovQVZNUjhjWEpiN1djbG1EdUcvQUlxRGNGMHNSTjJtVTg0?=
 =?utf-8?B?eXc3dmpSazFSRjh3S1dmbXFoYXBWRXI5TUUydkV1M2dySWY5TUY3QVlCeDcr?=
 =?utf-8?B?UW1EWEJvREVyWnpiYVBJSWNScmxGR3ZrVnloVXljRDc1Wm1WZmYxUlFxQk4w?=
 =?utf-8?B?ZWovVzRDZ2diTTZhazlFYlYrdDBsN3FCUStTQnRYcjUwTU1JM2E0MmhDKzkz?=
 =?utf-8?B?KzQ1cFNBYlNCeGRTcXBLa1lLSU8yN2NsczdoU2Jud3ZJbTVpMW9KZlVGS0hG?=
 =?utf-8?B?ZmQrdE0yaHJqMHptMXIwQkdFTnRia2h5Z0t2NmhTb0lpNjNtMWMwUmdyc1Np?=
 =?utf-8?B?K0toeXFBNGFLb1dvQVVnb3pIdVNUNnVndG5ZaTViMGZ6Q2lFbFNTOFJVenhO?=
 =?utf-8?B?T0tZRStRb1IrVXNkbEoyZ2NzUVFLcW12MjFGSkdnbkVNcGlKc0lWUURjZ1lW?=
 =?utf-8?B?SHB0MDhxdjdxaDUxNjhJK3BhZURPWHlHM2dGb1Q5dGQ2N3UvUnp4bU1wS1I4?=
 =?utf-8?B?cU55QnpVMTRRUkJGREc3NXM0V3A3ZldaMzcreVFWV1RTZFNBVE42VEpoQkRF?=
 =?utf-8?B?V2NwOG1jaSs2R1gzSUlWNjRSRElYK1BicUkzY1YvVzRJeGlBR3RZaHQrQlJC?=
 =?utf-8?B?TG1aaFJhNmpUbi9UdFVBd09oRnlJQmRlT3Z0NDRuaXlNWmIzRDQwRVFRVjVu?=
 =?utf-8?B?S2d1WVNtUXQvUTdFZTBoMWZLN0ZITzdQb1ROaGZ4aHp6ZDg5NmR0RU5jUE5p?=
 =?utf-8?B?OXRkR0pBVTZlTWpUUUluY1dCejVyNWlGT25OMW9RaGxBSk1yci9qU0FaZE1K?=
 =?utf-8?B?Q21xdVRIb3FXK001UHNxU2JPcEx3Z1RjSkZrSUkrcXovOFdSOXRIWTFvMlRl?=
 =?utf-8?B?RGVnTXhOem0waWtyUnRKWnpwZVhGbUgwdHNNYk93bkc4VS9uMnJGRXBOc2hI?=
 =?utf-8?B?ZllPckljOWlZVHA2SE9JSHo0YjFiaFY4ZGxqcnZ3TkR4NldTS1A1VXBTZ2hy?=
 =?utf-8?B?Z3dHR2JWTFNmbENESSswa1pMdzh4SkNnelorTFcvNjdBN2UxWFYwcHMyODNz?=
 =?utf-8?B?RDlrLzNjK2ZxT1h1Y1FZTno1bnlVYTRDd2dPUHNmMGR3V0dyaHVVVk53Ulhn?=
 =?utf-8?B?OGhrS1BISmdWcmRLWWgzRUZNQ2Z2SDZ6aVF6T05oNFdVK1ZUMktZZjZ3Y0Fp?=
 =?utf-8?B?b2RwN01iNFBFU3ZGM2xXMDBqQTRGSzVDLzZqdHg3WmcyWHhmR1dhM012NzA1?=
 =?utf-8?B?K254aHU0ZklOejBKd09menp1TWtpSEUveVdXeEUydnZOTStHNmlXSG9MS0Zm?=
 =?utf-8?Q?Cuaw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d856c0d3-5431-4084-696c-08d9e17ec660
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 10:21:26.3096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: to9H60eyVTeQqU0cj4t8Yq09pzx1tTzpv+wr01i1oRWydByceY681dHZmzxHAo/4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2730
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

Am 27.01.22 um 11:00 schrieb Daniel Vetter:
> On Thu, Jan 27, 2022 at 01:33:32AM -0800, Lucas De Marchi wrote:
>> On Thu, Jan 27, 2022 at 09:57:25AM +0100, Daniel Vetter wrote:
>>> On Thu, Jan 27, 2022 at 09:02:54AM +0100, Christian König wrote:
>>>> Am 27.01.22 um 08:57 schrieb Lucas De Marchi:
>>>>> On Thu, Jan 27, 2022 at 08:27:11AM +0100, Christian König wrote:
>>>>>> Am 26.01.22 um 21:36 schrieb Lucas De Marchi:
>>>>>>> When dma_buf_map struct is passed around, it's useful to be able to
>>>>>>> initialize a second map that takes care of reading/writing to an offset
>>>>>>> of the original map.
>>>>>>>
>>>>>>> Add a helper that copies the struct and add the offset to the proper
>>>>>>> address.
>>>>>> Well what you propose here can lead to all kind of problems and is
>>>>>> rather bad design as far as I can see.
>>>>>>
>>>>>> The struct dma_buf_map is only to be filled in by the exporter and
>>>>>> should not be modified in this way by the importer.
>>>>> humn... not sure if I was  clear. There is no importer and exporter here.
>>>> Yeah, and exactly that's what I'm pointing out as problem here.
>>>>
>>>> You are using the inter driver framework for something internal to the
>>>> driver. That is an absolutely clear NAK!
>>>>
>>>> We could discuss that, but you guys are just sending around patches to do
>>>> this without any consensus that this is a good idea.
>>> Uh I suggested this, also we're already using dma_buf_map all over the
>>> place as a convenient abstraction. So imo that's all fine, it should allow
>>> drivers to simplify some code where on igpu it's in normal kernel memory
>>> and on dgpu it's behind some pci bar.
>>>
>>> Maybe we should have a better name for that struct (and maybe also a
>>> better place), but way back when we discussed that bikeshed I didn't come
>>> up with anything better really.
>> I suggest iosys_map since it abstracts access to IO and system memory.
>>
>>>>> There is a role delegation on filling out and reading a buffer when
>>>>> that buffer represents a struct layout.
>>>>>
>>>>> struct bla {
>>>>>      int a;
>>>>>      int b;
>>>>>      int c;
>>>>>      struct foo foo;
>>>>>      struct bar bar;
>>>>>      int d;
>>>>> }
>>>>>
>>>>>
>>>>> This implementation allows you to have:
>>>>>
>>>>>      fill_foo(struct dma_buf_map *bla_map) { ... }
>>>>>      fill_bar(struct dma_buf_map *bla_map) { ... }
>>>>>
>>>>> and the first thing these do is to make sure the map it's pointing to
>>>>> is relative to the struct it's supposed to write/read. Otherwise you're
>>>>> suggesting everything to be relative to struct bla, or to do the same
>>>>> I'm doing it, but IMO more prone to error:
>>>>>
>>>>>      struct dma_buf_map map = *bla_map;
>>>>>      dma_buf_map_incr(map, offsetof(...));
>>> Wrt the issue at hand I think the above is perfectly fine code. The idea
>>> with dma_buf_map is really that it's just a special pointer, so writing
>>> the code exactly as pointer code feels best. Unfortunately you cannot make
>>> them typesafe (because of C), so the code sometimes looks a bit ugly.
>>> Otherwise we could do stuff like container_of and all that with
>>> typechecking in the macros.
>> I had exactly this code above, but after writting quite a few patches
>> using it, particularly with functions that have to write to 2 maps (see
>> patch 6 for example), it felt much better to have something to
>> initialize correctly from the start
>>
>> 	struct dma_buf_map other_map = *bla_map;
>> 	/* poor Lucas forgetting dma_buf_map_incr(map, offsetof(...)); */
>>
>> is error prone and hard to debug since you will be reading/writting
>> from/to another location rather than exploding
>>
>> While with the construct below
>>
>> 	other_map;
>> 	...
>> 	other_map = INITIALIZER()
>>
>> I can rely on the compiler complaining about uninitialized var. And
>> in most of the cases I can just have this single line in the beggining of the
>> function when the offset is constant:
>>
>> 	struct dma_buf_map other_map = INITIALIZER(bla_map, offsetof(..));
> Hm yeah that's a good point that this allows us to rely on the compiler to
> check for uninitialized variables.
>
> Maybe include the above (with editing, but keeping the examples) in the
> kerneldoc to explain why/how to use this? With that the concept at least
> has my
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> I'll leave it up to you & Christian to find a prettier color choice for
> the naming bikeshed.

There is one major issue remaining with this and that is dma_buf_vunmap():

void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);

Here we expect the original pointer as returned by dma_buf_map(), 
otherwise we vunmap() the wrong area!

For all TTM based driver this doesn't matter since we keep the vmap base 
separately in the BO anyway (IIRC), but we had at least one case where 
this made boom last year.

Christian.

> -Daniel
>
>> Lucas De Marchi
>>
>>> -Daniel
>>>
>>>>> IMO this construct is worse because at a point in time in the function
>>>>> the map was pointing to the wrong thing the function was supposed to
>>>>> read/write.
>>>>>
>>>>> It's also useful when the function has double duty, updating a global
>>>>> part of the struct and a table inside it (see example in patch 6)
>>>>>
>>>>> thanks
>>>>> Lucas De Marchi
>>> -- 
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C0654a16ea3444271d7c308d9e17bd35d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637788744226808874%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=Q6soluBglaZLhLszdapaWuUVsqMq5qvJOKiJjO%2B9BTg%3D&amp;reserved=0

