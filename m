Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A663F312788
	for <lists+dri-devel@lfdr.de>; Sun,  7 Feb 2021 22:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AC26E18F;
	Sun,  7 Feb 2021 21:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196E36E044;
 Sun,  7 Feb 2021 21:28:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6UwFCU2qVhFKOdWkLUUBHk3lekIwV/a45Eb5vgls0RUN5Tt6B4m/S3mSizqsTur82cDWu5kVBBbG3zQWgDbU0Sc5V8ln99uH/aXGL6iE1dB09j9c3quRR1dkpz7a5ptysM/1d/+SmnsEcmSunUJvPjVfbMsdyZxWkH0vA/VYxkeLqcInd1UgE8jiwCW/rzX0q5Kz53RFxG4nd5Npk83+jibEmqkOXklcQ9x3PuaHEASrhoy9IMLiSXdQLfU2L4Yxb7XuWfZmDhi5IpSB8aqUdpLXWX19ao93cj+DZRg6ZrTO1vCQMCr13jK555H9/juDZqmy6xrPMPNfy+S6BKZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tugN4ePelGrGhfSal3ESlv509WjeTmsLN+3ClJL73VE=;
 b=aMET7k0ldM9BlM+sPLbmGR7cqjgnYe9++suOoDOHv9dlVg6Gsffp8ZmIINZUy+IRt7m5Todr9iox+Qmpi7Ig1qofUgomA+G8bWDJc3Iee5t643FHhVynRQIL/1Z8zlWThwUQ2LPYvf0HHjJcZhcSe4pUX9PiqUClCIpBCk/qcINI2oNUg8Cim99dKmzSa+lA/xWwJZjiV8kc5M8VY9hIe5+ZH1Zy4FTeSobg/aNvYweQq3HfC5//6/EYFNYnWy7SFMz9eaIqiZckK4gVsTPkGVnYyO3PdO/hhZDj8+8RjXFDzqC3skXgj6F1yoCiCy9pVBJL/0ZUNQVGLfHH/a4LzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tugN4ePelGrGhfSal3ESlv509WjeTmsLN+3ClJL73VE=;
 b=NgpYWjdB22bPaWJKfGXs960cpEeccoZnvF5SsAvf4rRiKpdqKxh2Lo5Y+YsMBW1b3HPN22vQOGLc1wEvCVFYv7t/UTSPNxWX9qYJDZ5LCgxgRy5idTh9SL4a4YellwXJIHnx9Pc02l9cLzVwR18opHjQS8kyE+XS6+4HrF3kWG4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2478.namprd12.prod.outlook.com (2603:10b6:802:23::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Sun, 7 Feb
 2021 21:28:21 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3825.030; Sun, 7 Feb 2021
 21:28:21 +0000
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-12-git-send-email-andrey.grodzovsky@amd.com>
 <35ecd67f-620f-df50-3e03-d24dc12452d6@gmail.com>
 <8925db97-bf81-7e5e-527d-f654713b400d@amd.com>
 <CAKMK7uHCzBpaC2YypKeQwbJiT0JG2Hq7V0BC5yC88f9nqgxUiw@mail.gmail.com>
 <8ed4a153-d503-e704-0a0d-3422877e50fa@amd.com>
 <91b8ea73-aa69-1478-2e7c-63ab1cb250ae@gmail.com>
 <7834dbdf-27ad-f21d-b58b-2772a598ea8a@amd.com>
 <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
 <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
 <0b502043-5a66-dcd5-53f9-5c190f22dc46@gmail.com>
 <78e4705d-c55f-6c68-d0f9-b1939b636121@amd.com>
 <CAKMK7uEm=N4kQYyzMt=nUefu2BdyKNcWikFiSJih7CthJMd2Aw@mail.gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <8fbeee95-b365-7f68-1e0b-1d42eb0dea70@amd.com>
Date: Sun, 7 Feb 2021 16:28:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uEm=N4kQYyzMt=nUefu2BdyKNcWikFiSJih7CthJMd2Aw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:3561:3f9a:2ce2:2c54]
X-ClientProxiedBy: YTBPR01CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::41) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:3561:3f9a:2ce2:2c54]
 (2607:fea8:3edf:49b0:3561:3f9a:2ce2:2c54) by
 YTBPR01CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Sun, 7 Feb 2021 21:28:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fa15dc29-d4ad-4c26-40fc-08d8cbaf4ad2
X-MS-TrafficTypeDiagnostic: SN1PR12MB2478:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB24782CCD1AA291528B69DAEEEAB09@SN1PR12MB2478.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5mHD5DXXhQY/aCGyGjfIiD7QWid5dr7hsq2QSPHcICplNOotV3+rCOiSpJy8V76Q6LZmFEeFRyz0JvAHuYGBjYPGC8DeTau52nHaxvsF1RyO5SgZxhfmRv82gxpJgNioH/r/Xmgw3dKRhl0xdI/A/XpvLxoW1jhDFXb8BUWwvSi3NeVcynj+8xsmEHsolrSwvdEEohu4Fl13aRnAbyiLg8luXOl+bfuLUfpih0z4xOIDpp2LEgBJBR2kI9yoeRn4NhIRyLNADCMEqhDCv1WwLugV4gE0XbWu970VBYpHbtQWxxqf8fQ59Tvd9jhfpT328yR5J61dnJFIsO5FmXR/Lr5sl3d26oPvKQnoxiorR1BHHIInmHtybNDj/iwu3KoLuUedFfQQyS2NMCJ37jTNWwWO8z0YyYBpy8PW1/9U++x0iM5qtQo1Qcsk4LRgEMiBLDWyIb4//XrToNMd5tRIZkQRCRbpOa6ej1N+6+EN3YQLWYwPW6NtjAITHU1kNhyL09FZxh5G7kxPekEfrHzefB3jNlfvPnex7NRrjs1JyAlOsLq6eWzXBtkGXcGgv6oURJUQiCKylH4EKQ+gZ0zPVcqdgtCrHpJ0bwq7SgXQByLGSmsFEdmsM5MHKfhWOiiJbDwDgfcUfSa/kZIs8Kr65NVtsi+OKxEGQSTQyeY9ES51l49EOlkt/wfeOZ5+SmUg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(4326008)(66946007)(186003)(16526019)(52116002)(66574015)(966005)(36756003)(66476007)(31696002)(86362001)(316002)(2616005)(2906002)(54906003)(83380400001)(31686004)(66556008)(8676002)(6916009)(5660300002)(53546011)(8936002)(6486002)(45080400002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mmx2UWFqTW1Jek4zejJCc0xsM0JVbzE2bWpTQ0hNZ1AyUVQrY2wySEVuR3lk?=
 =?utf-8?B?KzBQVkU1MUtUQ0tHWitHWG52bW5yalk0K1AyOGpQaXVFWHppajRoSXVFMHpZ?=
 =?utf-8?B?eDRJcGJpNVE0dmVhd0VJQld1R2dKYmNyWGZBK3FseUlJdGhOeVhremlVNjlY?=
 =?utf-8?B?YlplQnBvald3RXV1dE80M3lCaC8vWjJ0UkVXVlhkM2R0TTdWdE1UNnMwMWJR?=
 =?utf-8?B?dWh5QkhjNzhXRlIvcUdYRHc2Vk40d3JhUXpNYUNYZ2RnbTJZd2dzMEs3Qlow?=
 =?utf-8?B?L3l6RUtmMnpJdkl4RWk3S1RYK2hsU2dQTUx2c2dyS01ZMFl5V0xSVWlBVDU5?=
 =?utf-8?B?WlVDQW91dGFEb0I1ZFFidHFoUXY5MVkrWHdlczdvNGNieG1sNG96bkNpRzB0?=
 =?utf-8?B?MDdUNU1SNVN2L1loeUphZ094SGZsVWFHdWU5dmhIWG9JTm1IT0dMdDN1VUtG?=
 =?utf-8?B?MmowRVJHejFSSWptNklMSlVINlYyV202YWp5RmNmUnI1VFBDSFc3Qk1wZHdW?=
 =?utf-8?B?L1BMRlFLNmJWcHcwem9zVHJXM21FL2VWQWM0dDBNVUpvbWxLVHAyUHZoM055?=
 =?utf-8?B?ZVpCajlFbVNSZ1F3cXRoZW5tV1YrWXFOZE4ydEd4NGZqbTIrd2xZZEtZU2Vz?=
 =?utf-8?B?Z3AyWW5qMFNLbUtoTHZJelRqMDllblpWbDJ1TUtESU54OTNNWWsxWXlrcTFR?=
 =?utf-8?B?VUQ4N3M2a0ZFOEFJOUhsVFFIRThDeU9XNE0zQVFqU3lmQU53a25xNUNWY1pw?=
 =?utf-8?B?WSsxLyt1Y2dJUFpQS3Q3a0U0K3JTVXpRdXJMaVdFaVpqN1JONE9EZUhuNDVl?=
 =?utf-8?B?eUtLa0ovbmJ3aDVON2FUR2NaV0xNdUFBVk5KT21Hcnpud3hFelBOMFR0YzNl?=
 =?utf-8?B?cEJTRitCT1lZMStPdUJDZVJlNkczQTIxOGJiKzF2WlhNZXREOXhqVGp4SGV5?=
 =?utf-8?B?NE9CeVpEazVLcjdTWDNJMkN3ckhWNXVwenFKamt4enNlb3JwV1pGcXVYcGV1?=
 =?utf-8?B?RXBxakdUam40Q2VKTlRTTFlyTEoyTys4OElEdFJ1ZlFUWk5aRXhtSGJScE1G?=
 =?utf-8?B?c3VXbWZCMGkxUSt2dk00N3NaUWdnRUNRajgydG5jS3B1OXpHUndJd2tHSStl?=
 =?utf-8?B?RGVreEJ0aW4vSHFENldNTGVQR1JwSXZpeWYzMFBsQkRLNE8rYXl6b29HdCtV?=
 =?utf-8?B?eUN2UHRmdFJ3VEE2QjExdHA5cWwxdGl0M3huMU5YYmFrVDNJVTdHdFpvRjlS?=
 =?utf-8?B?V3gzTnI0MDI2VUhSNWovekRiQ3ZMcW5LYXBwbndpM05sQ1dtSmxjdndRaU9F?=
 =?utf-8?B?R1hEeWNseW9pcmQ1NERIRGJjdFEzRFpHeWwyckw1dVByaWNUV2hiZFpkeTJs?=
 =?utf-8?B?VHp2bmh1L2x2SE9kRlFHcDVNazNGbWxLbVRBdHEyM0RrZnhKbzkzYUw3Z3U3?=
 =?utf-8?B?M2RLNmNGMzNPQ1FBSE9raWVvMXRXTXhvaDN2azhyWW15V2U3M1lNeWJURHor?=
 =?utf-8?B?RTJyOWM0S3l1Q2V6SlBBUFBrSmRkQWp6ZEttaGpSV1B2OWl6aUExN2NOT2cz?=
 =?utf-8?B?T0VNajNvaDFhMGRyeDBaWWZNNlFETUIrcW9sRzBtYm1XODNRbGZLU0JOdCtj?=
 =?utf-8?B?b2ZZYkxoYXZhK2dra2NvOHU2TFpGbVlXREgwb2l2KytGOHg4YldHdERwN09u?=
 =?utf-8?B?MzJFMWVEdXJFUGZuN0VMQUdQM0I0QlV5MXJoN0p0Wk5XU21mZjBmSEdhTzEx?=
 =?utf-8?B?R1VxUUxNa1l1emJYMVFZV2J6SlJNcHNkTDhsdTVaVks2V2tyemIwSHBlZkFy?=
 =?utf-8?B?cHJZaHBkamd5dFdUSTRqUWFMcWR0UkYyRHVoTTdRRzdyaGFiYkdWR3p5S2dD?=
 =?utf-8?Q?gK8QJqgs9qgmZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa15dc29-d4ad-4c26-40fc-08d8cbaf4ad2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2021 21:28:21.0542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJlxkCzs4MxpFY/3yCrfl3ijlY+IcOZmDSnAIZbXdau2cPWDq2A+m270kP+5XGh3tjIlyykbvZ2vE9hswQ++Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2478
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyLzUvMjEgNToxMCBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBGcmksIEZlYiA1
LCAyMDIxIGF0IDU6MjIgUE0gQW5kcmV5IEdyb2R6b3Zza3kKPiA8QW5kcmV5Lkdyb2R6b3Zza3lA
YW1kLmNvbT4gd3JvdGU6Cj4+Cj4+IERhbmllbCwgcGluZy4gQWxzbywgcGxlYXNlIHJlZmVyIHRv
IHRoZSBvdGhlciB0aHJlYWQgd2l0aCBCam9ybiBmcm9tIHBjaS1kZXYKPj4gb24gdGhlIHNhbWUg
dG9waWMgSSBhZGRlZCB5b3UgdG8uCj4gCj4gU3VtbWFyaXppbmcgbXkgdGFrZSBvdmVyIHRoZXJl
IGZvciBoZXJlIHBsdXMgbWF5YmUgc29tZSBtb3JlCj4gY2xhcmlmaWNhdGlvbi4gVGhlcmUncyB0
d28gcHJvYmxlbXM6Cj4gCj4gLSBZb3UgbXVzdCBndWFyYW50ZWUgdGhhdCBhZnRlciB0aGUgLT5y
ZW1vdmUgY2FsbGJhY2sgb2YgeW91ciBkcml2ZXIKPiBpcyBmaW5pc2hlZCwgdGhlcmUncyBubyBt
b3JlIG1taW8gb3IgYW55IG90aGVyIGh3IGFjY2Vzcy4gQQo+IGNvbWJpbmF0aW9uIG9mIHN0b3Bw
aW5nIHN0dWZmIGFuZCBkcm1fZGV2X2VudGVyL2V4aXQgY2FuIGhlbHAgd2l0aAo+IHRoYXQuIFRo
aXMgcHJldmVudHMgdGhlIHVzZS1hZnRlci1mcmVlIGlzc3VlLgo+IAo+IC0gRm9yIHRoZSBhY3R1
YWwgaG90dW5wbHVnIHRpbWUsIGkuZS4gYW55dGhpbmcgdGhhdCBjYW4gcnVuIHdoaWxlIHlvdXIK
PiBkcml2ZXIgaXMgdXNlZCB1cCB0byB0aGUgcG9pbnQgd2hlcmUgLT5yZW1vdmUgY2FsbGJhY2sg
aGFzIGZpbmlzaGVkCj4gc3RvcHAgaHcgYWNjZXNzIHlvdSBtdXN0IGd1YXJhbnRlZSB0aGF0IGNv
ZGUgZG9lc24ndCBibG93IHVwIHdoZW4gaXQKPiBnZXRzIGJvZ3VzIHJlYWRzIChpbiB0aGUgZm9y
bSBvZiAweGZmIHZhbHVlcykuIGRybV9kZXZfZW50ZXIvZXhpdAo+IGNhbid0IGhlbHAgeW91IHdp
dGggdGhhdC4gUGx1cyB5b3Ugc2hvdWxkIG1ha2Ugc3VyZSB0aGF0IHdlJ3JlIG5vdAo+IHNwZW5k
aW5nIGZvcmV2ZXIgd2FpdGluZyBmb3IgYSBiaWcgcGlsZSBvZiBtbWlvIGFjY2VzcyBhbGwgdG8g
dGltZSBvdXQKPiBiZWNhdXNlIHlvdSBuZXZlciBiYWlsIG91dCAtIHNvbWUgY29hcnNlLWdyYWlu
ZWQgZHJtX2Rldl9lbnRlci9leGl0Cj4gbWlnaHQgaGVscCBoZXJlLgo+IAo+IFBsdXMgZmluYWxs
eSB0aGUgdXNlcnNwYWNlIGFjY2VzcyBwcm9ibGVtOiBZb3UgbXVzdCBndWFyYW50ZWUgdGhhdAo+
IGFmdGVyIC0+cmVtb3ZlIGhhcyBmaW5pc2hlZCB0aGF0IG5vbmUgb2YgdGhlIHVhcGkgb3IgY3Jv
c3MtZHJpdmVyCj4gYWNjZXNzIHBvaW50cyAoZHJpdmVyIGlvY3RsLCBkbWEtYnVmLCBkbWEtZmVu
Y2UsIGFueXRoaW5nIGVsc2UgdGhhdAo+IGhhbmdzIGFyb3VuZCkgY2FuIHJlYWNoIHRoZSBkYXRh
IHN0cnVjdHVyZXMvbWVtb3J5IG1hcHBpbmdzL3doYXRldmVyCj4gd2hpY2ggaGF2ZSBiZWVuIHJl
bGVhc2VkIGFzIHBhcnQgb2YgeW91ciAtPnJlbW92ZSBjYWxsYmFjay4KPiBkcm1fZGV2X2VudGVy
L2V4aXQgaXMgYWdhaW4gdGhlIHRvb2wgb2YgY2hvaWNlIGhlcmUuCj4gCj4gU28geW91IGhhdmUg
dG8gdXNlIGRybV9kZXZfZW50ZXIvZXhpdCBmb3Igc29tZSBvZiB0aGUgcHJvYmxlbXMgd2UgZmFj
ZQo+IG9uIGhvdHVucGx1ZywgYnV0IGl0J3Mgbm90IHRoZSB0b29sIHRoYXQgY2FuIGhhbmRsZSB0
aGUgYWN0dWFsIGh3Cj4gaG90dW5wbHVnIHJhY2UgY29uZGl0aW9ucyBmb3IgeW91Lgo+IAo+IFVu
Zm9ydHVuYXRlbHkgdGhlIGh3IGhvdHVucGx1ZyByYWNlIGNvbmRpdGlvbiBpcyBhbiB1dHRlciBw
YWluIHRvCj4gdGVzdCwgc2luY2UgZXNzZW50aWFsbHkgeW91IG5lZWQgdG8gdmFsaWRhdGUgeW91
ciBkcml2ZXIgYWdhaW5zdAo+IHNwdXJpb3VzIDB4ZmYgcmVhZHMgYXQgYW55IG1vbWVudC4gQW5k
IEkgZG9uJ3QgZXZlbiBoYXZlIGEgY2xldmVyIGlkZWEKPiB0byBzaW11bGF0ZSB0aGlzLCBlLmcu
IGJ5IGZvcmNlZnVsbHkgcmVwbGFjaW5nIHRoZSBpb2JhciBtYXBwaW5nOiBXaGF0Cj4gd2UnZCBu
ZWVkIGlzIGEgbWFwcGluZyB0aGF0IGFsbG93cyByZWFkcyAoc28gd2UgY2FuIGZpbGwgYSBwYWdl
IHdpdGgKPiAweGZmIGFuZCB1c2UgdGhhdCBldmVyeXdoZXJlKSwgYnV0IGluc3RlYWQgb2YgcmVq
ZWN0aW5nIHdyaXRlcywgYWxsb3dzCj4gdGhlbSwgYnV0IGRyb3BzIHRoZW0gKHNvIHRoYXQgdGhl
IDB4ZmYgc3RheXMgaW50YWN0KS4gTWF5YmUgd2UgY291bGQKPiBzaW11bGF0ZSB0aGlzIHdpdGgg
c29tZSBrZXJuZWwgZGVidWcgdHJpY2tzIChraW5kYSBsaWtlIG1taW90cmFjZSkKPiB3aXRoIGEg
cmVhZC1vbmx5IG1hcHBpbmcgYW5kIGRyb3BwaW5nIGV2ZXJ5IHdyaXRlIGV2ZXJ5IHRpbWUgd2Ug
ZmF1bHQuCgpDbGFyaWZpY2F0aW9uIC0gYXMgZmFyIGFzIEkga25vdyB0aGVyZSBhcmUgbm8gcGFn
ZSBmYXVsdCBoYW5kbGVycyBmb3Iga2VybmVsCm1hcHBpbmdzLiBBbmQgd2UgYXJlIHRhbGtpbmcg
YWJvdXQga2VybmVsIG1hcHBpbmdzIGhlcmUsIHJpZ2h0ID8gIElmIHRoZXJlIHdlcmUgCkkgY291
bGQgc29sdmUgYWxsIHRob3NlIGlzc3VlcyB0aGUgc2FtZSBhcyBJIGRvIGZvciB1c2VyIG1hcHBp
bmdzLCBieQppbnZhbGlkYXRpbmcgYWxsIGV4aXN0aW5nIG1hcHBpbmdzIGluIHRoZSBrZXJuZWwg
KGJvdGgga21hcHMgYW5kIGlvcmVhbXBzKWFuZCAKaW5zZXJ0IGR1bW15IHplcm8gb3IgfjAgZmls
bGVkIHBhZ2UgaW5zdGVhZC4KQWxzbywgSSBhc3N1bWUgZm9yY2VmdWxseSByZW1hcHBpbmcgdGhl
IElPIEJBUiB0byB+MCBmaWxsZWQgcGFnZSB3b3VsZCBpbnZvbHZlCmlvcmVtYXAgQVBJIGFuZCBp
dCdzIG5vdCBzb21ldGhpbmcgdGhhdCBJIHRoaW5rIGNhbiBiZSBlYXNpbHkgZG9uZSBhY2NvcmRp
bmcgdG8KYW0gYW5zd2VyIGkgZ290IHRvIGEgcmVsYXRlZCB0b3BpYyBhIGZldyB3ZWVrcyBhZ28g
Cmh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LXBjaS9tc2cxMDMzOTYuaHRtbCAo
dGhhdCB3YXMgdGhlIG9ubHkgcmVwbHkgCmkgZ290KQoKCj4gQnV0IHVnaCAuLi4KPiAKPiBPdG9o
IHZhbGlkYXRpbmcgYW4gZW50aXJlIGRyaXZlciBsaWtlIGFtZGdwdSB3aXRob3V0IHN1Y2ggYSB0
cmljawo+IGFnYWluc3QgMHhmZiByZWFkcyBpcyBwcmFjdGljYWxseSBpbXBvc3NpYmxlLiBTbyBt
YXliZSB5b3UgbmVlZCB0byBhZGQKPiB0aGlzIGFzIG9uZSBvZiB0aGUgdGFza3MgaGVyZT8KCk9y
IEkgY291bGQganVzdCBmb3IgdmFsaWRhdGlvbiBwdXJwb3NlcyByZXR1cm4gfjAgZnJvbSBhbGwg
cmVnIHJlYWRzIGluIHRoZSBjb2RlCmFuZCBpZ25vcmUgd3JpdGVzIGlmIGRybV9kZXZfdW5wbHVn
Z2VkLCB0aGlzIGNvdWxkIGFscmVhZHkgZWFzaWx5IHZhbGlkYXRlIGEgYmlnIApwb3J0aW9uIG9m
IHRoZSBjb2RlIGZsb3cgdW5kZXIgc3VjaCBzY2VuYXJpby4KCkFuZHJleQoKPiAtRGFuaWVsCj4g
Cj4+Cj4+IEFuZHJleQo+Pgo+PiBPbiAxLzI5LzIxIDI6MjUgUE0sIENocmlzdGlhbiBLw7ZuaWcg
d3JvdGU6Cj4+PiBBbSAyOS4wMS4yMSB1bSAxODozNSBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5
Ogo+Pj4+Cj4+Pj4gT24gMS8yOS8yMSAxMDoxNiBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4+Pj4gQW0gMjguMDEuMjEgdW0gMTg6MjMgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+
Pj4+Cj4+Pj4+PiBPbiAxLzE5LzIxIDE6NTkgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
Pj4+Pj4gQW0gMTkuMDEuMjEgdW0gMTk6MjIgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+
Pj4+Pj4KPj4+Pj4+Pj4gT24gMS8xOS8yMSAxOjA1IFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+
Pj4+Pj4+Pj4gW1NOSVBdCj4+Pj4+Pj4+IFNvIHNheSB3cml0aW5nIGluIGEgbG9vcCB0byBzb21l
IGhhcm1sZXNzIHNjcmF0Y2ggcmVnaXN0ZXIgZm9yIG1hbnkgdGltZXMKPj4+Pj4+Pj4gYm90aCBm
b3IgcGx1Z2dlZAo+Pj4+Pj4+PiBhbmQgdW5wbHVnZ2VkIGNhc2UgYW5kIG1lYXN1cmUgdG90YWwg
dGltZSBkZWx0YSA/Cj4+Pj4+Pj4KPj4+Pj4+PiBJIHRoaW5rIHdlIHNob3VsZCBhdCBsZWFzdCBt
ZWFzdXJlIHRoZSBmb2xsb3dpbmc6Cj4+Pj4+Pj4KPj4+Pj4+PiAxLiBXcml0aW5nIFggdGltZXMg
dG8gYSBzY3JhdGNoIHJlZyB3aXRob3V0IHlvdXIgcGF0Y2guCj4+Pj4+Pj4gMi4gV3JpdGluZyBY
IHRpbWVzIHRvIGEgc2NyYXRjaCByZWcgd2l0aCB5b3VyIHBhdGNoLgo+Pj4+Pj4+IDMuIFdyaXRp
bmcgWCB0aW1lcyB0byBhIHNjcmF0Y2ggcmVnIHdpdGggdGhlIGhhcmR3YXJlIHBoeXNpY2FsbHkg
ZGlzY29ubmVjdGVkLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSBzdWdnZXN0IHRvIHJlcGVhdCB0aGF0IG9u
Y2UgZm9yIFBvbGFyaXMgKG9yIG9sZGVyKSBhbmQgb25jZSBmb3IgVmVnYSBvcgo+Pj4+Pj4+IE5h
dmkuCj4+Pj4+Pj4KPj4+Pj4+PiBUaGUgU1JCTSBvbiBQb2xhcmlzIGlzIG1lYW50IHRvIGludHJv
ZHVjZSBzb21lIGRlbGF5IGluIGVhY2ggYWNjZXNzLCBzbyBpdAo+Pj4+Pj4+IG1pZ2h0IHJlYWN0
IGRpZmZlcmVudGx5IHRoZW4gdGhlIG5ld2VyIGhhcmR3YXJlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQ2hy
aXN0aWFuLgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBTZWUgYXR0YWNoZWQgcmVzdWx0cyBhbmQgdGhl
IHRlc3RpbmcgY29kZS4gUmFuIG9uIFBvbGFyaXMgKGdmeDgpIGFuZAo+Pj4+Pj4gVmVnYTEwKGdm
eDkpCj4+Pj4+Pgo+Pj4+Pj4gSW4gc3VtbWFyeSwgb3ZlciAxIG1pbGxpb24gV1dSRUczMiBpbiBs
b29wIHdpdGggYW5kIHdpdGhvdXQgdGhpcyBwYXRjaCB5b3UKPj4+Pj4+IGdldCBhcm91bmQgMTBt
cyBvZiBhY2N1bXVsYXRlZCBvdmVyaGVhZCAoIHNvIDAuMDAwMDEgbWlsbGlzZWNvbmQgcGVuYWx0
eSBmb3IKPj4+Pj4+IGVhY2ggV1dSRUczMikgZm9yIHVzaW5nIGRybV9kZXZfZW50ZXIgY2hlY2sg
d2hlbiB3cml0aW5nIHJlZ2lzdGVycy4KPj4+Pj4+Cj4+Pj4+PiBQLlMgQnVsbGV0IDMgSSBjYW5u
b3QgdGVzdCBhcyBJIG5lZWQgZUdQVSBhbmQgY3VycmVudGx5IEkgZG9uJ3QgaGF2ZSBvbmUuCj4+
Pj4+Cj4+Pj4+IFdlbGwgaWYgSSdtIG5vdCBjb21wbGV0ZWx5IG1pc3Rha2VuIHRoYXQgYXJlIDEw
MG1zIG9mIGFjY3VtdWxhdGVkIG92ZXJoZWFkLgo+Pj4+PiBTbyBhcm91bmQgMTAwbnMgcGVyIHdy
aXRlLiBBbmQgZXZlbiBiaWdnZXIgcHJvYmxlbSBpcyB0aGF0IHRoaXMgaXMgYSB+NjclCj4+Pj4+
IGluY3JlYXNlLgo+Pj4+Cj4+Pj4KPj4+PiBNeSBiYWQsIGFuZCA2NyUgZnJvbSB3aGF0ID8gSG93
IHUgY2FsY3VsYXRlID8KPj4+Cj4+PiBNeSBiYWQsICgzMDg1MDEtMjA5Njg5KS8yMDk2ODk9NDcl
IGluY3JlYXNlLgo+Pj4KPj4+Pj4KPj4+Pj4gSSdtIG5vdCBzdXJlIGhvdyBtYW55IHdyaXRlIHdl
IGRvIGR1cmluZyBub3JtYWwgb3BlcmF0aW9uLCBidXQgdGhhdCBzb3VuZHMKPj4+Pj4gbGlrZSBh
IGJpdCBtdWNoLiBJZGVhcz8KPj4+Pgo+Pj4+IFdlbGwsIHUgc3VnZ2VzdGVkIHRvIG1vdmUgdGhl
IGRybV9kZXZfZW50ZXIgd2F5IHVwIGJ1dCBhcyBpIHNlZSBpdCB0aGUgcHJvYmxlbQo+Pj4+IHdp
dGggdGhpcyBpcyB0aGF0IGl0IGluY3JlYXNlIHRoZSBjaGFuY2Ugb2YgcmFjZSB3aGVyZSB0aGUK
Pj4+PiBkZXZpY2UgaXMgZXh0cmFjdGVkIGFmdGVyIHdlIGNoZWNrIGZvciBkcm1fZGV2X2VudGVy
ICh0aGVyZSBpcyBhbHNvIHN1Y2gKPj4+PiBjaGFuY2UgZXZlbiB3aGVuIGl0J3MgcGxhY2VkIGlu
c2lkZSBXV1JFRyBidXQgaXQncyBsb3dlcikuCj4+Pj4gRWFybGllciBJIHByb3BzZWQgdGhhdCBp
bnN0ZWFkIG9mIGRvaW5nIGFsbCB0aG9zZSBndWFyZHMgc2NhdHRlcmVkIGFsbCBvdmVyCj4+Pj4g
dGhlIGNvZGUgc2ltcGx5IGRlbGF5IHJlbGVhc2Ugb2Ygc3lzdGVtIG1lbW9yeSBwYWdlcyBhbmQg
dW5yZXNlcnZlIG9mCj4+Pj4gTU1JTyByYW5nZXMgdG8gdW50aWwgYWZ0ZXIgdGhlIGRldmljZSBp
dHNlbGYgaXMgZ29uZSBhZnRlciBsYXN0IGRybSBkZXZpY2UKPj4+PiByZWZlcmVuY2UgaXMgZHJv
cHBlZC4gQnV0IERhbmllbCBvcHBvc2VzIGRlbGF5aW5nIE1NSU8gcmFuZ2VzIHVucmVzZXJ2ZSB0
byBhZnRlcgo+Pj4+IFBDSSByZW1vdmUgY29kZSBiZWNhdXNlIGFjY29yZGluZyB0byBoaW0gaXQg
d2lsbCB1cHNldCB0aGUgUENJIHN1YnN5dGVtLgo+Pj4KPj4+IFllYWgsIHRoYXQncyBtb3N0IGxp
a2VseSB0cnVlIGFzIHdlbGwuCj4+Pgo+Pj4gTWF5YmUgRGFuaWVsIGhhcyBhbm90aGVyIGlkZWEg
d2hlbiBoZSdzIGJhY2sgZnJvbSB2YWNhdGlvbi4KPj4+Cj4+PiBDaHJpc3RpYW4uCj4+Pgo+Pj4+
Cj4+Pj4gQW5kcmV5Cj4+Pj4KPj4+Pj4KPj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4gYW1kLWdmeCBtYWlsaW5n
IGxpc3QKPj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+IGh0dHBzOi8vbmFt
MTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxp
c3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1nZngmYW1wO2Rh
dGE9MDQlN0MwMSU3Q0FuZHJleS5Hcm9kem92c2t5JTQwYW1kLmNvbSU3Qzc4MTBkOGQ2ZjAzNDQz
Y2UyZTA0MDhkOGNhMjJlYTk5JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0Mw
JTdDMCU3QzYzNzQ4MTU5ODYxNTU4MTY5MyU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpv
aU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAl
M0QlN0MxMDAwJmFtcDtzZGF0YT16VFY2RlRwTDN0aXRtTVRWRVB4eFZUOGU1bFRLVnNMVml3WnVk
RXNObiUyQnclM0QmYW1wO3Jlc2VydmVkPTAKPj4+Pgo+Pj4KPiAKPiAKPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
