Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C3530EE15
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 09:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5276ECED;
	Thu,  4 Feb 2021 08:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680059.outbound.protection.outlook.com [40.107.68.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317786ECED
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 08:13:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncHSS6DIfj8JdSMWwvrNGqxgggctMk+IF5g4H1mwDFquKEp+6rD0tEXKPKKErVZEt3CyBr2i9QIYhc40HtkcTMVON6Jnw2unHI1ZeYVNpaeas37Wc4NfnIs0sY4692OYeO5YW9h4fkv0ngY5dyaDeUxID6t18WCjGU13o9t/ZbzraXm/GPvP3F8zvkZiOs80osZgr/nP+hVOGENsve/rZQk5TNKcrgFu/Ovl71216CNl6nrO7+tZ/S4Is1qmEVv+POHox7MV96g0zldIb5z63+7AbZ+Wmm/NeQ1csKkX6ftBa6HIW9DT3y+VFQrJWThzaBTNluIZ6xLVKCitMgHFlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9ogDFnLdEyi0OjS9eVVZEDsOyrAP2KPUA4tvI42bks=;
 b=hnwNjjQYgNhu/dkYPneS9FSwxzcDJXn2N8oDFTyq+siG0JbmvoxQhj6q8fP752hSWVc6ndNAyjGh11X/z5JACoyqQXeesO2F4IwoLlsIf12e/NkmNp1aT7zIVtfKKCRZkiFXIlqtG3sgp7Elv1TVkg8e1o5Agj9RsjYG09XCmbhng/woXb6wU6q8LI7YIuDYLcVkjmXYjMJT92Irx8V/2qGsmFW8CrtqnLHxV1cqfJXiBP7nM7MRC9rgawgir6U1+CaoGMMWheS9SE7Ftz77hNPxo2v+Z/n8GaNw6AXC2uB/MsmIqM57hvK59iFwj4uPm7wHEd75MCNePHmOpCbcRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9ogDFnLdEyi0OjS9eVVZEDsOyrAP2KPUA4tvI42bks=;
 b=gta/v56bs7iSVjl0QCmEi2FJnnGwYd0BVYJIDqbk3ci0md1B0ynt15jEqTmWHh/ofKS6anT4NXNNES5mbUGA0MwiPSMJoJY2nqWXg6mPYCfq5JCo+muRNVWVREaU5GkBkVeDuD0Kjcf2H5c1spg0CiY4Cl4iPdhHESkxVTV3NaM=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4659.namprd12.prod.outlook.com (2603:10b6:207:1d::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Thu, 4 Feb
 2021 08:13:23 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3805.024; Thu, 4 Feb 2021
 08:13:22 +0000
Subject: Re: [Linaro-mm-sig] [PATCH v3] dmabuf: Add the capability to expose
 DMA-BUF stats in sysfs
To: Hridya Valsaraju <hridya@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Android Kernel Team <kernel-team@android.com>,
 kernel test robot <lkp@intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
 Hyesoo Yu <hyesoo.yu@samsung.com>, Suren Baghdasaryan <surenb@google.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210126204240.418297-1-hridya@google.com>
 <YBFXPbePURupbe+y@kroah.com>
 <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com>
 <c0684400-c1e2-0ebd-ad09-cb7b24db5764@gmail.com>
 <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
 <CAKMK7uEwm5tLT3fo_+QtzUthht3JLkhCpZ+6yJ2XSB6U4Qp5wg@mail.gmail.com>
 <CA+wgaPPmTQ2x37rMVsEW=D-adHHyp12sTAh-Gfq3Fn0rOBBHQA@mail.gmail.com>
 <YBp6LJhg6mTN1U5G@phenom.ffwll.local>
 <CA+wgaPN-e1h8OHAJ4y9Cj+hoiWeOz2gizMAvoSnBQKvexi8ayQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3a5e5164-e6d5-c487-71d8-910f943aee1a@amd.com>
Date: Thu, 4 Feb 2021 09:13:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CA+wgaPN-e1h8OHAJ4y9Cj+hoiWeOz2gizMAvoSnBQKvexi8ayQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR03CA0013.eurprd03.prod.outlook.com
 (2603:10a6:208:14::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0013.eurprd03.prod.outlook.com (2603:10a6:208:14::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Thu, 4 Feb 2021 08:13:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: adaafa9b-6953-4a75-c039-08d8c8e4bcae
X-MS-TrafficTypeDiagnostic: BL0PR12MB4659:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4659D1CB885BAFC7E0AA9EC183B39@BL0PR12MB4659.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tw6aRVHP1KFhRTNLzanvoR/PQ4u55xSXhD2z+BmCYQ9GVxGIdIOuNhvliYf1b/UTwC714cEMtajRufjX+rFRt8xjL+hGfWtNJKhGoqAvEPKn8h2ME7EK2rDjfLAgod1PdO8GiwQmKe4nlpxF46kvLGQnIVWnlFrpU5wAlY7XjuCRkaCQW6JVNDTUmAowLQLzOQq/4Ua+zBzV2LhC4aieqNJmCTPfqSn9/IowyU7cNgLNfNXEeLgURW2SUhTgxCua13dc7+GevVki3z8Ijte8i+mx4bszjR9MMr0tOmGkkeGZeADP+qUPc09q0wNnxogZv+Y7dTxUgMlPOFfm/vuSvfO/xVYEoW6nqoe6d0oB9YULkwORNBjOofEwRqPcYw0cY4jANFK8iOJ6bjudk+gkl0rwWNknzwNJysqEMFU51UVQr+PtrC8iP7ipPH0AG1aH86g7bEYRAJsuvLZfR6lNcDafwJJJS+in+i+Qmk3o8KtHFRRrT7l4pI4fFpZe+CKppfPwY4FriiOQEGzWi11lHfLd0MnYtilc/QWH4uAE5Rg88Y+RfGg/1LfTs9gKfrFRkypXon49RF/NjgkT9N4J5vT7Lh0rTc3CLCmMuYti/IJkNr4qCL0jBTw/cNkBbxxnMXv0wBKg+PLEQF6AWqJqeDb9zf3e7+dBg/whM5cLlQ/iBiMN+y7Qpcofi04SRjJ3x44v9stm5HWMrRVbZadKww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(36756003)(52116002)(7416002)(4326008)(110136005)(66574015)(83380400001)(66946007)(8676002)(31696002)(921005)(316002)(53546011)(31686004)(86362001)(8936002)(2906002)(5660300002)(6666004)(6486002)(2616005)(66476007)(186003)(66556008)(966005)(16526019)(478600001)(45080400002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OVE3RklETkg5TnNFalJ6bjlySjRxU1dvbHBQOUdraXRFalFmUDZ6b3ZPMFFB?=
 =?utf-8?B?WHRoSTlqRytENHg2MmpqbFNtc2J2cFRySnBlT0FCdTRKNjZnUmwxSzlGY2JT?=
 =?utf-8?B?ekZIM1dQQjNUWXhyZjhZbmp0WThpRFpNNDBLNC9pZG9NRmwrSkxZcmNUdFRY?=
 =?utf-8?B?c0lXQTltUzI1WjJSTlBBZXQ4UkpJUVYxMXBUejVWOW5OcVdmTGFSQWpZRWRU?=
 =?utf-8?B?YXJzUk9JTmpSUGhqTXMzSUpoZ04rTXkvNWsvTHIvQ2xCdmZXOGVjRmltZ21P?=
 =?utf-8?B?SFhYSGRiaVk4dUNIeVNlekc4YjNxMFJOT3dUb2x5OWNWbUZvS1RqZ05mblBR?=
 =?utf-8?B?RTN5QVFhN0Y3cU5RUWg2UXhCcWZtbzc5NFpacm5pbVJMamlJRW9IQjVnMEpv?=
 =?utf-8?B?N09JQW1paUJPNHh5c1IwbXpQdXJpUFVaUkh1dlpKaHhPS01JOHNIWXlyaFUw?=
 =?utf-8?B?UDdybk9sM3NxUGwxZ0VJRkc1ZVIyUTI0TkJSLytRWjFEcEllNlhJdForWGdM?=
 =?utf-8?B?Q3FwK0dEV29nWWlGZURLMSttTWJUMWxWOFlzMXFYQ29WL0lrdUJOWXAxYUEw?=
 =?utf-8?B?Wmp0cnRwVnNmWlg5cDFWOUJrNDFhUUdoR25mYWhNbUVlVU5sSGdheFRSNGRi?=
 =?utf-8?B?bVRodDRxZ3VzNm1wUzN5ZW9EcGEyeWJNclluVXVtQnVUNTkwVW16eE4vN0dV?=
 =?utf-8?B?TTdQNG4wRU1yNlUvcFY5QVRZR0F4anoySCtsT0VpcWxzN0RjUEtyQUdubHFI?=
 =?utf-8?B?alpDOXFybGpZTktaQk44ZzZwczVNR3NsdXZzUDhJa2hWcm1nYWs2SCt0cXBr?=
 =?utf-8?B?THVyRWtNZ3p0R3hndktmak1YL0FoUGR1b3hvSVk2UmlRTktLSE91aStRbk0z?=
 =?utf-8?B?RFkwNzR0ZVdnRlFYdGVETXJoRFd3ZGFDNXRFbDk1d1ZqUnc4RlJMcGlaWlBt?=
 =?utf-8?B?SHFaNHJ4dUMreVphQ2s2MS84U3RxcE9HRmJxOEk4UVZnMUZOMkVIZytpNkEx?=
 =?utf-8?B?Rzd5d2lVOWpqeXZJbFJEMjdUVFpTbDRmTGJZekpHL2dIN1ZQR1hzdXhQTnB4?=
 =?utf-8?B?bzM3d2QzaUduUnlJREsyWXpHR2NHL2kvUTB1c0l6VEVEUEZrL3g1b2V3R2J2?=
 =?utf-8?B?NndOeFBlcjg4Z2t3MGQxTVcvd2RsSHZwQlNmMXpBSHhnbjRjV1oyaS9hNmlj?=
 =?utf-8?B?di9LQmhOYTBCUGV6MmkxSnh0SDNwcWFsU21ZQlZrNWw4L0k1eDNsTW9QZU1z?=
 =?utf-8?B?eXBiUlp6dTJSNFYrbzJPcGlJU1RncG1DVFNUWmZld3R5SjZPNE9Sb0hXN3NU?=
 =?utf-8?B?RnRyK2hmRGp4aHJSMXdZTGkwTkU5UkZ3b2pYUkpnVzZ6Sk53d29zb2NOaU1C?=
 =?utf-8?B?RDNiM04rc1dldCtSKzZRbVRIREZkVnVFSjl3cFNsTzdGZi92RS9ZWmFpWDlH?=
 =?utf-8?B?S0Zhc0tid0x6c21IaW9LbW0rcmk5M0FxbTI2WElSdGttd2hhM1Y2eUpLR0gz?=
 =?utf-8?B?RG5HaWVLQWFwdktMRm5VMmVqMkpsR0dlTjNZN25FWTBwMHM0SXBEenNjQk4x?=
 =?utf-8?B?WHg5R1JRVS9uNWF5c0xQRjNtOVp6cUtLN1dnMXdxb1VseEVzaWxBaDMvT1pa?=
 =?utf-8?B?aHVxRjM2WnRBTFFwUjVIVm8vMUNYZjRCRjF4VFV4eW5DdWxXbDlDQ2hEdlIr?=
 =?utf-8?B?U09vanJjdGxtSFZVSzhCaFhNbTBnTUw5N0xqZnpBT3I3OEZMaVhuYnhzR25R?=
 =?utf-8?B?a3phNmlsM2RUeTFUSkFTRkg2OUJYakRock4yVm93Vi9hY3RBSU1WbjlXeVBj?=
 =?utf-8?B?REUvVEM1R09URHllMnhLYktRY1dYdEJDZTBOWkZ0VVcrOE1JUERlUHdsd094?=
 =?utf-8?Q?mdIyYCPUBJcBE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adaafa9b-6953-4a75-c039-08d8c8e4bcae
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 08:13:22.4878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vs5HdKvX3xQj2MRiXzzfEBorA9RTuxQpBfHP4z9Murx8vwR4AJPjCEQ3hOkn9lWh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4659
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDMuMDIuMjEgdW0gMjE6MTQgc2NocmllYiBIcmlkeWEgVmFsc2FyYWp1Ogo+IE9uIFdlZCwg
RmViIDMsIDIwMjEgYXQgMjoyNSBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdy
b3RlOgo+PiBPbiBNb24sIEZlYiAwMSwgMjAyMSBhdCAwMTowMjozMFBNIC0wODAwLCBIcmlkeWEg
VmFsc2FyYWp1IHdyb3RlOgo+Pj4gT24gTW9uLCBGZWIgMSwgMjAyMSBhdCAxMDozNyBBTSBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+Pj4+IE9uIFRodSwgSmFuIDI4LCAy
MDIxIGF0IDE6MDMgUE0gU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4gd3Jv
dGU6Cj4+Pj4+IE9uIFRodSwgMjggSmFuIDIwMjEgYXQgMTc6MjMsIENocmlzdGlhbiBLw7ZuaWcK
Pj4+Pj4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPj4+Pj4+IEFt
IDI4LjAxLjIxIHVtIDEyOjAwIHNjaHJpZWIgU3VtaXQgU2Vtd2FsOgo+Pj4+Pj4+IEhpIEhyaWR5
YSwKPj4+Pj4+Pgo+Pj4+Pj4+IE9uIFdlZCwgMjcgSmFuIDIwMjEgYXQgMTc6MzYsIEdyZWcgS0gg
PGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPj4+Pj4+Pj4gT24gVHVlLCBKYW4g
MjYsIDIwMjEgYXQgMTI6NDI6MzZQTSAtMDgwMCwgSHJpZHlhIFZhbHNhcmFqdSB3cm90ZToKPj4+
Pj4+Pj4+IFRoaXMgcGF0Y2ggYWxsb3dzIHN0YXRpc3RpY3MgdG8gYmUgZW5hYmxlZCBmb3IgZWFj
aCBETUEtQlVGIGluCj4+Pj4+Pj4+PiBzeXNmcyBieSBlbmFibGluZyB0aGUgY29uZmlnIENPTkZJ
R19ETUFCVUZfU1lTRlNfU1RBVFMuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gVGhlIGZvbGxvd2luZyBz
dGF0cyB3aWxsIGJlIGV4cG9zZWQgYnkgdGhlIGludGVyZmFjZToKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+
PiAvc3lzL2tlcm5lbC9kbWFidWYvYnVmZmVycy88aW5vZGVfbnVtYmVyPi9leHBvcnRlcl9uYW1l
Cj4+Pj4+Pj4+PiAvc3lzL2tlcm5lbC9kbWFidWYvYnVmZmVycy88aW5vZGVfbnVtYmVyPi9zaXpl
Cj4+Pj4+Pj4+PiAvc3lzL2tlcm5lbC9kbWFidWYvYnVmZmVycy88aW5vZGVfbnVtYmVyPi9hdHRh
Y2htZW50cy88YXR0YWNoX3VpZD4vZGV2aWNlCj4+Pj4+Pj4+PiAvc3lzL2tlcm5lbC9kbWFidWYv
YnVmZmVycy88aW5vZGVfbnVtYmVyPi9hdHRhY2htZW50cy88YXR0YWNoX3VpZD4vbWFwX2NvdW50
ZXIKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBUaGUgaW5vZGVfbnVtYmVyIGlzIHVuaXF1ZSBmb3IgZWFj
aCBETUEtQlVGIGFuZCB3YXMgYWRkZWQgZWFybGllciBbMV0KPj4+Pj4+Pj4+IGluIG9yZGVyIHRv
IGFsbG93IHVzZXJzcGFjZSB0byB0cmFjayBETUEtQlVGIHVzYWdlIGFjcm9zcyBkaWZmZXJlbnQK
Pj4+Pj4+Pj4+IHByb2Nlc3Nlcy4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBDdXJyZW50bHksIHRoaXMg
aW5mb3JtYXRpb24gaXMgZXhwb3NlZCBpbgo+Pj4+Pj4+Pj4gL3N5cy9rZXJuZWwvZGVidWcvZG1h
X2J1Zi9idWZpbmZvLgo+Pj4+Pj4+Pj4gSG93ZXZlciwgc2luY2UgZGVidWdmcyBpcyBjb25zaWRl
cmVkIHVuc2FmZSB0byBiZSBtb3VudGVkIGluIHByb2R1Y3Rpb24sCj4+Pj4+Pj4+PiBpdCBpcyBi
ZWluZyBkdXBsaWNhdGVkIGluIHN5c2ZzLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRoaXMgaW5mb3Jt
YXRpb24gd2lsbCBiZSB1c2VkIHRvIGRlcml2ZSBETUEtQlVGCj4+Pj4+Pj4+PiBwZXItZXhwb3J0
ZXIgc3RhdHMgYW5kIHBlci1kZXZpY2UgdXNhZ2Ugc3RhdHMgZm9yIEFuZHJvaWQgQnVnIHJlcG9y
dHMuCj4+Pj4+Pj4+PiBUaGUgY29ycmVzcG9uZGluZyB1c2Vyc3BhY2UgY2hhbmdlcyBjYW4gYmUg
Zm91bmQgYXQgWzJdLgo+Pj4+Pj4+Pj4gVGVsZW1ldHJ5IHRvb2xzIHdpbGwgYWxzbyBjYXB0dXJl
IHRoaXMgaW5mb3JtYXRpb24oYWxvbmcgd2l0aCBvdGhlcgo+Pj4+Pj4+Pj4gbWVtb3J5IG1ldHJp
Y3MpIHBlcmlvZGljYWxseSBhcyB3ZWxsIGFzIG9uIGltcG9ydGFudCBldmVudHMgbGlrZSBhCj4+
Pj4+Pj4+PiBmb3JlZ3JvdW5kIGFwcCBraWxsICh3aGljaCBtaWdodCBoYXZlIGJlZW4gdHJpZ2dl
cmVkIGJ5IExvdyBNZW1vcnkKPj4+Pj4+Pj4+IEtpbGxlcikuIEl0IHdpbGwgYWxzbyBjb250cmli
dXRlIHRvIHByb3ZpZGUgYSBzbmFwc2hvdCBvZiB0aGUgc3lzdGVtCj4+Pj4+Pj4+PiBtZW1vcnkg
dXNhZ2Ugb24gb3RoZXIgZXZlbnRzIHN1Y2ggYXMgT09NIGtpbGxzIGFuZCBBcHBsaWNhdGlvbiBO
b3QKPj4+Pj4+Pj4+IFJlc3BvbmRpbmcgZXZlbnRzLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEEgc2hl
bGwgc2NyaXB0IHRoYXQgY2FuIGJlIHJ1biBvbiBhIGNsYXNzaWMgTGludXggZW52aXJvbm1lbnQg
dG8gcmVhZAo+Pj4+Pj4+Pj4gb3V0IHRoZSBETUEtQlVGIHN0YXRpc3RpY3MgY2FuIGJlIGZvdW5k
IGF0IFszXShzdWdnZXN0ZWQgYnkgSm9obgo+Pj4+Pj4+Pj4gU3R1bHR6KS4KPj4+Pj4+Pj4+Cj4+
Pj4+Pj4+PiBUaGUgcGF0Y2ggY29udGFpbnMgdGhlIGZvbGxvd2luZyBpbXByb3ZlbWVudHMgb3Zl
ciB0aGUgcHJldmlvdXMgdmVyc2lvbjoKPj4+Pj4+Pj4+IDEpIEVhY2ggYXR0YWNobWVudCBpcyBy
ZXByZXNlbnRlZCBieSBpdHMgb3duIGRpcmVjdG9yeSB0byBhbGxvdyBjcmVhdGluZwo+Pj4+Pj4+
Pj4gYSBzeW1saW5rIHRvIHRoZSBpbXBvcnRpbmcgZGV2aWNlIGFuZCB0byBhbHNvIHByb3ZpZGUg
cm9vbSBmb3IgZnV0dXJlCj4+Pj4+Pj4+PiBleHBhbnNpb24uCj4+Pj4+Pj4+PiAyKSBUaGUgbnVt
YmVyIG9mIGRpc3RpbmN0IG1hcHBpbmdzIG9mIGVhY2ggYXR0YWNobWVudCBpcyBleHBvc2VkIGlu
IGEKPj4+Pj4+Pj4+IHNlcGFyYXRlIGZpbGUuCj4+Pj4+Pj4+PiAzKSBUaGUgcGVyLWJ1ZmZlciBz
dGF0aXN0aWNzIGFyZSBub3cgaW4gL3N5cy9rZXJuZWwvZG1hYnVmL2J1ZmZlcnMKPj4+Pj4+Pj4+
IGlub3JkZXIgdG8gbWFrZSB0aGUgaW50ZXJmYWNlIGV4cGFuZGFibGUgaW4gZnV0dXJlLgo+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+IEFsbCBvZiB0aGUgaW1wcm92ZW1lbnRzIGFib3ZlIGFyZSBiYXNlZCBv
biBzdWdnZXN0aW9ucy9mZWVkYmFjayBmcm9tCj4+Pj4+Pj4+PiBEYW5pZWwgVmV0dGVyIGFuZCBD
aHJpc3RpYW4gS8O2bmlnLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFsxXTogaHR0cHM6Ly9uYW0xMS5z
YWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbG9yZS5r
ZXJuZWwub3JnJTJGcGF0Y2h3b3JrJTJGcGF0Y2glMkYxMDg4NzkxJTJGJmFtcDtkYXRhPTA0JTdD
MDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzMyZmY4MjhiODM4ZTQ0YjFkZTZmMDhk
OGM4ODA1OTEzJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYz
NzQ3OTgwMDg4Njc2ODg1NSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3
TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAw
JmFtcDtzZGF0YT1pbVZvSmJhZFYyMjElMkY2dTMyZGlTeUVJQ0xrN1dVTmFrejhHNzQyUlBTYUEl
M0QmYW1wO3Jlc2VydmVkPTAKPj4+Pj4+Pj4+IFsyXTogaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGYW5kcm9pZC1yZXZpZXcu
Z29vZ2xlc291cmNlLmNvbSUyRnElMkZ0b3BpYyUzQSUyNTIyZG1hYnVmLXN5c2ZzJTI1MjImYW1w
O2RhdGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDMzJmZjgyOGI4Mzhl
NDRiMWRlNmYwOGQ4Yzg4MDU5MTMlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3
QzAlN0MwJTdDNjM3NDc5ODAwODg2Nzc4ODM4JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJ
am9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1u
MCUzRCU3QzEwMDAmYW1wO3NkYXRhPVg3OE1INkl2ZGNFMW1HTW5nclZkQllvb2k5M3ZwanZmTFU5
a1FIalp5S28lM0QmYW1wO3Jlc2VydmVkPTArKHN0YXR1czpvcGVuJTIwT1IlMjBzdGF0dXM6bWVy
Z2VkKQo+Pj4+Pj4+Pj4gWzNdOiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91
dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZhbmRyb2lkLXJldmlldy5nb29nbGVzb3VyY2Uu
Y29tJTJGYyUyRnBsYXRmb3JtJTJGc3lzdGVtJTJGbWVtb3J5JTJGbGlibWVtaW5mbyUyRiUyQiUy
RjE1NDk3MzQmYW1wO2RhdGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdD
MzJmZjgyOGI4MzhlNDRiMWRlNmYwOGQ4Yzg4MDU5MTMlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4
MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDc5ODAwODg2Nzc4ODM4JTdDVW5rbm93biU3Q1RXRnBi
R1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFX
d2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPUpIN201eXNwWEtEcVZYNURCMzgwY25V
NGtXTlN5aDZjdERhcGhKdk95dzglM0QmYW1wO3Jlc2VydmVkPTAKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBIcmlkeWEgVmFsc2FyYWp1IDxocmlkeWFAZ29vZ2xlLmNvbT4KPj4+
Pj4+Pj4+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPj4+
Pj4+PiBUaGFua3MgZm9yIHRoZSBwYXRjaCEKPj4+Pj4+Pgo+Pj4+Pj4+IENocmlzdGlhbjogSWYg
eW91J3JlIHNhdGlzZmllZCB3aXRoIHRoZSBleHBsYW5hdGlvbiBhcm91bmQgbm90Cj4+Pj4+Pj4g
ZGlyZWN0bHkgZW1iZWRkaW5nIGtvYmplY3RzIGludG8gdGhlIGRtYV9idWYgYW5kIGRtYV9idWZf
YXR0YWNobWVudAo+Pj4+Pj4+IHN0cnVjdHMsIHRoZW4gd2l0aCBHcmVnJ3Mgci1iIGZyb20gc3lz
ZnMgUG9WLCBJIHRoaW5rIHdlIGNhbiBtZXJnZSBpdC4KPj4+Pj4+PiBQbGVhc2UgbGV0IG1lIGtu
b3cgaWYgeW91IGZlZWwgb3RoZXJ3aXNlIQo+Pj4+Pj4gICBGcm9tIHRoZSB0ZWNobmljYWwgc2lk
ZSBpdCBsb29rcyBjbGVhbiB0byBtZSwgZmVlbCBmcmVlIHRvIGFkZCBteQo+Pj4+Pj4gYWNrZWQt
Ynkgd2hpbGUgcHVzaGluZy4KPj4+Pj4+Cj4+Pj4+PiBCdXQgSSB3b3VsZCBhdCBsZWFzdCB0cnkg
dG8gY29udmluY2UgRGFuaWVsIG9uIHRoZSBkZXNpZ24uIEF0IGxlYXN0IHNvbWUKPj4+Pj4+IG9m
IGhpcyBjb25jZXJucyBzZWVtcyB0byBiZSB2YWxpZCBhbmQga2VlcCBpbiBtaW5kIHRoYXQgd2Ug
bmVlZCB0bwo+Pj4+Pj4gc3VwcG9ydCB0aGlzIGludGVyZmFjZSBmb3JldmVyLgo+Pj4+PiBOYXR1
cmFsbHkuCj4+Pj4+Cj4+Pj4+IFNpbmNlIGhlIGRpZG4ndCBjb21tZW50IG92ZXIgSHJpZHlhJ3Mg
bGFzdCBjbGFyaWZpY2F0aW9uIGFib3V0IHRoZQo+Pj4+PiB0cmFjZXBvaW50cyB0byB0cmFjayB0
b3RhbCBHUFUgbWVtb3J5IGFsbG9jYXRpb25zIGJlaW5nIG9ydGhvZ29uYWwgdG8KPj4+Pj4gdGhp
cyBzZXJpZXMsIEkgYXNzdW1lZCBoZSBhZ3JlZWQgd2l0aCBpdC4KPj4+PiBUaGUgdHJhY2Vwb2lu
dCBiZWluZyBvcnRob2dvbmFsIGRpZG4ndCByZWFsbHkgbG9vayBjb252aW5jaW5nIHRvIG1lLAo+
Pj4+IHNpbmNlIEkgZG8gZXhwZWN0IHdlJ2xsIG5lZWQgdGhhdCBhdCBhIG11Y2ggbW9yZSBnZW5l
cmljIGxldmVsLCBhdAo+Pj4+IGFsbG9jYXRvcnMuIFdoZXRoZXIgdGhhdCdzIGRtYS1idWYgaGVh
cHMgb3IgaW4gZHJtIG9yIHdoZXJldmVyLiBBbmQgd2UKPj4+PiBwcm9iYWJseSBhbHNvIG5lZWQg
dGhhdCB0byBzb21laG93IGFsaWduIHdpdGggY2dyb3VwcyBhY2NvdW50aW5nLgo+Pj4+Cj4+Pj4g
QnV0IEkgZ3Vlc3MgZm9yIHRoaXMgaXQgc2hvdWxkIGJlIGVhc3kgdG8gZXh0ZW5kIGhvd2V2ZXIg
d2Ugc2VlIGZpdCwKPj4+PiBzbyByZXRyb2ZpdHRpbmcgYWxsb2NhdG9yIHNvdXJjZXMgYW5kIGFu
eXRoaW5nIGVsc2Ugd2Ugd2FudC9uZWVkIGZvcgo+Pj4+IHRoZSBvdmVyYWxsIGdwdSBtZW1vcnkg
YWNjb3VudCBzaG91bGRuJ3QgYmUgYSBwcm9ibGVtLiBBbHNvLCBpdCdzCj4+Pj4gZmlyc3QsIHNv
IHRoZSBwcm9vZiBmb3Igc2hvd2luZyBpdCBhbGwgd29ya3MgdG9nZXRoZXIgaXMgbW9yZSBvbiB0
aGUKPj4+PiB0cmFjZXBvaW50cyA6LSkKPj4+Pgo+Pj4+PiBEYW5pZWwsIGRvIHlvdSBzdGlsbCBo
YXZlIG9iamVjdGlvbnMgYXJvdW5kIGFkZGluZyB0aGlzIHBhdGNoIGluPwo+Pj4+IE5lZWRzIGRv
Y3MgKGVzcGVjaWFsbHkgdGhlIHVhcGkgSSB0aGluayB3b3VsZCBiZSB1c2VmdWwgdG8gZG9jdW1l
bnQpLAo+Pj4+IGlndCB0ZXN0cywgdGhhdCBraW5kIG9mIHN0dWZmIHN0aWxsIEkgdGhpbms/IEl0
J3MgbWVhbnQgdG8gYmUgZ2VuZXJpYwo+Pj4+IHVhcGkgYWNyb3NzIGRyaXZlcnMsIGdlbmVyYWxs
eSB3ZSdyZSBhIHBpbGUgc3RyaWN0ZXIgZm9yIHRoYXQgKGFuZCB5ZXMKPj4+PiBkbWEtYnVmIGhl
YXBzIEkgdGhpbmsgZGlkbid0IGRvIGFsbCB0aGF0LCBzbyBtYXliZSB0aGVyZSdzIGFuIGFyZ3Vt
ZW50Cj4+Pj4gZm9yIGRvaW5nIHRoaXMgYSBiaXQgbW9yZSBzbG9wcHkgb3IgYXQgbGVhc3QgInRo
ZSB0ZXN0c3VpdGUgaXMKPj4+PiBzb21ld2hlcmUgZWxzZSIpLgo+Pj4gVGhhbmsgeW91IGZvciB0
YWtpbmcgYW5vdGhlciBsb29rIERhbmllbCEKPj4+Cj4+PiBJIHdpbGwgdHJ5IGFkZGluZyBhbiBJ
R1QgdGVzdCBmb3IgdGhlIHN5c2ZzIGZpbGVzLiBPdGhlciB0aGFuIHRoZQo+Pj4gZG9jdW1lbnRh
dGlvbiBpbgo+Pj4gRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1rZXJuZWwtZG1hYnVm
LWJ1ZmZlcnMoaW5jbHVkZWQgaW4gdGhlCj4+PiBwYXRjaCksIGlzIHRoZXJlIGFub3RoZXIgcGxh
Y2UgeW91IHdvdWxkIGxpa2UgdG8gc2VlIHRoZSBkb2N1bWVudGF0aW9uCj4+PiBjb3BpZWQgdG8/
Cj4+IFNvIGp1c3QgcmVhZCB0aGUgb3RoZXIgdGhyZWFkLCBhbmQgc291bmRzIGxpa2UgQ2hyaXN0
aWFuIEvDtm5pZyBicm91Z2h0IHVwCj4+IGEgc29saWQgY29uY2VybiB3aXRoIGRtYS1idWYgZmRz
IGdlbmVyYWxseSBub3Qgc3RheWluZyBhcm91bmQgZm9yIG11Y2guCj4gVGhhbmsgeW91IGZvciB0
aGUgcmVwbHkgRGFuaWVsISBDb3VsZCB5b3UgcGxlYXNlIGVsYWJvcmF0ZSBvbiB0aGUKPiBjb25u
ZWN0aW9uIHdpdGggdGhlIG90aGVyIHRocmVhZCB5b3UgbWVudGlvbmVkPyBJIGFtIGEgbGl0dGxl
IGNvbmZ1c2VkCj4gc2luY2UgdGhpcyBwYXRjaCBkb2VzIG5vdCBkZWFsIHdpdGggdHJhY2tpbmcg
RE1BLUJVRiBmZHMuCgpJbiBnZW5lcmFsIERNQS1idWYgZmQgYXJlIG1lYW50IHRvIGJlIGEgdGVt
cG9yYXJ5IHRyYW5zcG9ydCB2ZWhpY2xlIHRvIAppbnRlcmNoYW5nZSB0aGUgZGF0YSBiZXR3ZWVu
IHByb2Nlc3Nlcy4KClRoaXMgaGVyZSBzb3VuZHMgbGlrZSBBbmRyb2lkIGlzIHVzaW5nIHRoZW0g
YXMgYSBsb25nIHRlcm0gcmVmZXJlbmNlLiAKVGhhdCBpcyBub3QgbmVjZXNzYXJ5IGEgZ29vZCBp
ZGVhIGFuZCBjYXVzZXMgbXVsdGlwbGUgaXNzdWVzLgoKT24gb2YgdGhvc2UgaXNzdWVzIHlvdSB0
cnkgdG8gYWRkcmVzcyBoZXJlLCBidXQgRGFuaWVsIGlzIHF1ZXN0aW9uIG5vdyAKd2h5IGRvIHlv
dSBoYXZlIHRoaXMgcHJvYmxlbSBpbiB0aGUgZmlyc3QgcGxhY2U/CgpSZWdhcmRzLApDaHJpc3Rp
YW4uCgo+Cj4gUmVnYXJkcywKPiBIcmlkeWEKPgo+PiBTbyBJJ20gbGVhbmluZyBtb3JlIHRvd2Fy
ZHMgInRoaXMgc291bmRzIGxpa2UgaXQncyBnb2luZyB0byBiZSB1c2VmdWwgZm9yCj4+IEFuZHJv
aWQgb25seSwgbm90aGluZyBlbHNlIiBjb25jZXJuLgo+PiAtRGFuaWVsCj4+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
