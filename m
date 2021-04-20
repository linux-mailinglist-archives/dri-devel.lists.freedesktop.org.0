Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CC03660CE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 22:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150E488071;
	Tue, 20 Apr 2021 20:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700058.outbound.protection.outlook.com [40.107.70.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E9B6E8C7;
 Tue, 20 Apr 2021 20:23:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJj6dGM9DUoPWzHW5HHZ4HiU1KIyn7ic9XJn84hNG6MnGuwf30FnQdBzFINnJtVmYlvy6w7o62tLU+oesx/E7lckmLqbkhr3dxtpC8BSZVmDChOVR1ucJPAxHMnBJV1eBepBkQ13ylcyfvuqrbRyYozSiaYAtRf04n7uj/3t5KImlYNTtBrA19UD2pJt1tq3KZu9dhQGSc9/+IR8PYSzLdCXyoO5fhbEn6fG/+YWrEPF2urMXVlwPpAqCxwiCiOplrBQjzBi1NPcZLdBBEWz/LK2W4cKVgPBmIUUpy3ImhLVP3XnYMlon0DeR4pFWsrobvJyfzYBksfdh2urqPxO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXgcXxmcZejwM81qec+IEW2PMDmEuYfApbfXWI6aRDo=;
 b=Ah8Ka7TJ3tz+KNM8tQN4g2FZjalfkIRpLr2IweHGWjF8sMtRIO91C10k1UOG1VmGWjQOMnjNJjkQeU5xSrtz9ClMMb2sjIbaWHy6SRkeSCU6fBA3I6EVMr89fX78I017yiTq2qtrvpc/TleNy+aAOD25vYq3yGn4dkkn3vMalEe8155KkmZxPfx9bmYjnl77I7AtXI6lYksnqhZeberfBR9I/VeKeqi9IB3GSDU7bVjftPpvdJjZmL/mtcWWt9ghtrqT6QVbapnXyz+aCDYmfxtTa+IZ+mt9nGmhJnIPuZdmeNekHc/P10yGoGce2mYjXFpFo6V4cU7/Z/BPPI5N/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXgcXxmcZejwM81qec+IEW2PMDmEuYfApbfXWI6aRDo=;
 b=USM4YWrAH2agjM0pQNSgELeF2k5aS/qKxqSCfs6ye0nG4KpbLvEar8O0FX5bBeBOM9Ff41PoWexNDeotdDSQwgY/zwk6LuranynjrRTkZZogF7rpcaszHROi6evcFesJa/7izXaXaH5pVk19z08fHZfY2gFm/BmGPD27V7uMOwE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4947.namprd12.prod.outlook.com (2603:10b6:208:17d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 20 Apr
 2021 20:23:01 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Tue, 20 Apr 2021
 20:23:01 +0000
Subject: Re: [PATCH v3 5/7] drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
To: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20210416133146.24825-1-tzimmermann@suse.de>
 <20210416133146.24825-6-tzimmermann@suse.de>
 <b7008944-fbe5-bd59-d2a9-ff62bea38237@gmail.com>
 <80012c09-6975-f694-420f-72b2236dcf4e@amd.com>
 <52403618-62f5-2085-c245-e1e98762cccb@suse.de>
 <YH6WJ0p2jGd3Q5Xw@phenom.ffwll.local>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <a76b44d2-d894-ab4e-ef37-f0feb4326297@amd.com>
Date: Tue, 20 Apr 2021 16:22:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YH6WJ0p2jGd3Q5Xw@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [142.182.180.233]
X-ClientProxiedBy: YTBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::24) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.180.233) by
 YTBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.19 via Frontend Transport; Tue, 20 Apr 2021 20:22:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d5b7ef1-cfac-4082-c699-08d9043a17e7
X-MS-TrafficTypeDiagnostic: BL0PR12MB4947:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49473BA465580CAD072E9B3392489@BL0PR12MB4947.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eNXgFH2CA7iVbO7xsI4/v7GOMReKddLo0AR/t9rrQiJhTrv4GdSwViGV5mOerBd2OezX1CJQFGyo0UalSrYYjgOinJBh3KjezSXfF8sjngyZCw4KEGEdE7e1P9hXVP/Q1xlSogAjdkHUIc9lTtc8yqpOoUBDj4rtuLcGWNZAIKmC6fiMiwaT7Tx4Dh7YMBF9no5/LlXMKEVguPD4JWLGnoKTGsGKK6YXt8kddkQjdTj87hF1XT9ZVXzXONmJrv8Mv5AQ71/KKLowjjbR8RhpDr4Db5cRtcedzL9Ksrd/Zrsj6iOwFmxJW1Te0oPYysIpHWu7SiamkGVyJ/ZzZ8+u4/+22icE7dGbo5SOfBzk+CYrTdVevCI42/4mZwukdok04tOu5JGvC83wX922yz8osMM71fF44Lqe4VA4ANBbXRD1qTEfQa/LrUuAwUsTVWywb/sw8ea7wvGdsw7YOS53YRIsThzt1/zkAVcTali/ecPm4tfW2cTs/0iPEXwXSMryhRHOVPqC++xI6+tc+QbZUx/7ZBgnmAaO5PH22o+aGG9ZoUgTsStuZguk3McUjuJ7CWrj2UVzZ4QRyuU0pGKCX9TvZXHxRXwxTr8BpvJEWIaBi7AsIJjIxOhVAHW5iSt1pB6lR43BYyY8yN2INi3BQelmXa1oKv9zIJXpV87+ytWQAzUXV+D0RYrl5UtI5U6uB1MKGCqkhoX8IosTeihtjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(346002)(396003)(376002)(136003)(366004)(110136005)(16526019)(86362001)(8936002)(36756003)(8676002)(2616005)(66946007)(26005)(66556008)(44832011)(316002)(4326008)(956004)(31686004)(66476007)(54906003)(7416002)(2906002)(5660300002)(186003)(31696002)(6486002)(16576012)(38100700002)(478600001)(40753002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bVFvQkpjQkI3VnEzNExQbjF1VTZ4WC9yRnd5NDVWN09LeEFmcWxLd0VQdXJm?=
 =?utf-8?B?OFlIcGlRZWVZR0RaYnBHZnlhSjJ3YXpVeTdKd2ZqUzA4MGZpNFFVUXdtbW9o?=
 =?utf-8?B?aGFvdjUySWMzbFZLRlNndnVycm9TcHNQNzlYV0w0bnd0YXJJVTV3dHhGOXBQ?=
 =?utf-8?B?MVE5NVM5UEpjOXFNV0ZtaGVkWGtISzl4amFKMkJYOWhXY0RQQ0ZEeFZNZXIr?=
 =?utf-8?B?Vkx4dGp0TGk3ajRXaHlhU0Ztb1RKYzNackpKSUEyaGJaR3VMR2h3TWFuNklx?=
 =?utf-8?B?d3ZMbnZycmlrSytkN1NGbklJTWsyNTdreWV2K3FrQWtleDVMazVrb0hGUHUr?=
 =?utf-8?B?cVhPQXRzcWhvMHhnRlRVc3pWeEZxUU91dUtvaWpMNExYZWJ2R21obU1Fb1ZG?=
 =?utf-8?B?dkhMVUg1WXlpRjlKYmdaUXJUVWtWR1FJOHl1NWVBMVN1NW1DbXJXZCtTNGRY?=
 =?utf-8?B?MlFpUWNVY0ZtNWFjQlFrOXRoYXRLMytzVmNjdm5rMURYN0E2OHlSbmFtbjA4?=
 =?utf-8?B?clMxaFdaR0p0blVDSGR2WlpVSXUrUmNLUDZ1dlUxRU84czg5Z0NwVndBSG96?=
 =?utf-8?B?NCtoRW1QZkhiM0lSd1VJVUN3Q3RxL250cEY2bEVoTlByYUVTV216UkhoSXcv?=
 =?utf-8?B?OG02OVJDbVJqSW9wV3RLNDhYY0EvZXhvNTVaMVNyWktvQldYWnRYY3NWT09F?=
 =?utf-8?B?TzJaNjdodG54aFF0bFcrYVFsbjNBcHZ5Mkl6Mmk1ME9MM20xaTRiT0h0ZThQ?=
 =?utf-8?B?Y0FsbjhnUlYxUmNZOStZT1ZqNUN0b1Z1NXB0Ynl0RzlrV3lWdXVlWHp5K1Bo?=
 =?utf-8?B?QlQrNzVEVnMrSWFNUGJZSStYMGtqbkhyb2NUQUszbWhqcFJIUlgzY2tMVkhC?=
 =?utf-8?B?NCtWUytCV1VmSkNPcitFSjRnZFhMVXNVQWRqbGFPRHpya080TFp5T1pXSXlw?=
 =?utf-8?B?MkV0cnVsSk8vb3ovVm42WFlWaitkYTg0YTA0M3JmUUlIckl3ckcyeFNML1FP?=
 =?utf-8?B?dndZOU8xTjRCTDJIRWxHWXh1bisrSDJ5SkxNUkN5ZVRMaG84V3h4TnV0eDB0?=
 =?utf-8?B?M2ovSDg3SXYyRnpvdzNqakVrVHJqY3AxN3R3bURLZ2RnN2E3Z2JMdDRmaHVZ?=
 =?utf-8?B?LzV3RUExS1FjbWorY1RBTHNjOE03clE3TTB1eFJiQmw0SVo4MTNSUzZ4amZk?=
 =?utf-8?B?K0VESHNDYUhwTVJZTzVMc2xpNmVqTFpCelpaelBVb00ySm1MUTkreFV0a2t2?=
 =?utf-8?B?cUx2V3ovSGUxWlhXeTFhWmNpRm1kelRIN1ZGLytKdXpvL0lZVHV0V3dGWWpB?=
 =?utf-8?B?cHJ2L0ZzeW1SOWlRbHlFZllhVG44TmllLzZTeGFwbVBWYTB5dFhiVE1nREEx?=
 =?utf-8?B?Q2MrNUg4VkYwQ2tFRC82UFl2cEVwSjNxalFRVVRaTXlqTDBvaVNFUVBPRGYr?=
 =?utf-8?B?MTM3VnZScDV3Z09PRUo3VVBMNERMUGNBR3NoNHZHV0ZJWVk2aHkzcmpqSHZE?=
 =?utf-8?B?U2JBeEhkK2NZY01yVC96NExWR2tDQ1pUVnZ6QjhqL1NhVzdBYklzVnpId0tm?=
 =?utf-8?B?V2ZnN3YzTWtlMkoxbld6RHF6SU9sbDduSzhXV1N2dlJ2Szl2ZFByZGZWQmkw?=
 =?utf-8?B?TmZIaWFkenZyV2tsZTF2SUJackpKRHNVajZvaElrZDFFdExCT0JYWWpLVmY0?=
 =?utf-8?B?Vk44aUllSEtmdHJCTnJyOHR6OTJVSW41WXkzRG95VDd2NzhVLzV0QjVJS2d4?=
 =?utf-8?B?eXk5UkNiTnRaaHdRWVQ5SWlGakFVczNhK0lrcnZKUGNaekxWdUxNZ2xlVzNs?=
 =?utf-8?B?TEprOCtDdkhvZHZXOG1udz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5b7ef1-cfac-4082-c699-08d9043a17e7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 20:23:00.7595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SO/oinS0iMQ9qn9y3EgIQGBVFt7n46vqHWmD28ayG4nrWmKRqFmFIt77PHtaWbWKVGbRPrEN84pEBCAxZdOWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4947
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
Cc: amd-gfx@lists.freedesktop.org, shashank.sharma@amd.com, airlied@linux.ie,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sroland@vmware.com, nirmoy.das@amd.com, dri-devel@lists.freedesktop.org,
 ray.huang@amd.com, linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org, alexander.deucher@amd.com, sam@ravnborg.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkFtIDIwMjEtMDQtMjAgdW0gNDo1MSBhLm0uIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+IFdo
b2xlIHNlcmllcyBpcyBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgo+PiBUaGFua3MgYSBsb3QuIElmIEknbSBub3QgbWlzdGFrZW4sIHRoZSBw
YXRjaGVzIGF0IFsxXSBuZWVkIHRvIGdvIGluIGZpcnN0Lgo+PiBTbyBpdCBjb3VsZCB0YWtlIGEg
YSBiaXQgdW50aWwgdGhpcyBsYW5kcy4KPj4KPj4gT3RoZXJ3aXNlLCB0aGlzIHNlcmllcyBjb3Vs
ZCBnbyB0aHJvdWdoIHRoZSBzYW1lIHRyZWUgYXMgWzFdIGlmIG5vdXZlYXUgYW5kCj4+IHZtd2dm
eCBkZXZzIGRvbid0IG1pbmQuCj4gSSB3b3VsZCBsYW5kIGl0IGFsbCB0aHJvdWdoIGRybS1taXNj
LW5leHQuIE1heWJlIGNoZWNrIHdpdGggQWxleCBvbiBpcmMKPiBmb3IgYW4gYWNrIGZvciBtZXJn
aW5nIHRoYXQgd2F5LCBidXQgSSBkb24ndCB0aGluayB0aGlzIHdpbGwgY2F1c2UgaXNzdWVzCj4g
YWdhaW5zdCB0aGUgYW1kZ3B1IHRyZWUuIExvdHMgb2YgdHRtIGNsZWFudXAgaGFzIGxhbmRlZCB0
aGlzIHdheSBhbHJlYWR5Cj4gcGFzdCBmZXcgbW9udGhzLiBPdGhlcndpc2UgeW91IGNvdWxkIGNy
ZWF0ZSBhIHNtYWxsIHRvcGljIGJyYW5jaCB3aXRoCj4gdGhlc2UgcGF0Y2hlcyBoZXJlIGFuZCBz
ZW5kIHRoYXQgdG8gQWxleCwgYW5kIGhlIGNhbiBzb3J0IG91dCB0aGUKPiBpbnRlcmFjdGlvbiB3
aXRoIEZlbGl4JyBzZXJpZXMuCj4gLURhbmllbAoKTXkgcGF0Y2ggc2VyaWVzIGludm9sdmVkIHNv
bWUgcHJldHR5IGZhci1yZWFjaGluZyBjaGFuZ2VzIGluIEtGRAoocmVuYW1pbmcgc29tZSB2YXJp
YWJsZXMgaW4gS0ZEIGFuZCBhbWRncHUsIGNoYW5naW5nIHRoZSBLRkQtPmFtZGdwdQppbnRlcmZh
Y2UpLiBXZSBhbHJlYWR5IHN1Ym1pdHRlZCBvdGhlciBwYXRjaGVzIG9uIHRvcCBvZiBpdCB0aGF0
IGhhdmUKZGVwZW5kZW5jaWVzIG9uIGl0LiBJZiB3ZSBkZWNpZGUgdG8gZGVsaXZlciB0aGlzIHRo
cm91Z2ggYSBkaWZmZXJlbnQKdHJlZSBhbmQgcmVtb3ZlIGl0IGZyb20gYW1kLXN0YWdpbmctZHJt
LW5leHQsIHRoZXJlIHdpbGwgYmUgY29uZmxpY3RzIHRvCnJlc29sdmUgd2hlbiByZW1vdmluZyBp
dCBmcm9tIGFtZC1zdGFnaW5nLWRybS1uZXh0LCBhbmQgYWdhaW4gdGhlIG5leHQKdGltZSB5b3Ug
bWVyZ2Ugd2l0aCBhbWQtc3RhZ2luZy1kcm0tbmV4dC4KClJlZ2FyZHMsCsKgIEZlbGl4CgoKPgo+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
