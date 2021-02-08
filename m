Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A133142B3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 23:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EE66EA0D;
	Mon,  8 Feb 2021 22:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABCB6EA0C;
 Mon,  8 Feb 2021 22:16:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKrDDhBZcTK7H8XmF0qw0brtHuPiqktdckkRRi+sbXrW6EpXYZgysJmD/BWUwKbriGT/4wRG9mdehd/zKoGszbFRpVzM8wpuPU+1fg/aJIz9TgYUSk/g1uV75wOZOQh4QKiBzI58+grqT3G9Epb3PK6I/uqgXKk+VtK0klz98uQ2NHdUoNEfBcDzXnmE8HFCENlorKF9RgWOIJWw5nVHl0KHxGcaSrn7psMtZtRsRbyNcKUZOATWLxTftocycOdbdfmGfeBdSh76y4jz7D6iPSaHVGqu6xdiSEtAodfmwqUKq6pXtdlbVZ6QhkvNXmI93fi2XKOqdXZTSkD2r6ZdOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Gy5udXJD46IA8gHlPPSroT/AN4kcBJrLGjAsaOA/+Y=;
 b=oC7w1olRORI7JWbhft/OAnlltG7xfUTBZZLRbjECVyjcmTSpgANzZMGGQlQf9Uy5ROiva3tPoXyLs/N0Sp330mL/rgZRuO0Qmz1Ze1rDfhWCAG5JAeyH1ChXV6w0rx2Q5YlWMo0GlFs2rRTmtvnaFN9Z3FLpJS8JEEiIefbmZDSgeHieQHDsj+fLUyfSmPXR+EWPE05+ras8rotH7pFE+3NrcaYVKz7mnQ+3VN49TrEXUkb3hh3CMXqE3hp/Kp2/hG5/PZB3elpM+HtcjIiAb5RuX/tvPAJ4BF++xBn1rr5wsDo5hpyHCsoOAAOKobyoZHoet4d2Zw0ZXiZxMwWgdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Gy5udXJD46IA8gHlPPSroT/AN4kcBJrLGjAsaOA/+Y=;
 b=Ys06p30bK7ujK0OgaPJAp13c0UxjgzBFFKuChCVRyAq0BcY+dWdRn2/mgT8NKxzVWotnnRB5iNmsylR5fuvQexC74Npr0tlXTSsrSdnLZryFeCGYK7pSGbntyOuIkUBfYsvj+oiUE6TE6aHXSvJlV0rjgkCvD7nIRDFTYM0hFwo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2349.namprd12.prod.outlook.com (2603:10b6:802:2a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 22:16:01 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 22:16:01 +0000
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
 <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
 <0b502043-5a66-dcd5-53f9-5c190f22dc46@gmail.com>
 <78e4705d-c55f-6c68-d0f9-b1939b636121@amd.com>
 <CAKMK7uEm=N4kQYyzMt=nUefu2BdyKNcWikFiSJih7CthJMd2Aw@mail.gmail.com>
 <8fbeee95-b365-7f68-1e0b-1d42eb0dea70@amd.com>
 <CAKMK7uEJDfPsbnkVfunjVe2iNbpVBWY2_XHai4JntcxWkuVc3A@mail.gmail.com>
 <fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com>
 <YCEJBfA6ce4dD3JT@phenom.ffwll.local>
 <6c639669-b78d-b6a3-71b9-d546ca34121b@gmail.com>
 <YCEOY5wFmpGRl7jJ@phenom.ffwll.local>
 <90eb7a73-1981-6d20-a83d-1690321212c7@amd.com>
 <CAKMK7uF3HkTgDhM5Lk3hnGB+35Vi-Nt7YOBJ_rpO8wZw9ifhcA@mail.gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <f8b3417f-a697-c8c7-b131-5c8823f969d7@amd.com>
Date: Mon, 8 Feb 2021 17:15:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uF3HkTgDhM5Lk3hnGB+35Vi-Nt7YOBJ_rpO8wZw9ifhcA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:407a:7c93:58dc:3018]
X-ClientProxiedBy: YT1PR01CA0127.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::6) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:407a:7c93:58dc:3018]
 (2607:fea8:3edf:49b0:407a:7c93:58dc:3018) by
 YT1PR01CA0127.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Mon, 8 Feb 2021 22:16:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cce074cf-2a89-4440-ce44-08d8cc7f1e3b
X-MS-TrafficTypeDiagnostic: SN1PR12MB2349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB23492F87D164FF6898BA3B9CEA8F9@SN1PR12MB2349.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yyr2kQkQdFDjJyBGn0IQkoTV+GSbDtHMd5cLSgYJE6K3IqhFb1nE7LF/i5Gn0YflEkcKFTbvlHSOBXmXY8oqzh1KOs6LxlN1/dyd+jsRYfQ7Vz1f9xhKx4uRhPqyuTEgGPG3b2H6BlY0mZiZagJ8GfVSjB9sbTqEfNBHgme+N4SMHfINgr0jU4E7BPgymSy+qNExF94RRG8eSJYp5s96bG9CteHGwp3W9v+yHmADYirBJdxGz+YgTDNnGdzZnUztMSmOrgZ7q6m0e8Fl5vMZPpphzqidM45TOoCfL9TPR+tjv70UnZOluaKi6kmPaCnKq0U+n14yVY07URRY9DLTCbaerOjr0JsKiXR8NIDQcLU9hykY1HuQm1hBoZG+gjRA75qLvinqdwfHl45BAm+vjIZe3o3M5rNxHfMI44zTS8unDZt9+Q17xvLQAfrisl/DRFCrKQSx1BJRGJ2BZ2XN6RTrGT1Ri7N/i+tp4xpLIqNJJ619WPyNJz2YJOlfj5tpUgdQzMExiKe0ee61H/UKr8GQrr4hhb8rTtGLBuGg0kvU7Ys2qKzNyRgrhI9ouNopPVwq1uNPiszB+yD/GBcyw51hHeeWM/Tk1M9nsqppArVWcOU5W/nCaZeDQ/4yYH2gNL42qsCsF1JHrQG85RmQq4p0LB3EulZIPk0kAeAN+dleTxIjkxUcOXdYMgEQGVxL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(966005)(16526019)(6486002)(316002)(2906002)(54906003)(45080400002)(53546011)(186003)(110136005)(8676002)(36756003)(6636002)(478600001)(31686004)(86362001)(66556008)(8936002)(5660300002)(31696002)(83380400001)(66574015)(4326008)(66946007)(66476007)(52116002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dnBGY0xWajVRTHF3UDNlUXpkUTNLOTRpR1BBWFBXMVVIbjAreHBoRWNhOUxZ?=
 =?utf-8?B?UlpsR0RhNDZWdmNjcmhxU2Z3akQ4MUhESkIwNHdMU09sakdaV2hPREdXUk9o?=
 =?utf-8?B?MW5jSzloZkZwOHk3aTg3ZkRtTTltUFl4bVYzRnlZMElmZkFqd0RaVWJKQXRy?=
 =?utf-8?B?Z2U5bkVLRXkxVTlJQ1dycEhRa2V5VStpLzBSOGMrZXhLT1F4a1JuWml2Nzc5?=
 =?utf-8?B?cVV3R1ZKcDUxY1liVEdFdzg0MHFIV1U3OGlYcTZpbkd5YTJTeWJjcFQ3T204?=
 =?utf-8?B?Q1IvYW5mNEJzZVI5R3pxZHJ0OUFvRU1GdVhtU2FhTlRQYm9qS2J6NVdnOFBT?=
 =?utf-8?B?and2eDlvMEw2YlZrTWZIZG8yaktsb2FFRy9xM1AvWTE0OGlocHJPYUxNUStr?=
 =?utf-8?B?TjFkTUoveE5KTnZvNHQ4K1Z6VlN4UjFLWUxybXpsbXd1OWx6aWJZTjB0Tm5o?=
 =?utf-8?B?THhtRDJNVzJDYVFmdGNtWXl3OTlTUm9wL3o1cUhJSlhIN3VkSWRBaTNXT3FU?=
 =?utf-8?B?ZXZpTW43NVMxcytybTdSRHpOcGdMRzFYZUc4ZXA4RU1Fa2d0OWc5V21JNktC?=
 =?utf-8?B?bm91Ujd2VW5iVDJ4dUVwVlpXWVhuVk1abjY0VFNEa0wxS3dYbE9MdXdRUDJh?=
 =?utf-8?B?cnFQU3I1VTVucURKOFJPM2ozc2w0eGRocVcwTUJsOEJPRlBVbG9lNFFEeUln?=
 =?utf-8?B?UFJNenpodCtaaWIxTTN3MW91ZnNoaWZkSWE3WFBqVEd4WkRTZzVOUEZFUUNH?=
 =?utf-8?B?ZHpRajZic3U4NXp3dlRUZWlOTmhCcDdEb0VRaWFZOFcydllabURVMTZQT3pK?=
 =?utf-8?B?SWt3QmQwMHNlNUxubmVRbHB5SjFQTnRuaURxdnhjM2ZMU3NLUFR4ckpFVys1?=
 =?utf-8?B?eWRydnpsRlJsYm5ydlF5ekk1MmZaNHh0a0dnOThPZXE1eGIvcFpPUEFLbE9u?=
 =?utf-8?B?U2xGeGdjdUJYMnR4TVlpVC91VWJiUmNSY2R1R0FYdXlORHFGbVYyY3NuTDRW?=
 =?utf-8?B?UEFJK2pzSC9NNUQ0a2kxUjJIb0xIdmY2SnVnRDdnbTNaclhoRld0WUVTZ3BO?=
 =?utf-8?B?NUhoYTlxM2VveXM4TlZCVzV1Q0VReXZDaWVlK29pSXNCdXI5RnlVR25CS2Rs?=
 =?utf-8?B?RndMK21LWnlTN0RJZHQrNnowT1Q1eHJ4YkZlcXVrVlkrTk9kUnByRjVNcWM5?=
 =?utf-8?B?ODFXaEZLUVBCdjVkaVlKekFWRFFUWFRxazlNdy94a0JrTGhoUEFWZnlvYlFW?=
 =?utf-8?B?djBzWWF4STdjY2VTdkl4QmNmR0xPclRwUmNoNmxyN29wSHdWYXUyeUIrVWVs?=
 =?utf-8?B?ampzZE9HL2F4OHFEc1FDeWFYc1A4aFRuODlob2tFN0hLU20rSUwwWkFUaVpl?=
 =?utf-8?B?RVI1QStFM0ZueHFjL3c2NlBXMUdHTmI3Y0ZULzJ6RzNBR09MNm4yU1ZkZ2pP?=
 =?utf-8?B?THBGOUExdFFkdmpoN2REbDVsN0lnaGNkdmh6UjVSVmNBSkVsLy9yOFlyYXlF?=
 =?utf-8?B?TTZpMlJWc1k0R293eDdHRWVYMEc0ZkFYN1VJNHI0dVRJUFE2dTZtM2hRd083?=
 =?utf-8?B?eDFBWlFuTW5KMDdUTndQTFRrdUoxUm1kQXhXSGxGbW9TKzRhaElOc1JzTTZH?=
 =?utf-8?B?eXhkOXBOUkJ6NnNSYk41djVNRzQ3OGg2T2tsYU9KK0dSMVUzclprL0J5N01Z?=
 =?utf-8?B?NEhucXZLVytJZDJiRklpMlRqaHp6aFMxSHJEU3lxTklTWnFITG5zYUhRWjh6?=
 =?utf-8?B?cmh6TExaOElnSHJZNXRCSGVqbmo0U0JNblNpUXpBYjlvN2dRVFAxRUtKOWcv?=
 =?utf-8?B?NEJIUzJMRDZHVTBDZmd5Ni8vdDkyYlFMSFNHK05xTXVMR2ZUcDY3bURHNEk5?=
 =?utf-8?Q?l2e2wSpXL+dNv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce074cf-2a89-4440-ce44-08d8cc7f1e3b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 22:16:01.4733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EyGqGHwXS/998jYdb80+14mBx78xjRHAJRrZpPjN7Z6QdvLtKWWN4252TlAAikKqdSNQ/ZKA8v3fLtvCKjMaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2349
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvOC8yMSAxMToyMyBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBNb24sIEZlYiA4
LCAyMDIxIGF0IDM6MDAgUE0gQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPiB3cm90ZToKPj4gQW0gMDguMDIuMjEgdW0gMTE6MTEgc2NocmllYiBEYW5pZWwgVmV0dGVy
Ogo+Pj4gT24gTW9uLCBGZWIgMDgsIDIwMjEgYXQgMTE6MDM6MTVBTSArMDEwMCwgQ2hyaXN0aWFu
IEvDtm5pZyB3cm90ZToKPj4+PiBBbSAwOC4wMi4yMSB1bSAxMDo0OCBzY2hyaWViIERhbmllbCBW
ZXR0ZXI6Cj4+Pj4+IE9uIE1vbiwgRmViIDA4LCAyMDIxIGF0IDEwOjM3OjE5QU0gKzAxMDAsIENo
cmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+PiBBbSAwNy4wMi4yMSB1bSAyMjo1MCBzY2hyaWVi
IERhbmllbCBWZXR0ZXI6Cj4+Pj4+Pj4gW1NOSVBdCj4+Pj4+Pj4+IENsYXJpZmljYXRpb24gLSBh
cyBmYXIgYXMgSSBrbm93IHRoZXJlIGFyZSBubyBwYWdlIGZhdWx0IGhhbmRsZXJzIGZvciBrZXJu
ZWwKPj4+Pj4+Pj4gbWFwcGluZ3MuIEFuZCB3ZSBhcmUgdGFsa2luZyBhYm91dCBrZXJuZWwgbWFw
cGluZ3MgaGVyZSwgcmlnaHQgPyAgSWYgdGhlcmUgd2VyZQo+Pj4+Pj4+PiBJIGNvdWxkIHNvbHZl
IGFsbCB0aG9zZSBpc3N1ZXMgdGhlIHNhbWUgYXMgSSBkbyBmb3IgdXNlciBtYXBwaW5ncywgYnkK
Pj4+Pj4+Pj4gaW52YWxpZGF0aW5nIGFsbCBleGlzdGluZyBtYXBwaW5ncyBpbiB0aGUga2VybmVs
IChib3RoIGttYXBzIGFuZCBpb3JlYW1wcylhbmQKPj4+Pj4+Pj4gaW5zZXJ0IGR1bW15IHplcm8g
b3IgfjAgZmlsbGVkIHBhZ2UgaW5zdGVhZC4KPj4+Pj4+Pj4gQWxzbywgSSBhc3N1bWUgZm9yY2Vm
dWxseSByZW1hcHBpbmcgdGhlIElPIEJBUiB0byB+MCBmaWxsZWQgcGFnZSB3b3VsZCBpbnZvbHZl
Cj4+Pj4+Pj4+IGlvcmVtYXAgQVBJIGFuZCBpdCdzIG5vdCBzb21ldGhpbmcgdGhhdCBJIHRoaW5r
IGNhbiBiZSBlYXNpbHkgZG9uZSBhY2NvcmRpbmcgdG8KPj4+Pj4+Pj4gYW0gYW5zd2VyIGkgZ290
IHRvIGEgcmVsYXRlZCB0b3BpYyBhIGZldyB3ZWVrcyBhZ28KPj4+Pj4+Pj4gaHR0cHM6Ly9uYW0x
MS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGd3d3
LnNwaW5pY3MubmV0JTJGbGlzdHMlMkZsaW51eC1wY2klMkZtc2cxMDMzOTYuaHRtbCZhbXA7ZGF0
YT0wNCU3QzAxJTdDQW5kcmV5Lkdyb2R6b3Zza3klNDBhbWQuY29tJTdDOWQxYmRmNGNlZTUwNGNk
NzFiNDkwOGQ4Y2M0ZGYzMTAlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAl
N0MwJTdDNjM3NDgzOTgyNDU0NjA4MjQ5JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9p
TUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUz
RCU3QzEwMDAmYW1wO3NkYXRhPUFudyUyQk93SiUyQjV0dmpXM3Rta1ZOZHoxMyUyQloxOHZkcGZP
TFdxc1VaTDdEMkklM0QmYW1wO3Jlc2VydmVkPTAgKHRoYXQgd2FzIHRoZSBvbmx5IHJlcGx5Cj4+
Pj4+Pj4+IGkgZ290KQo+Pj4+Pj4+IG1taW90cmFjZSBjYW4sIGJ1dCBvbmx5IGZvciBkZWJ1Zywg
YW5kIG9ubHkgb24geDg2IHBsYXRmb3JtczoKPj4+Pj4+Pgo+Pj4+Pj4+IGh0dHBzOi8vbmFtMTEu
c2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnd3dy5r
ZXJuZWwub3JnJTJGZG9jJTJGaHRtbCUyRmxhdGVzdCUyRnRyYWNlJTJGbW1pb3RyYWNlLmh0bWwm
YW1wO2RhdGE9MDQlN0MwMSU3Q0FuZHJleS5Hcm9kem92c2t5JTQwYW1kLmNvbSU3QzlkMWJkZjRj
ZWU1MDRjZDcxYjQ5MDhkOGNjNGRmMzEwJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4
M2QlN0MwJTdDMCU3QzYzNzQ4Mzk4MjQ1NDYwODI0OSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhl
eUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZD
STZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1XYTdCRk55U1ZRSkx5RDZXWTRwWkhUUDFRZmVad0Q3
RjV5ZEJyWHV4cHBRJTNEJmFtcDtyZXNlcnZlZD0wCj4+Pj4+Pj4KPj4+Pj4+PiBTaG91bGQgYmUg
ZmVhc2libGUgKGJ1dCBtYXliZSBub3Qgd29ydGggdGhlIGVmZm9ydCkgdG8gZXh0ZW5kIHRoaXMg
dG8KPj4+Pj4+PiBzdXBwb3J0IGZha2UgdW5wbHVnLgo+Pj4+Pj4gTWhtLCBpbnRlcmVzdGluZyBp
ZGVhIHlvdSBndXlzIGJyb3VnaHQgdXAgaGVyZS4KPj4+Pj4+Cj4+Pj4+PiBXZSBkb24ndCBuZWVk
IGEgcGFnZSBmYXVsdCBmb3IgdGhpcyB0byB3b3JrLCBhbGwgd2UgbmVlZCB0byBkbyBpcyB0byBp
bnNlcnQKPj4+Pj4+IGR1bW15IFBURXMgaW50byB0aGUga2VybmVscyBwYWdlIHRhYmxlIGF0IHRo
ZSBwbGFjZSB3aGVyZSBwcmV2aW91c2x5IHRoZQo+Pj4+Pj4gTU1JTyBtYXBwaW5nIGhhcyBiZWVu
Lgo+Pj4+PiBTaW1wbHkgcHRlIHRyaWNrIGlzbid0IGVub3VnaCwgYmVjYXVzZSB3ZSBuZWVkOgo+
Pj4+PiAtIGRyb3AgYWxsIHdyaXRlcyBzaWxlbnRseQo+Pj4+PiAtIGFsbCByZWFkcyByZXR1cm4g
MHhmZgo+Pj4+Pgo+Pj4+PiBwdGVzIGNhbid0IGRvIHRoYXQgdGhlbXNlbHZlcywgd2UgbWluaW1h
bGx5IG5lZWQgd3JpdGUgcHJvdGVjdGlvbiBhbmQgdGhlbgo+Pj4+PiBzaWxlbnRseSBwcm9jZWVk
IG9uIGVhY2ggd3JpdGUgZmF1bHQgd2l0aG91dCByZXN0YXJ0aW5nIHRoZSBpbnN0cnVjdGlvbi4K
Pj4+Pj4gQmV0dGVyIHdvdWxkIGJlIHRvIG9ubHkgY2F0Y2ggcmVhZHMsIGJ1dCB4ODYgZG9lc24n
dCBkbyB3cml0ZS1vbmx5IHB0ZQo+Pj4+PiBwZXJtaXNzaW9ucyBhZmFpay4KPj4+PiBZb3UgYXJl
IG5vdCB0aGlua2luZyBmYXIgZW5vdWdoIDopCj4+Pj4KPj4+PiBUaGUgZHVtbXkgUFRFIGlzIHBv
aW50IHRvIGEgZHVtbXkgTU1JTyBwYWdlIHdoaWNoIGlzIGp1c3QgbmV2ZXIgdXNlZC4KPj4+Pgo+
Pj4+IFRoYXQgaGFzdCB0aGUgZXhhY3Qgc2FtZSBwcm9wZXJ0aWVzIHRoYW4gb3VyIHJlbW92ZWQg
TU1JTyBzcGFjZSBqdXN0IGRvZXNuJ3QKPj4+PiBnb2VzIGJhbmFuYXMgd2hlbiBhIG5ldyBkZXZp
Y2UgaXMgTU1JTyBtYXBwZWQgaW50byB0aGF0IGFuZCBvdXIgZHJpdmVyIHN0aWxsCj4+Pj4gdHJp
ZXMgdG8gd3JpdGUgdGhlcmUuCj4+PiBIbSwgYnV0IHdoZXJlIGRvIHdlIGdldCBzdWNoIGEgImd1
YXJhbnRlZWQgbmV2ZXIgdXNlZCIgbW1pbyBwYWdlIGZyb20/Cj4+IFdlbGwgd2UgaGF2ZSB0b25z
IG9mIHVudXNlZCBJTyBzcGFjZSBvbiA2NGJpdCBzeXN0ZW1zIHRoZXNlIGRheXMuCj4+Cj4+IERv
ZXNuJ3QgcmVhbGx5IG5lZWRzIHRvIGJlIFBDSWUgYWRkcmVzcyBzcGFjZSwgZG9lc24ndCBpdD8K
PiBUaGF0IHNvdW5kcyB2ZXJ5IHRydXN0aW5nIHRvIG1vZGVybiBzeXN0ZW1zIG5vdCBkZWNvZGlu
ZyByYW5kb20KPiByYW5nZXMuIEUuZy4gdGhlIHBjaSBjb2RlIHN0b3BwZWQgZXh0ZW5kaW5nIHRo
ZSBob3N0IGJyaWRnZSB3aW5kb3dzIG9uCj4gaXRzIG93biwgZW50aXJlbHkgcmVseWluZyBvbiB0
aGUgYWNwaSBwcm92aWRlZCByYW5nZXMsIHRvIGF2b2lkCj4gc3RvbXBpbmcgb24gc3R1ZmYgdGhh
dCdzIHRoZSBidXQgbm90IGxpc3RlZCBhbnl3aGVyZS4KPgo+IEkgZ3Vlc3MgaWYgd2UgaGF2ZSBh
IHJhbmdlIGJlaGluZCBhIHBjaSBicmlkZ2UsIHdoaWNoIGlzbid0IHVzZWQgYnkKPiBhbnkgZGV2
aWNlLCBidXQgZGVjb2RlZCBieSB0aGUgYnJpZGdlLCB0aGVuIHRoYXQgc2hvdWxkIGJlIHNhZmUK
PiBlbm91Z2guIE1heWJlIGNvdWxkIGV2ZW4gaGF2ZSBhbiBvcHRpb24gaW4gdXBzdHJlYW0gdG8g
ZG8gdGhhdCBvbgo+IHVucGx1ZywgaWYgYSBjZXJ0YWluIGZsYWcgaXMgc2V0LCBvciBhIGNtZGxp
bmUgb3B0aW9uLgo+IC1EYW5pZWwKCgpRdWVzdGlvbiAtIFdoeSBjYW4ndCB3ZSBqdXN0IHNldCB0
aG9zZSBQVEVzIHRvIHBvaW50IHRvIHN5c3RlbSBtZW1vcnkgKGFub3RoZXIgClJPIGR1bW15IHBh
Z2UpCmZpbGxlZCB3aXRoIDFzID8KCkFuZHJleQoKCj4KPj4gQ2hyaXN0aWFuLgo+Pgo+Pj4gSXQn
cyBhIG5pZnR5IGlkZWEgaW5kZWVkIG90aGVyd2lzZSAuLi4KPj4+IC1EYW5pZWwKPj4+Cj4+Pj4g
UmVnYXJkcywKPj4+PiBDaHJpc3RpYW4uCj4+Pj4KPj4+Pgo+Pj4+Pj4+Pj4gQnV0IHVnaCAuLi4K
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBPdG9oIHZhbGlkYXRpbmcgYW4gZW50aXJlIGRyaXZlciBsaWtl
IGFtZGdwdSB3aXRob3V0IHN1Y2ggYSB0cmljawo+Pj4+Pj4+Pj4gYWdhaW5zdCAweGZmIHJlYWRz
IGlzIHByYWN0aWNhbGx5IGltcG9zc2libGUuIFNvIG1heWJlIHlvdSBuZWVkIHRvIGFkZAo+Pj4+
Pj4+Pj4gdGhpcyBhcyBvbmUgb2YgdGhlIHRhc2tzIGhlcmU/Cj4+Pj4+Pj4+IE9yIEkgY291bGQg
anVzdCBmb3IgdmFsaWRhdGlvbiBwdXJwb3NlcyByZXR1cm4gfjAgZnJvbSBhbGwgcmVnIHJlYWRz
IGluIHRoZSBjb2RlCj4+Pj4+Pj4+IGFuZCBpZ25vcmUgd3JpdGVzIGlmIGRybV9kZXZfdW5wbHVn
Z2VkLCB0aGlzIGNvdWxkIGFscmVhZHkgZWFzaWx5IHZhbGlkYXRlIGEgYmlnCj4+Pj4+Pj4+IHBv
cnRpb24gb2YgdGhlIGNvZGUgZmxvdyB1bmRlciBzdWNoIHNjZW5hcmlvLgo+Pj4+Pj4+IEhtIHll
YWggaWYgeW91ciByZWFsbHkgd3JhcCB0aGVtIGFsbCwgdGhhdCBzaG91bGQgd29yayB0b28uIFNp
bmNlCj4+Pj4+Pj4gaW9tbWFwcGluZ3MgaGF2ZSBfX2lvbWVtIHBvaW50ZXIgdHlwZSwgYXMgbG9u
ZyBhcyBhbWRncHUgaXMgc3BhcnNlCj4+Pj4+Pj4gd2FybmluZyBmcmVlLCBzaG91bGQgYmUgZG9h
YmxlIHRvIGd1YXJhbnRlZSB0aGlzLgo+Pj4+Pj4gUHJvYmxlbSBpcyB0aGF0IH4wIGlzIG5vdCBh
bHdheXMgYSB2YWxpZCByZWdpc3RlciB2YWx1ZS4KPj4+Pj4+Cj4+Pj4+PiBZb3Ugd291bGQgbmVl
ZCB0byBhdWRpdCBldmVyeSByZWdpc3RlciByZWFkIHRoYXQgaXQgZG9lc24ndCB1c2UgdGhlIHJl
dHVybmVkCj4+Pj4+PiB2YWx1ZSBibGluZGx5IGFzIGluZGV4IG9yIHNpbWlsYXIuIFRoYXQgaXMg
cXVpdGUgYSBiaXQgb2Ygd29yay4KPj4+Pj4gWWVhaCB0aGF0J3MgdGhlIGVudGlyZSBjcnV4IGhl
cmUgOi0vCj4+Pj4+IC1EYW5pZWwKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
