Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3C539286E
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 09:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46A56E7DA;
	Thu, 27 May 2021 07:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1206E7DA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 07:21:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYF/foLpZFoKXYXIgyyoQDsspxNdTPDHzFyeKl+PIMrc+5PRwq11GSnSChEGKucHFj9xTsGbx6b2bLI4/plYmJ3X4CDuWRm/dhA/ybaSW5irXIZbgfwG71YDCntLZaJG5UysyNlSRV4cCAbFYKG6uWvixsuEt+ecWtSy81fnL/rxtOrVQlzRngQOdEaKnz7n8ZxBgxz53D0qtb+SvKWyP889/t5LhbVJ5/UFtBqkwGYEawZYBGGt403Kk7Mccn0j3DYSKTGG7iq9FckPjrpXdGYTe+ZuNjkr6IM8Nk18T4I5qGyi5yKzXBRwGrI/zAA6+GjKsQnzzklhcelnynvUrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfAGn2GBEqEovcRS0W+qkT+4/+Dodtr50x7bP0JycrE=;
 b=BWZt/JmIGarNPvUjlgQDYif43J3jnKYgRpOQ/6OSmH/4I/Ms5FlZqYtFnh8E7usIGNz2GgmUqGr92N3zmPAgNzPBWPFMvlPvc98Mo7xV2baA437ZUogPGtIv+HFJpGfCgu+Q8DqZ+Kj+jX9iXws9XfSqO6Duu+6ulspDvfLUl8xhHMnQT5XuLBaIXu0OHG7aGMIM2NmxEesjqxdK4s8J5ojEJIugV5ENB2tzcyLLyNRkWoqhVe14VDhVuhssYPRmRE+klN1LgwjrSqO84KbEvLGITLA4hKuWqZo1JL/P4xlomZkMpKlYvHh7UMTy2+ItSKtRWb6ksTBXC1la+k0dnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfAGn2GBEqEovcRS0W+qkT+4/+Dodtr50x7bP0JycrE=;
 b=w0zzw0VPyeF0uHz7MBVKrl0yiictSadylbxNMNzvuZhwLB0+UQ2DYI0ootAX9bd1GmBwdTgKwxj5rNzU9SbN1WKHsLrDflCOFJwFSA0h4ztlHIyotZW5P4mYV+fkNjp0F6wAmMfsYTryHwFJ/25eiz7BXwPnpryytVQDg0j9OTg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3677.namprd12.prod.outlook.com (2603:10b6:208:15a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Thu, 27 May
 2021 07:21:23 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.027; Thu, 27 May 2021
 07:21:23 +0000
Subject: Re: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
To: Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
 <CAOFGe97b-djqwV95Y91xe9-ZVUyeGqjdPE8vj7MoSfV0Kcrp1Q@mail.gmail.com>
 <CAPj87rNJTHNKkdiZREVb8v6iiwUhYLXW10pjVOdV=zttd+tG3Q@mail.gmail.com>
 <CAKMK7uHqxLe_CH_cOjfy-rouYcxwg=n6AkkxprzAKnb-y_A3NQ@mail.gmail.com>
 <CAPj87rOW_633K_n4nwq2qkPt5Q5efc3BpRnzT+=Npb=agWGTew@mail.gmail.com>
 <YK5QvIJYTJ7AJZNx@phenom.ffwll.local>
 <CAPj87rMgQiwdB+fTjoMkqtpKxs6JgxWSm=jrq1Oen0dKiFqSog@mail.gmail.com>
 <CAKMK7uH9CLw5=-AYRjtMdFA0etjSMEng3UhoACunBq0Uqq+v6Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f5874edb-a5d4-29b1-041b-fe0fd4c2a2ac@amd.com>
Date: Thu, 27 May 2021 09:21:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAKMK7uH9CLw5=-AYRjtMdFA0etjSMEng3UhoACunBq0Uqq+v6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e870:f1fc:b902:d4d0]
X-ClientProxiedBy: PR3P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e870:f1fc:b902:d4d0]
 (2a02:908:1252:fb60:e870:f1fc:b902:d4d0) by
 PR3P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Thu, 27 May 2021 07:21:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c0b32cb-df0f-4ebf-29b2-08d920e0081b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3677:
X-Microsoft-Antispam-PRVS: <MN2PR12MB36777AA5ECAB6971B1C69C0C83239@MN2PR12MB3677.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U3Py9SPivi+dp84xblhM2cw9GciNav1HWmxoBHuqpdEO9+UV2G3etpRf43K8PtFsh5k0f3faa9S+/O0zzXoOn5DoHmBkNrdkihyoWBklGRMR3hc6hTvRQHpwgFbUUgdCAGAZTIGdvi2sXKQLKWpFJGdVLZJh40Z36ow31O0gAcwLiI65nn9QDRcqEoCbEDsZvorZmS6gj/+ycGeBOa+LRDDAXU24g4VDOeWsJxsGmVkPlrKT0kLVKYFEUcH9wTbZvdeWgrGpooOjjn6ITcXYD/01x41dMCZg5pnTGvAhAn2p1aK7sVFDaZqfDdteBSvbe/YCLyqWajOvysndd9SqIZpqeqMhYO0AyyshAu9BqcEcwaaQVi8zhssEDDCgaT6jiF+BQUaIE2Ts9b8np0IeVcln6vtQjTvE0NZLEGUKClaEFgW0JuoQGS7siugDxXd9Hrqs1xgQ2vekldaiPQuH7tsEQmzTkvXF0fnaC5aO4BoP2tYZtQrlTrAltTELG4IEkgHrW5GH60o/NkD2vvpf/GpjsNMfw/1jYL/AKGMuXym49hSTr7anKf+jHnomyDVpZ8fxFlU5xDo1/ZzkKXJYNTDRGFl2oYq7tvFKPu8g8C9LAJvKgAsArjfQvX6VIsFs5n9te10LuY1SOg9ubHcCIVQoNWQbK/tEz+Usi5kFbaOQCE2s5BACzMXpnjdzmYhR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(36756003)(86362001)(16526019)(66476007)(38100700002)(6666004)(66556008)(66946007)(478600001)(8676002)(52116002)(6486002)(83380400001)(2616005)(110136005)(54906003)(316002)(2906002)(186003)(31686004)(4326008)(31696002)(5660300002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bGRmZE1mYTVldnNHa1llQzJUMjJXN09KM0l6RDVELzhhRTJDcEZFSzh4VHZO?=
 =?utf-8?B?YmNPN0toOXlvTGVNdTJWWW0xQzUzN3ArZG9iTzZlcmU4RDNESHNXMldLcG9U?=
 =?utf-8?B?R3NwZmJpTVFYMVVTTG00SjhJV01XTmRFMG9MdDdaQnBSejN6MEptUzJITWkv?=
 =?utf-8?B?M1N3VXhBNkt0U01OYkYxZGRzMGl3NituejFNQ1R5ZFFXRi95Q2VwQnVJcDJt?=
 =?utf-8?B?UHVGK3ErYk5FWStPMTNVeUh5a3U4Rk1oZGVwclVmaURGZ2VWdklTRkJUZmI0?=
 =?utf-8?B?TDNQdklSNlBmUm5HN0M4OUdjVlF5c04wOTRsOE13MFlIZS9jUnd6VGxBUmVw?=
 =?utf-8?B?WC9uNUJoMkR2YTE2QURVMTJrNzZYQm1qZ1hHejZUMHoxaDE5RkVaTVJZM1Bv?=
 =?utf-8?B?MFRHRFRSZ0IvdGt0UE82bTY3Ris0cHBaM29CR2t6ZDkyMjZmc29sb251SWh5?=
 =?utf-8?B?VHRDUFJUZHNqcE84WDFwNXp5YW9MYzlQVlZLNjkrMDZrdjVqYmpSa2htWkNU?=
 =?utf-8?B?SGNLVzFaZEI0U2lXZnkwZmFrNGpjVGlqUnh1alovZE9BL1JwVU1acVMxZGRj?=
 =?utf-8?B?VkhkTHBmTkU2L2QvZ0pGRmU3VFp2V2hYd1ZrdTRuUzl2SnFPakI0aGx1all2?=
 =?utf-8?B?VytFZ2Jzem00aHc2dDMycmp0RThMQ2tTdjdGTzJsVmI3TU1mWjN0LzAzZFhS?=
 =?utf-8?B?dnhFY0RHNThYdlJLSGZIV2o1SXV3aW1Cays2anBvWmMzL0FaQmt5b1FLWHZ0?=
 =?utf-8?B?WDhkSHNoOEc3ZkErd1kvemZPUE94aDFvUmpYKzFwSS95R202UFRlSytmTm9z?=
 =?utf-8?B?ZGdqd05veGlkdlBNVVZvVGQ2S3IxMGlBMURwZUErR1pkdlB1L1lyczZnK0dp?=
 =?utf-8?B?VjF3RFZ4TUtpaUhQNG9GZTg2UGZtVE4xTlVHTzlRNnNtREw2OW5SS1dKZlRF?=
 =?utf-8?B?N0hPcFRad2dvNURweklRNmhoZ0NrYWFYNWc0VTcvLzlKVGp1WTdyR3J4ckhM?=
 =?utf-8?B?Umx4SFBySUc1QkdEeFliRUJMS3VWSFh4bVlkbDd6aWd3VFp5QmZHcld2N0ZB?=
 =?utf-8?B?RlBKK1RYWmRubmc1RWdibWcwSVpQN3JmSEdqMEpmeUtacFQ3aEluT0U3RjNC?=
 =?utf-8?B?ZmVqOHRiU01NV05xc3pEOEhxTWFFRWZnMFBhZUpzN1ZnUGdiTHVYUzdDWnNr?=
 =?utf-8?B?eWNzYW55VGJ3eFl4TC9vR3FWcjN2eWJDUnJZcEtabWJnYjhMMHNRdGFqWS9h?=
 =?utf-8?B?bVk5b0NURG96M0YxRW83ZERyNllXSjhJb29WZTB6d0hpOVk0cDYvejdveUhk?=
 =?utf-8?B?Um5BT1c0UDhiU2xlU3puMnN5QVpvRDJJQkl0UkViZHJlc1FLcUZsOURGREZw?=
 =?utf-8?B?MVBvWXg0ZUhhV1ZUb3BWVkJZM0dGVmI2M2hCM3A4Rmk5Z1QrcDBhRDk5cUcr?=
 =?utf-8?B?VWM1UWlzTWkza2hvODRVemcvUyt5aG9lMHptZkpFb3dhUVlSKzFYQ0FrWkYw?=
 =?utf-8?B?bTAxSEZNOGdHNFErMTJ5NkJIT3d2aWRBN2lISFB3ZEJzSktKMnpnWENaN2hk?=
 =?utf-8?B?T1N3eDBUc3k1RE55blBKQ0VtaHVOaG5TOTFzUVVPU3pTNFJtT2pVekhtNjhM?=
 =?utf-8?B?OFVXcnpMdGx3SVU1RDV2RFFKSmxVUHZnOW04a3F5dlVpcmxMTWx6UCtmNm5C?=
 =?utf-8?B?Qk5wUFRUb0xYVXlsRHdMQUxiSkY2eEt4MTU4WTZOb0pRZnBhUFVnd2FFSEJr?=
 =?utf-8?B?djVxVUd6Y0xiSUpvbzNOMUI0dTRFVU5ycll1NE40WTNYcnVYOVZ0WFpSUWl0?=
 =?utf-8?B?MG5UWTQ4RGF1UFVHNkZZMW1pMmZxUUlXY2V2d3JwdjlqS1BET1JwS2lhUmg2?=
 =?utf-8?Q?Njnl6puMj2BRK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0b32cb-df0f-4ebf-29b2-08d920e0081b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 07:21:23.5863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPivvCcj1YcgVjZhYvYjYt/V9a+Yff5aBOQORuU1llsGdhtRK29wnsOcvygIO8dH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3677
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.05.21 um 18:52 schrieb Daniel Vetter:
> [SNIP]
>> I can make the relatively simple usecases work, but it really feels
>> like in practice we'll end up with massive oversync in some fairly
>> complex usecases, and we'll regret not having had it from the start,
>> plus people will just rely on implicit sync for longer because it has
>> better (more parallel) semantics in some usecases.
> Things fall apart in implicit sync if you have more than one logical
> writer into the same buffer. Trivial example is two images in one
> buffer, but you could also do funky stuff like interleaved/tiled
> rendering with _indepedent_ consumers. If the consumers are not
> independent, then you can again just stuff the two writer fences into
> the exclusive slot with the new ioctl (they'll get merged without
> additional overhead into one fence array fence).
>
> And the fundamental thing is: This is just not possible with implicit
> sync. There's only one fence slot (even if that resolves to an array
> of fences for all the producers), so anytime you do multiple
> independent things in the same buffer you either:
> - must split the buffers so there's again a clear&unique handoff at
> each stage of the pipeline
> - or use explicit sync

Well exactly that is the problem we had with amdgpu and why we came up 
with the special handling there.

And you don't even need two images in one buffer, just special hardware 
which handles multiple writers gracefully is sufficient. The simplest 
example is a depth buffer, but we also have things like ordered append 
for ring buffers.

> So in your example, options are
> - per-client buffers, which you then blend into a composite buffer to
> handle the N implicit fences from N buffers into a single implicit
> fence for libva conversion. This single buffer then also allows you to
> again fan out to M libva encoders, or whatever it is that you fancy
> - explicit fencing and clients render into a single buffer with no
> copying, and libva encodes from that single buffer (but again needs
> explicit fences or it all comes crashing down)
>
> There's really no option C where you somehow do multiple implicitly
> fenced things into a single buffer and expect it to work out in
> parallel.

You could also fallback to a dummy submission, e.g. compose the image 
with multiple engines in parallel and then make a single dummy 
submission to collect all the shared fences into the single exclusive fence.

But this needs an extra IOCTL and unfortunately the stack above also 
needs to know when to make that dummy submission.

Christian.

> -Daniel

