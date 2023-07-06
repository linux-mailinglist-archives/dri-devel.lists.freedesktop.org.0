Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD5174A225
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 18:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2C010E46E;
	Thu,  6 Jul 2023 16:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY4PR02CU007.outbound.protection.outlook.com
 (mail-westcentralusazon11011000.outbound.protection.outlook.com
 [40.93.199.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD4910E438
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 16:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oECreu+RNaj3mvTnE3f6AyVKcQektFesNsGtBbMNoSSujdYQsegkOk3Q91pvXih9d7obUONGfAjk7I/H5ZIMwMygWAsTpS1jnhzR74oGZ5L9v0VdtfvNzX9hD1Hb1+vQ6k20+B77vsypbfYXdgCu096/txINqNDts7xmudJZ3upwdock88f6ErUPvpnOQvQoXRaY/9Ca0QScwxPH/SIsXFfFvbKNpqxMPk/mDMI8E8qTJD4X5+4ck1seAxTuOFJ2NSRK6vKcmzy05pCTCAOn9Wt+MkPudkEzDFvAXK1Bjx7+BV/KGfO4IyZ+xAf6ZNf67S92z9Faj5E+f+Gu66EfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2VMsz3FmaBs99s6v8MxbCo1dlrCpRI4QO3qmW+d3As=;
 b=ZwI+8g0hABoNRjV4SXw6ZG/ls+pKK6OTkZNApjtjVuASP3V9QohdKHqayC3NOJFmqRQK84MZPvqUQjg9uyFqTBwB4T63YYBxFygAIh8yaIDOQZmfYaH+QptnUeipVzzlegX77qkgRqz8uWTGYBJbohzFvh2M+ut2tdVSDi9EY+WWaG5z/dFm43DdPpAv0H9dck+6jbjtKn5IFMuD+j+pMqq1b7aFcyZ9gIxHMHeE49nKu8BmbmQ0V1z5AGjH9D+INdVnZtt6h0BUCzz/5InxyL1eEuSsYEdspy7R+PwNLm+ozuw0PCMCZlaQ0yLhIIKa2bZCLPnukIf/IJTsUlCv8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2VMsz3FmaBs99s6v8MxbCo1dlrCpRI4QO3qmW+d3As=;
 b=T+OcRuOEbZMCeT8DGM+KHw0if19y4vMjtB+ZEZSRiYrDCC223OtWYvUCz1bFL1IiG+M94fkhnODYCKFet9VAo1ZRVCiAB2IgzLeGplrP3+ZcBT6ytuNYFQY9eoFG2NdjHg+dWLw6R1Q9eAhgxPYwl8VL0fsZ1B0dGttfEeGWocc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from DM5PR05MB3371.namprd05.prod.outlook.com (2603:10b6:4:45::31) by
 SJ0PR05MB7248.namprd05.prod.outlook.com (2603:10b6:a03:28c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.24; Thu, 6 Jul 2023 16:23:50 +0000
Received: from DM5PR05MB3371.namprd05.prod.outlook.com
 ([fe80::5f94:a9ef:c567:e801]) by DM5PR05MB3371.namprd05.prod.outlook.com
 ([fe80::5f94:a9ef:c567:e801%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 16:23:50 +0000
Message-ID: <247b630c-8b16-7c33-987e-8b3451be3c70@vmware.com>
Date: Thu, 6 Jul 2023 09:23:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org> <20230628104106.30360b55@eldfell>
 <20230628105424.11eb45ec@eldfell>
 <2fb2f3985df4d6710e5ad33f6e618a52004714df.camel@vmware.com>
 <20230629110348.3530f427@eldfell>
 <6c5449cf-b7a6-1125-9493-0fe968166915@vmware.com>
 <20230704110845.490344f5@eldfell>
 <ce7754be-8085-ffd1-93f3-a774f7fcdb87@vmware.com>
 <20230706110146.0abeda0a@eldfell>
From: Michael Banack <banackm@vmware.com>
In-Reply-To: <20230706110146.0abeda0a@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::31) To DM5PR05MB3371.namprd05.prod.outlook.com
 (2603:10b6:4:45::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR05MB3371:EE_|SJ0PR05MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: bc278206-efa0-42d3-7d4b-08db7e3d61bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DnKVVXqnxTedkLBIMORdZSTn4YL2JHR21rFhZ7yZ87tTvfVBEFVVPhJCiM4T419UMMqiZ2OkkEl9xj5qbqLSuF7k2Zdej4P0zASESVsN/dOlSk//vq+wOoNk5UC8OGpM/UJj+XWk33Ix5h8Gk14O24sZiZiTyF+Gu93mz2oJpVEpZLCkxQ+MI1ImjzL5VbtYTNM5G1xE3YaITNgnk5KEsBb1b7+9runRHiEeNuroD83PZ6Hq0FBuZaErTqlZCJikwQ/gtB8u6xFbAROWETRAf62wklQykYVNGkBlEABbLb0fXhnhqx6MgIhxuffW2bgTzlC1ks+9rRZ+zjPgOEAD5f4yRFeJKOwvkBULwri1PvW7IWzxv7VLFhXozlF1Fv1ZbZINYvehmYTQscA9jyuuTXWAtkpAkAAcasKYLCvrW7dEANxfseROwDUjTzjYJYX5fn4fI+c4RP8kJL6QWiyvQ92rfPjHLAfGDewCYY6dtA/JyGLFlEqLf/+bCUNsmdnpxmEprK9udm6/2N7nfimVWn71m0D2ApvJFkJTFC7ylNruov14M241O/JNtjb0cPszVNe0CFaFCvbSJISQ8tTkflNy2cLZFga7kOA3xLYyevTiluVlKiXaYqrWkp9Fez2Ofa2w1ABdssVRFWvKI9F9YDF8rI37TsS8LiDyVTvkH9/x81mdreTdJjFPg8mu4Oc5lDHe5M7zUQ4GO+2JHfVioQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR05MB3371.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199021)(31686004)(7416002)(316002)(66946007)(4326008)(66476007)(36756003)(66556008)(6916009)(2906002)(8676002)(8936002)(66899021)(5660300002)(478600001)(83380400001)(41300700001)(31696002)(30864003)(86362001)(54906003)(6512007)(6666004)(6486002)(186003)(26005)(38100700002)(66574015)(53546011)(6506007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVd1M2ZVWEwvbWFPNWVsaStnbE9jSjFodzdmUzdWU0lnZVhsb0pLUzdSMVZ3?=
 =?utf-8?B?cGFZL1ZPM0JLRXZvK0R5cW9oTEZNemdvSExqWkg4LzQ5RUwyRHJCdm9ucXh6?=
 =?utf-8?B?L2kxWWU0MDNPR0g3NjBRd1NmRnVINVNYQUpRMWJJNzhqNjJWUm5JcVpJOGc3?=
 =?utf-8?B?ZVVoQUpjMFV5ejZ0U0FOWWtXdEdBeFBGSExhZk9zK1llQllJTG04OVJ3blRK?=
 =?utf-8?B?Y1F1ZmRHaTBFMXR2MXNCSE5SUVJvK1J5Y290SmVEYlZ2c1NIbTk0OWMxUWJu?=
 =?utf-8?B?MVdpNmZMdUJkNEN0SitiNFMyOXNyeCtQMFZsVklNeXc1RGdUZXh1bTNDK3ha?=
 =?utf-8?B?b1I4WFFqbElsdWZLcWZhU3pNVS9CWGI2QnZCTVJJNFg4MUsySFRGSkN0NGNN?=
 =?utf-8?B?SGYxVmgvRVMrdWpoclVuMXpBc1F2TDNOd3ZNdU5CVjUwZHRNK2Z2RkpKZkNr?=
 =?utf-8?B?Z0J5N1hZQk56RDY5cS9PRGNFOU1oSzVkMGJGb0tiTWJ0S2JBYmJ2M3dkRWRp?=
 =?utf-8?B?TDcxdmlqaFlDdWRtWXBsWTB4NFhPZWVoanRLMUJDTkx3OXI1WEY1eFpoSmZB?=
 =?utf-8?B?NXc2Yit6YUZsNXpLV0hLazlDRGpoenN5QUtURmc1WG5JSGJPVFVYbWVoNGhK?=
 =?utf-8?B?bTE5dXhEUStWY1RsaVpKVndHazlqL0xQR09sc09jbzA4S2E1RWdaNFdZaVVP?=
 =?utf-8?B?SHN1eWFaWUZsbm9MYWF0dnJqOUR4RlpvSjdVemY1WDhPOXNPWkRFOU01L0p4?=
 =?utf-8?B?Nzc5RWpvcTlNSk1xUE5McUhvRVZILzBubUtUalp6VE5VZHM0Mit5dU01TEJW?=
 =?utf-8?B?Q2R2RllvdjZaOVVMbzhoVURZajN1S0k3Tk5iTGozRVE5MmJWV0p3QTYxZlFh?=
 =?utf-8?B?NVNJaTRWSW5tNHFEdjh6SUVZQ3pUTDJmb0tjblBYY05lSmF4aTZBWFFDZG1x?=
 =?utf-8?B?b1pZUWZqZHA1bWZUM25NUEdFQVRBbTgyb3FLZkVFVitzUENxTHcvN1RSeVJs?=
 =?utf-8?B?SDVVVlhhcWF0U3oydWVraFlLQnpQQWh0cFF3T25nSmdVSE9vUWFVZXl1TE13?=
 =?utf-8?B?aEZ2VytRMUVJN0FXUE5pNk9XTEl6cUNNYUd2ZGJTY20zNUorYkhtRWRsdldV?=
 =?utf-8?B?THN4OEdoN3VxYkRoMHV1eWF6T1dyT0FiMnFKMC92SGZJbDdabDFiYVR2L1dD?=
 =?utf-8?B?NGdBaDAzSWZ4Mkt6NU5hWURYUjM3Y1hqRVNuamhXb3FuQ1RzVy9yMldqTlZB?=
 =?utf-8?B?Z2FQTjVlUW1DaWtaclo4bVBiNU1BWStUSDVRZDIyWWZyVUtCMTNsMTBFTGNK?=
 =?utf-8?B?MGtNT2pRSG93SlU0MFU4aGJKMjc2QVEvMVE5SEc4RGVZamZmRGpKcXhvbGNI?=
 =?utf-8?B?aEpmdVdMUTdTWXJ4Yy83cHV2QXBjejRzTlJXQVFiU2ZRY1RyeUZ0dUd4Rkhz?=
 =?utf-8?B?UExQbWR6RHNKZUliNWxQVjJydnlLb0YrSWtTUDlmZzNwT2I1ZHh2ODZ1Y1JM?=
 =?utf-8?B?Z1lLWlFxd0JuM3EvMUFaekF1akpxbDRHbytoUENPNklnZlNDUE1rL3dpcTQ4?=
 =?utf-8?B?ZnBxdlozdTRRVzIwcG5CdUUwL1VoRUd3ZE1tWFFGSU00blMwaVNKWDloTDha?=
 =?utf-8?B?eXBUNm5vbmQrSVZYYWlCNXljdDkvRFRGbE9ZMzBzZ24yUkxKTEVqdnRmN0Nt?=
 =?utf-8?B?V3grOWJyYnJXMlR1bVVHSEh5UTI5ODlIODJ1ZjJBU1dtVDJRY1VxcnNuUWJp?=
 =?utf-8?B?cWpTUzErcHJpZmFzSXprYVNjN2JFb215RVhHUGdaNGFqanAvMFNaOWFaRGhz?=
 =?utf-8?B?VmpjSlRxTDJQa0tJYjNWV2tiYkxzdDRUVGtoTUpsa2FSM0xQbmZybFJzbkta?=
 =?utf-8?B?bURsWU04dFJnRldjTm94VW83eXNKbS9KRm5jd0RFSkNvTlMyZHlma3dXWTA4?=
 =?utf-8?B?eU1lUExsRFd4cTZlMno2Z3BTK28yNE9iTWd1dlgzSSt2SG9GMjdVK05iTTgr?=
 =?utf-8?B?UFR6MWpkT3BoNGplQ1Q5M1lCMkc1YzJFZDlSZ1F4SVI0aXdCK2FmMlQ2NUhI?=
 =?utf-8?B?ZGxhZWxpNDE0SFFKaFAzeVZwTXdCOVAxTFJLK0dBdXRWQjVVZ0s5SWMvU0o4?=
 =?utf-8?Q?UitFiHxjlgtZX5T7OT1yj0fXS?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc278206-efa0-42d3-7d4b-08db7e3d61bb
X-MS-Exchange-CrossTenant-AuthSource: DM5PR05MB3371.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 16:23:50.3389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjYnOp2SgNmv7q3ww8XzaeYZ3ENHi+wKjAbqW+6Ks194+0YEMM48kTX5bGGOKX0AJpxp8+IZeaX8N7Tozbr6Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB7248
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>, "zack@kde.org" <zack@kde.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/6/23 01:01, Pekka Paalanen wrote:
> On Wed, 5 Jul 2023 09:08:07 -0700
> Michael Banack <banackm@vmware.com> wrote:
>
>> On 7/4/23 01:08, Pekka Paalanen wrote:
>>> On Mon, 3 Jul 2023 14:06:56 -0700
>>> Michael Banack <banackm@vmware.com> wrote:
>>>   
>>>> Hi, I can speak to the virtual mouse/console half of this from the
>>>> VMware-side.
>>>>
>>>> I believe Zack's preparing a new set of comments here that can speak to
>>>> most of your concerns, but I'll answer some of the other questions directly.
>>>>
>>>> On 6/29/23 01:03, Pekka Paalanen wrote:
>>>>> Is it really required that the hotspot coordinates fall inside the
>>>>> cursor plane? Will the atomic commit be rejected otherwise?
>>>> Most console systems require the hotspot to get within the cursor image,
>>>> but in theory it's semantically meaningful to have it extend outside the
>>>> image.
>>>>
>>>> VMware's clients in particular will clamp the hotspot to the dimension
>>>> of the cursor image if we receive one that's out of bounds.
>>>>
>>>> So I would assume the right thing to do here would be to allow it and
>>>> let the clients figure out how to best handle it.
>>> Hi,
>>>
>>> if it is normal that clients clamp the hotspot to inside the cursor
>>> image, then I would come to the opposite conclusion: KMS UAPI needs to
>>> require the hotspot to be within the cursor image. Otherwise the
>>> results would be unpredictable, if clients still continue to clamp it
>>> anyway. I would assume that clients in use today are not prepared to
>>> handle hotspot outside the cursor image.
>>>
>>> It is also not a big deal to require that. I think it would be very rare
>>> to not have hotspot inside the cursor image, and even if it happened,
>>> the only consequence would be that the guest display server falls back
>>> to rendered cursor instead of a cursor plane. That may happen any time
>>> anyway, if an application sets e.g. a huge cursor that exceeds cursor
>>> plane size limits.
>> Hypervisors are normally more privileged than the kernel, so any
>> hypervisor/remoting client here really should be dealing with this case
>> rather than trusting the kernel to handle it for them.
> Sorry, handle what? Trust the guest kernel to do what?
>
> Personally I'm only interested in the KMS UAPI the guest kernel offers
> to guest userspace, and requiring hotspot to be inside the cursor image
> is fine. I don't think it needs even a strong justification, it's what
> most would likely expect, and expectations are good to record in spec.
>
> The UAPI contract is between (guest) kernel and (guest) userspace, and
> I expect the kernel to fully enforce that towards the userspace.
>
> I understand that hypervisors cannot trust guest kernels for security,
> but I also think that's a different matter.

You were saying that results would be unpredictable if the kernel 
allowed hotspots to be outside the dimensions of the cursor image. I'm 
not clear in what way you think that would cause unpredictable results, 
or what problems that would cause?

Essentially setting the hotspot properties means that the hypervisor 
console can choose to either draw the cursor where the plane is located, 
or use the cursor-plane + hotspot information to draw the cursor where 
the user's mouse is on the client.

That works the same whether the hotspot is clamped or not.  We mostly 
use clamping to avoid pathological cases (like a hotspot ot MAX_UINT32), 
and get away with it because real Guest applications that do this are 
very rare.
>>>>> The question of which input device corresponds to which cursor plane
>>>>> might be good to answer too. I presume the VM runner is configured to
>>>>> expose exactly one of each, so there can be only one association?
>>>> As far as I know, all of the VM consoles are written as though they
>>>> taking the place of what would the the physical monitors and input
>>>> devices on a native machine.  So they assume that there is one user,
>>>> sitting in front of one console, and all monitors/input devices are
>>>> being used by that user.
>>> Ok, but having a single user does not mean that there cannot be
>>> multiple independent pointers, especially on Wayland. The same with
>>> keyboards.
>> True, and if the userspace is doing anything complicated here, the
>> hypervisor has to be responsible for ensuring that whatever it's doing
>> works with that, or else this system won't work.  I don't know that the
>> kernel is in a good position to police that.
> What do you mean by policing here?
>
> Isn't it the hypervisor that determines what virtual input devices will
> be available to the guest OS? Therefore, the hypervisor is in a
> position to expose exactly one pointer device and exactly one
> cursor plane to guest OS which means the guest OS cannot get the
> association wrong. If that's the general and expected hypervisor
> policy, then there is no need to design explicit device association in
> the guest kernel UAPI. If so, I'd like it to be mentioned in the kernel
> docs, too.

I'm not entirely sure how to fit what you're calling a "pointer" into my 
mental model of what the hypervisor is doing...

For a typical Linux Guest, we currently expose 3+ virtual mouse devices, 
and choose which one to send input to based on what their guest drivers 
are doing, and what kind of input we got from the client.  We expect the 
input from all of those to end up in the same user desktop session, 
which we expect to own all the virtual screens, and that the user the 
only gets one cursor image from that.

But we think of that as being a contract between the user desktop and 
the hypervisor, not the graphics/mouse drivers.  I might be out of touch 
with how Wayland/KMS thinks of this, but normally the user desktop is 
receiving the mouse events (in terms of either relative dx/dy, or 
absolute mouse device coordinates [0, MAX_UINT32] or something) and 
mapping those onto specific pixels in the user's desktop, which then 
gets passed up to the graphics driver as the location of the mouse cursor.

So I guess I'm not clear on what kind of usermode<=>kernel contract you 
want here if the kernel isn't what's owning the translation between the 
mouse input and the cursor position.  The hypervisor awkwardly has to 
straddle both the input/graphics domain, and we do so by making 
assumptions about how the user desktop is going to behave.

 From VMware's perspective, I think it's fair to document that all input 
devices are expected to feed into the same single cursor plane.  Or to 
generalize that slightly, if a virtual graphics driver chose to expose 
multiple cursor planes, then I think noting that it's the hypervisor's 
responsibility to ensure that it's synchronizing the correct cursor 
hotspot with the correct user pointer is probably also fair, but we 
would be extrapolating past what anyone is doing today (as far as I'm 
aware).

>
>>>   
>>>> Any more complicated multi-user/multi-cursor setup would have to be
>>>> coordinated through a lot of layers (ie from the VM's userspace/kernel
>>>> and then through hypervisor/client-consoles), and as far as I know
>>>> nobody has tried to plumb that all the way through.  Even physical
>>>> multi-user/multi-console configurations like that are rare.
>>> Right.
>>>
>>> So if there a VM viewer client running on a Wayland system, that viewer
>>> client may be presented with an arbitrary number of independent
>>> pointer/keyboard/touchscreen input devices. Then it is up to the client
>>> to pick one at a time to pass through to the VM.
>>>
>>> That's fine.
>>>
>>> I just think it would be good to document, that VM/viewer systems
>>> expect to expose just a single pointer to the guest, hence it is
>>> obvious which input device in the guest is associated with all the
>>> cursor planes in the guest.
>> I don't have a problem adding something that suggests what we think the
>> hypervisors are doing, but I would be a little cautious trying to
>> prescribe what the hypervisors should be doing here.
> If the UAPI has been designed to cater for specific hypervisor
> configurations, then I think the assumptions should definitely be
> documented in the UAPI. Hypervisor developers can look at the UAPI and
> see what it caters for and what it doesn't. It's not a spec for what
> hypervisors must or must not do, but an explanation of what works and
> what doesn't given that guest userspace is forced to follow the UAPI.
>
> If there is no record of how the input vs. output device association is
> expected to be handled, I will be raising questions about it until it
> is.
>
> Having limitations is fine, but they need to be documented.

I think my confusion here is that if we were to try and support 
multi-user or multi-pointer sessions, our instinct would probably be to 
bypass the kernel entirely and work with a userspace<->hypervisor 
channel for communicating what the user desktops think the session 
topology is.

But as I noted above, I think it's fair to document that this is all 
assumed to be working in an environment where there is one cursor plane 
shared across all displays, and all input devices used by the hypervisor 
are processed as part of that session.  (If that's what you're looking 
for...)

>
>> I certainly can't speak for all of them, but we at least do a lot of odd
>> tricks to keep this coordinated that violate what would normally be
>> abstraction layers in a physical system such as having the mouse and the
>> display adapter collude.  Ultimately it's the hypervisor that is
>> responsible for doing the synchronization correctly, and the kernel
>> really isn't involved there besides ferrying the right information down.
> Are you happy with that, having to chase and special-case guest OS quirks?
>
> Or would you rather know how a guest Linux kernel expects and enforces
> guest userspace to behave, and develop for that, making all Linux OSs
> look fairly similar?
>
> You have a golden opportunity here to define how a Linux guest OS needs
> to behave. When it's enshrined in Linux UAPI, it will hold for decades,
> too.

I mean, we're certainly happy to make this as nice as possible for 
ourselves and others, but when we're trying to support OS's from the 
last 30+ years, we end up with a lot of quirks no matter what we do.

I mentioned earlier about the display<=>input mapping, but the model we 
use internally is closer to what a desktop manager is doing that a 
kernel.  So each virtual display is rooted at a point in the topology 
that corresponds to the user desktop's idea of how the mouse moves 
around the screens, and then we use that to map client mouse coordinates 
into whatever space the input device is using so that the guest's 
desktop send the mouse to the correct location.

I'm not a KMS expert either, but I thought that the X11/Wayland 
component was still doing that display<=>mouse mapping and the kernel 
just matched up the display images with the monitors.

>
>>> Btw. what do you do if a guest display server simultaneously uses
>>> multiple cursor planes, assuming there are multiple outputs each with a
>>> cursor plane? Or does the VM/viewer system limit the number of outputs
>>> to one for the guest?
>> Zack would have to confirm what the vmwgfx driver does, but the VMware
>> virtual display hardware at least only has one cursor position.  So I
>> would assume that vmwgfx tries to only expose one plane and the rest get
>> emulated, or else it just picks one to set live, but I'm not an expert
>> on vmwgfx.
> Right. I would not expect a guest driver to invent more virtual devices
> than what the hypervisor exposes.
>
> I believe that using universal planes KMS UAPI, a guest display driver
> can also expose a single cursor plane that can migrate between CRTCs.
>
>> Normally we try to run a userspace agent in the Guest that also helps
>> coordinate screen positions/resolutions to match what the user wanted on
>> their client.  So when a user connects and requests from our UI that
>> they want the screens to be a particular configuration, we then send a
>> message to the userspace agent which coordinates with the display
>> manager to request that setup.  You can certainly manually configure
>> modes with things like rotation/topologies that break the console mouse,
>> but we try not to put the user into that state as much as possible.
>> Multiple cursors in the Guest display manager probably fall into that
>> category.
> That sounds like something that only works with Xorg as the guest
> display server, as X11 allows you to do that, and Wayland does not.
>
> You could do similar things through the guest kernel display driver by
> manufacturing hotplug events and changing read-only KMS properties
> accordingly, at least to some degree.
Yeah, what we have now is definitely X11-focused.  We've certainly 
thought about using hotplug events for controlling the display updates, 
and might move that direction someday.

>
> At some point, extending KMS for virtualized use cases stops being
> reasonable and it would be better to connect to the guest using VNC,
> RDP, or such. But I think adding hotspot properties is on the
> reasonable side and far from that line.

Possibly, yeah.  I mean, so far I don't think we're talking much about 
additional extensions (beyond the hotspot), but rather additional 
restrictions on what the desktop manager is doing.  But if more exotic 
usage of KMS becomes normal then that would be an interesting time to 
look at other options.

--Michael Banack
