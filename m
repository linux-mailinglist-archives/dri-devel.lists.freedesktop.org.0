Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2664C314A2C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 09:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209CF89C54;
	Tue,  9 Feb 2021 07:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAA589C1C;
 Tue,  9 Feb 2021 07:58:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=np5NO44SnDWkmUiCHYWpwshCJuuvRMOKBdUqxY2XSABn21z8JOH7EyrUhwZcb8aHuJcVEYFhznR47Y8HK5xcXyHqtT/nQ3EhPGBSPzQ8bVyTPLOLviA4FNSi/lOIni8iHCG60A1731/Uzui+tfeUioQ845ZzMTJDtrJTrCW2f18/U4z2vWX0k7McW6i/2Pp/xqUU53BzXTrxRJn3NOD7mAE340EJrSWYW/+7J1mNKgt4ydTUPacsQ36kGfsp0ZyDVhg2ug+sRU5B3R91DK7+z9bdu1GyW1VoKIn7Tz1aDoq4mhthtOTysXKyo0mBXnlk3OMB+nEdQqJ/0Img8mmotg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xavj7Dekqa2fts8WYoFKhJljdZ2VX+CAuArLfz1qy7U=;
 b=Bco02OVJmxdaBO/fq7QeK5T+yxecxBXcdgx85e5hBmIjdTe5RRsB/VT9Kjna9NKeYfavOUOlANoJ9YWHF05+GPptbH0KSM3BaMXIzK7Oqk1sHsDgXq5pi8hkvdslPnlqSm97pYR7LeWVK1sgoL7q2mWIJRhA1RM0c15s47906qN8sg19OIWDKcxrJ6jBcqyHiRi9FFxbiS3yby0RMUBwiHx8MyoMHtFHkhSWseFv6tvfRAaD3G0F3JfdSJfa2nSRlvFHSOpsq29fS5fUvLv9EnQyiR/fEl92hEyrW1aSo/iosx4R8X38lAdamhDF62aC6SNi/rT0UADYqXEKiADfGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xavj7Dekqa2fts8WYoFKhJljdZ2VX+CAuArLfz1qy7U=;
 b=TVwHd/iJrIvD5SJRLya3Z1xI4zP2Wsb6BvgWGjL46ArDL1ynGGRs9EZ6Wo45clKSB3cVinC/woJ5IwBv50JK1k27PWGu0cmQe6k53MQ4qFqbvJq+l5MxdaZ2YWcNhSBZGixD3ATcBpEEXJ9aZ6iFoNmKi/6HmIAkhOqmaoc52ME=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4897.namprd12.prod.outlook.com (2603:10b6:208:17e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Tue, 9 Feb
 2021 07:58:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 07:58:16 +0000
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
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
 <f8b3417f-a697-c8c7-b131-5c8823f969d7@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <55862d1f-42da-4a9c-0720-e6abf72615f5@amd.com>
Date: Tue, 9 Feb 2021 08:58:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <f8b3417f-a697-c8c7-b131-5c8823f969d7@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:444c:9a67:948b:2493]
X-ClientProxiedBy: AM0PR01CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:444c:9a67:948b:2493]
 (2a02:908:1252:fb60:444c:9a67:948b:2493) by
 AM0PR01CA0089.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend
 Transport; Tue, 9 Feb 2021 07:58:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3c1269a1-50f8-435b-cec6-08d8ccd074eb
X-MS-TrafficTypeDiagnostic: BL0PR12MB4897:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4897E3CA10E27C583951F865838E9@BL0PR12MB4897.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SDZgIR0VqMP/YFKJ6UGqs8m04m1jaa2JlLWptPZj8ox45Tmx9LAJf/ITCbuTkwxa7U3YARBbKQYJs1GIJKQ0ZOwGOnDDJp1D33+Lz0kf0n3x+Ep2WXY+o7XSsuW0dAndGRAzgTJGycYhGqT/WbuM6M8NEWRIHNcsWtttLZun4/UfBO7gnAKTdW4h1sjQOFumQYYNIKIs6Ez3HpdJQfxOjmJAN7ixIym6BiZmjk5x8Iv02VOXDvNOWkuac5IIcmiasQRt5MGFzA56lyaX2LVp40o4ftloOQ3zHl3TDhJgi7gOwLvZWmsBad41/J1gX08Mx+Gg7Jfwzi7foaBVjutN1jvQ1xhM1ZCLogD7I8yWtHbWOuZupVcM6xLqiviX/Pm/UWtpuETUjv64Rd4qMOJTs9d2sSkC+FiTuQYrmP7HZ0LjTTPmi40B2Ct3AhrBFMEUMRl8MrAhf/tQahHHwEJLcS6NInsncwpzVAqozyG/DFBDAchydAPAs7CMfM2NSN88wb/6FEvceP6EXFe3bQDBvcG2gHPBYg9PDgAN5QH98NzlQDIfpOzXSV/qERIUiJaUxcDYCu7SLmJpue31/6wkYcpChiK+1JHzc26YX5rJSFVL/kinpmrm7lzUC3eNxRtXVk5UK+zYm1Lr9OkP7D7PPyc7Nqr5En7+BaG/GgwKDlo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(966005)(66574015)(16526019)(5660300002)(186003)(8936002)(83380400001)(6486002)(66476007)(66556008)(4326008)(53546011)(66946007)(8676002)(86362001)(6666004)(478600001)(2616005)(316002)(2906002)(54906003)(110136005)(31686004)(31696002)(45080400002)(36756003)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VTJ5enhRL2Vad2UzVHMrek9aWGV4cGNIWnZyT3F5alBYYXZNVDg5MDJXaFFR?=
 =?utf-8?B?YlVYNmt5WGxTMnNRMW92TS84Z05RSU9pN3B4RjJnNVFCQXhNRWlaM21jVzd4?=
 =?utf-8?B?cDZCS2JBWmszd3RpeEd6NnBqV3Z2UzEzTEkvNVcvYi9EL05tR3lGV3dpT3Iy?=
 =?utf-8?B?V0lVbUh4dUpZOEZYVjlMcGVFSXJoRFk4TFNnYm9BWGxUUkFOZHZETGUyRkNt?=
 =?utf-8?B?M3IwSkFlRGdINEtab3JZTlJsZ2dML3c3T0lyWUsvY1VTeldpZ0FPN2daY2pU?=
 =?utf-8?B?UXhLS2NoWUZiNzhkVTJKY3JoS0V2S0RiN3hqMjZuUmlxMXlwbktiNEtIZzFD?=
 =?utf-8?B?bWE3UVpjT2VUbmpyWnFVSXZYc1QrNCtOa29oVGVPUWNYbTdrbWxETGlnR2J0?=
 =?utf-8?B?VmxiekJ5L2w1U1MyTlZOS0Z2NVlEdFMwbUNHaitkTCs2WmJFKyt4VFZQZmNB?=
 =?utf-8?B?VFJEOGhobmtwQkdjSS9wcnVtU29ZMnV2Y0pZUzB1aVJKRzVyWDhHL2JCRVB6?=
 =?utf-8?B?Z2NVSlRmbEJWWVhVVTRFdG9FSWtIUG5yUENyek9lc3cyZytNd2ducVVuWS9q?=
 =?utf-8?B?UjlXUFF5NmVINmEwbTBtOEVSS0RxVG5qd29zTER0dUpnWVpVM0dLa3pZdzdM?=
 =?utf-8?B?Z2pJZUJGT1lGRlJuT1JGTWRyN3ZyMVhJZC9jZ1hObER5T2RDZ282cG5BaEdG?=
 =?utf-8?B?b0xwemluMjlneWlyajMrRUlidkhSWDNoSWNURXcwRmxodWZxUmNDaXd5bjBI?=
 =?utf-8?B?Wml5Q1hwMHZScWkzalJENGdNRUIxZE9IdUVVTGdYb0pFaXV3ZUpzSGNlTG5U?=
 =?utf-8?B?SkJDNUZadjB3Q0RuMVNnbG43YmxuZ0NaY2dycDBwZkx6TUZCUmJ6U293K2RW?=
 =?utf-8?B?UlFNVjhhSE0zZkl5eDAxOEhOa3hHNW91MUw2N2NWcTFJV1hCQmZidGdnZGlx?=
 =?utf-8?B?VEZ1MFB2M1RKSUQzdlp3Y3hOaXpoZlhtbHoxcW5mTnpFZlFuczlQd3dXUW1G?=
 =?utf-8?B?cDZJWmYzWDhzOTRxTkoxQndUNVVSaXVNdGZpRlNFM0xzUFNhemkvdWxVeEM2?=
 =?utf-8?B?OXQxTVBhdFBrdFZwd2JKamhlbTBhN3dQOWE5MnltU2RTMUJOeXRkMGgxUlZD?=
 =?utf-8?B?OXR6OUxxcjliSWF3UGlCOEtZVXZHVGtqU0hTU2IrTWl1S0Ziem1oYWp4RTBO?=
 =?utf-8?B?QXlkYUZibGdiTm5OcG5nNmJTd1pNcVcwT1dxWmpVc0tTQ0ZoSDcybzZHZExI?=
 =?utf-8?B?dWEzZGltUlFwSEw5VUhZMFRGekdtL0VCWmF4UHc5bFMxbXNnVi92czR0RUVX?=
 =?utf-8?B?U05nNXJ4TmtQMnRZWkdzMXRIRDE4Y0huZnR5SmFNOURCZDZxSVg0T3lSQTQ3?=
 =?utf-8?B?cSs3N1hHaUhGdlZ4TXNhUHk1dDE1NHpLdFNnWFNmeDBLL1VUYW5td2JlWHE2?=
 =?utf-8?B?NFJvbUFKeFBxY1pVcmJHekFyNnhWMUc5eVh4WlJJSk5BMFJTb3d4MTJVTTho?=
 =?utf-8?B?ZFRQWmprSzZtT3FPWmVCR0NieGt1ZktsZnp4UnJ4dGhMdEc4aXdMc2tGUnpk?=
 =?utf-8?B?Qk1FR0hqVWdGZXBNOXI1TWpxRU9NUG41d1pYQjFyZlNxbERSb0QrNXNpQVF3?=
 =?utf-8?B?WGVhS3VZMExRYzRKcWxNVnlHaVM3TVBBRWd5ZUptRkxXc1VMb0c2TTc3OHVz?=
 =?utf-8?B?c2pOWGZBOEpkQjlLVndnU3czWHRwcHlpVXIrOUZ6Q2w0UTN0Ry9rdWwyOHdP?=
 =?utf-8?B?MlZsZXNzY3F0S0xhSmxjZjJlV3ZEZXdEdGlSSlFhMmxubS9jTUFLYmdPd1Z3?=
 =?utf-8?B?ejdhamFXTHI2SlpTZlVOUFlNTDJkbUZqUG1pNTViR3JtMFNYK3ErR09KMEVL?=
 =?utf-8?Q?N41mOxoX5G3lI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1269a1-50f8-435b-cec6-08d8ccd074eb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 07:58:16.2478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vG19mKGaai3BJ9CRA4yBnPUqTcyJiWcBL2cSJUcZgZ0bQf179TDC8ZFIVlJHBzv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4897
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

CkFtIDA4LjAyLjIxIHVtIDIzOjE1IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4KPiBPbiAy
LzgvMjEgMTE6MjMgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+IE9uIE1vbiwgRmViIDgsIDIw
MjEgYXQgMzowMCBQTSBDaHJpc3RpYW4gS8O2bmlnIAo+PiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPiB3cm90ZToKPj4+IEFtIDA4LjAyLjIxIHVtIDExOjExIHNjaHJpZWIgRGFuaWVsIFZldHRl
cjoKPj4+PiBPbiBNb24sIEZlYiAwOCwgMjAyMSBhdCAxMTowMzoxNUFNICswMTAwLCBDaHJpc3Rp
YW4gS8O2bmlnIHdyb3RlOgo+Pj4+PiBBbSAwOC4wMi4yMSB1bSAxMDo0OCBzY2hyaWViIERhbmll
bCBWZXR0ZXI6Cj4+Pj4+PiBPbiBNb24sIEZlYiAwOCwgMjAyMSBhdCAxMDozNzoxOUFNICswMTAw
LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+IEFtIDA3LjAyLjIxIHVtIDIyOjUwIHNj
aHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+Pj4+Pj4gW1NOSVBdCj4+Pj4+Pj4+PiBDbGFyaWZpY2F0
aW9uIC0gYXMgZmFyIGFzIEkga25vdyB0aGVyZSBhcmUgbm8gcGFnZSBmYXVsdCAKPj4+Pj4+Pj4+
IGhhbmRsZXJzIGZvciBrZXJuZWwKPj4+Pj4+Pj4+IG1hcHBpbmdzLiBBbmQgd2UgYXJlIHRhbGtp
bmcgYWJvdXQga2VybmVsIG1hcHBpbmdzIGhlcmUsIHJpZ2h0IAo+Pj4+Pj4+Pj4gP8KgIElmIHRo
ZXJlIHdlcmUKPj4+Pj4+Pj4+IEkgY291bGQgc29sdmUgYWxsIHRob3NlIGlzc3VlcyB0aGUgc2Ft
ZSBhcyBJIGRvIGZvciB1c2VyIAo+Pj4+Pj4+Pj4gbWFwcGluZ3MsIGJ5Cj4+Pj4+Pj4+PiBpbnZh
bGlkYXRpbmcgYWxsIGV4aXN0aW5nIG1hcHBpbmdzIGluIHRoZSBrZXJuZWwgKGJvdGgga21hcHMg
Cj4+Pj4+Pj4+PiBhbmQgaW9yZWFtcHMpYW5kCj4+Pj4+Pj4+PiBpbnNlcnQgZHVtbXkgemVybyBv
ciB+MCBmaWxsZWQgcGFnZSBpbnN0ZWFkLgo+Pj4+Pj4+Pj4gQWxzbywgSSBhc3N1bWUgZm9yY2Vm
dWxseSByZW1hcHBpbmcgdGhlIElPIEJBUiB0byB+MCBmaWxsZWQgCj4+Pj4+Pj4+PiBwYWdlIHdv
dWxkIGludm9sdmUKPj4+Pj4+Pj4+IGlvcmVtYXAgQVBJIGFuZCBpdCdzIG5vdCBzb21ldGhpbmcg
dGhhdCBJIHRoaW5rIGNhbiBiZSBlYXNpbHkgCj4+Pj4+Pj4+PiBkb25lIGFjY29yZGluZyB0bwo+
Pj4+Pj4+Pj4gYW0gYW5zd2VyIGkgZ290IHRvIGEgcmVsYXRlZCB0b3BpYyBhIGZldyB3ZWVrcyBh
Z28KPj4+Pj4+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwcyUzQSUyRiUyRnd3dy5zcGluaWNzLm5ldCUyRmxpc3RzJTJGbGludXgtcGNp
JTJGbXNnMTAzMzk2Lmh0bWwmYW1wO2RhdGE9MDQlN0MwMSU3Q0FuZHJleS5Hcm9kem92c2t5JTQw
YW1kLmNvbSU3QzlkMWJkZjRjZWU1MDRjZDcxYjQ5MDhkOGNjNGRmMzEwJTdDM2RkODk2MWZlNDg4
NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQ4Mzk4MjQ1NDYwODI0OSU3Q1Vua25v
d24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pC
VGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1BbnclMkJPd0olMkI1
dHZqVzN0bWtWTmR6MTMlMkJaMTh2ZHBmT0xXcXNVWkw3RDJJJTNEJmFtcDtyZXNlcnZlZD0wIAo+
Pj4+Pj4+Pj4gKHRoYXQgd2FzIHRoZSBvbmx5IHJlcGx5Cj4+Pj4+Pj4+PiBpIGdvdCkKPj4+Pj4+
Pj4gbW1pb3RyYWNlIGNhbiwgYnV0IG9ubHkgZm9yIGRlYnVnLCBhbmQgb25seSBvbiB4ODYgcGxh
dGZvcm1zOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZ3d3cua2VybmVsLm9yZyUyRmRvYyUy
Rmh0bWwlMkZsYXRlc3QlMkZ0cmFjZSUyRm1taW90cmFjZS5odG1sJmFtcDtkYXRhPTA0JTdDMDEl
N0NBbmRyZXkuR3JvZHpvdnNreSU0MGFtZC5jb20lN0M5ZDFiZGY0Y2VlNTA0Y2Q3MWI0OTA4ZDhj
YzRkZjMxMCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0
ODM5ODI0NTQ2MDgyNDklN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01E
QWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZh
bXA7c2RhdGE9V2E3QkZOeVNWUUpMeUQ2V1k0cFpIVFAxUWZlWndEN0Y1eWRCclh1eHBwUSUzRCZh
bXA7cmVzZXJ2ZWQ9MCAKPj4+Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gU2hvdWxkIGJlIGZlYXNp
YmxlIChidXQgbWF5YmUgbm90IHdvcnRoIHRoZSBlZmZvcnQpIHRvIGV4dGVuZCAKPj4+Pj4+Pj4g
dGhpcyB0bwo+Pj4+Pj4+PiBzdXBwb3J0IGZha2UgdW5wbHVnLgo+Pj4+Pj4+IE1obSwgaW50ZXJl
c3RpbmcgaWRlYSB5b3UgZ3V5cyBicm91Z2h0IHVwIGhlcmUuCj4+Pj4+Pj4KPj4+Pj4+PiBXZSBk
b24ndCBuZWVkIGEgcGFnZSBmYXVsdCBmb3IgdGhpcyB0byB3b3JrLCBhbGwgd2UgbmVlZCB0byBk
byAKPj4+Pj4+PiBpcyB0byBpbnNlcnQKPj4+Pj4+PiBkdW1teSBQVEVzIGludG8gdGhlIGtlcm5l
bHMgcGFnZSB0YWJsZSBhdCB0aGUgcGxhY2Ugd2hlcmUgCj4+Pj4+Pj4gcHJldmlvdXNseSB0aGUK
Pj4+Pj4+PiBNTUlPIG1hcHBpbmcgaGFzIGJlZW4uCj4+Pj4+PiBTaW1wbHkgcHRlIHRyaWNrIGlz
bid0IGVub3VnaCwgYmVjYXVzZSB3ZSBuZWVkOgo+Pj4+Pj4gLSBkcm9wIGFsbCB3cml0ZXMgc2ls
ZW50bHkKPj4+Pj4+IC0gYWxsIHJlYWRzIHJldHVybiAweGZmCj4+Pj4+Pgo+Pj4+Pj4gcHRlcyBj
YW4ndCBkbyB0aGF0IHRoZW1zZWx2ZXMsIHdlIG1pbmltYWxseSBuZWVkIHdyaXRlIHByb3RlY3Rp
b24gCj4+Pj4+PiBhbmQgdGhlbgo+Pj4+Pj4gc2lsZW50bHkgcHJvY2VlZCBvbiBlYWNoIHdyaXRl
IGZhdWx0IHdpdGhvdXQgcmVzdGFydGluZyB0aGUgCj4+Pj4+PiBpbnN0cnVjdGlvbi4KPj4+Pj4+
IEJldHRlciB3b3VsZCBiZSB0byBvbmx5IGNhdGNoIHJlYWRzLCBidXQgeDg2IGRvZXNuJ3QgZG8g
Cj4+Pj4+PiB3cml0ZS1vbmx5IHB0ZQo+Pj4+Pj4gcGVybWlzc2lvbnMgYWZhaWsuCj4+Pj4+IFlv
dSBhcmUgbm90IHRoaW5raW5nIGZhciBlbm91Z2ggOikKPj4+Pj4KPj4+Pj4gVGhlIGR1bW15IFBU
RSBpcyBwb2ludCB0byBhIGR1bW15IE1NSU8gcGFnZSB3aGljaCBpcyBqdXN0IG5ldmVyIHVzZWQu
Cj4+Pj4+Cj4+Pj4+IFRoYXQgaGFzdCB0aGUgZXhhY3Qgc2FtZSBwcm9wZXJ0aWVzIHRoYW4gb3Vy
IHJlbW92ZWQgTU1JTyBzcGFjZSAKPj4+Pj4ganVzdCBkb2Vzbid0Cj4+Pj4+IGdvZXMgYmFuYW5h
cyB3aGVuIGEgbmV3IGRldmljZSBpcyBNTUlPIG1hcHBlZCBpbnRvIHRoYXQgYW5kIG91ciAKPj4+
Pj4gZHJpdmVyIHN0aWxsCj4+Pj4+IHRyaWVzIHRvIHdyaXRlIHRoZXJlLgo+Pj4+IEhtLCBidXQg
d2hlcmUgZG8gd2UgZ2V0IHN1Y2ggYSAiZ3VhcmFudGVlZCBuZXZlciB1c2VkIiBtbWlvIHBhZ2Ug
ZnJvbT8KPj4+IFdlbGwgd2UgaGF2ZSB0b25zIG9mIHVudXNlZCBJTyBzcGFjZSBvbiA2NGJpdCBz
eXN0ZW1zIHRoZXNlIGRheXMuCj4+Pgo+Pj4gRG9lc24ndCByZWFsbHkgbmVlZHMgdG8gYmUgUENJ
ZSBhZGRyZXNzIHNwYWNlLCBkb2Vzbid0IGl0Pwo+PiBUaGF0IHNvdW5kcyB2ZXJ5IHRydXN0aW5n
IHRvIG1vZGVybiBzeXN0ZW1zIG5vdCBkZWNvZGluZyByYW5kb20KPj4gcmFuZ2VzLiBFLmcuIHRo
ZSBwY2kgY29kZSBzdG9wcGVkIGV4dGVuZGluZyB0aGUgaG9zdCBicmlkZ2Ugd2luZG93cyBvbgo+
PiBpdHMgb3duLCBlbnRpcmVseSByZWx5aW5nIG9uIHRoZSBhY3BpIHByb3ZpZGVkIHJhbmdlcywg
dG8gYXZvaWQKPj4gc3RvbXBpbmcgb24gc3R1ZmYgdGhhdCdzIHRoZSBidXQgbm90IGxpc3RlZCBh
bnl3aGVyZS4KPj4KPj4gSSBndWVzcyBpZiB3ZSBoYXZlIGEgcmFuZ2UgYmVoaW5kIGEgcGNpIGJy
aWRnZSwgd2hpY2ggaXNuJ3QgdXNlZCBieQo+PiBhbnkgZGV2aWNlLCBidXQgZGVjb2RlZCBieSB0
aGUgYnJpZGdlLCB0aGVuIHRoYXQgc2hvdWxkIGJlIHNhZmUKPj4gZW5vdWdoLiBNYXliZSBjb3Vs
ZCBldmVuIGhhdmUgYW4gb3B0aW9uIGluIHVwc3RyZWFtIHRvIGRvIHRoYXQgb24KPj4gdW5wbHVn
LCBpZiBhIGNlcnRhaW4gZmxhZyBpcyBzZXQsIG9yIGEgY21kbGluZSBvcHRpb24uCj4+IC1EYW5p
ZWwKPgo+Cj4gUXVlc3Rpb24gLSBXaHkgY2FuJ3Qgd2UganVzdCBzZXQgdGhvc2UgUFRFcyB0byBw
b2ludCB0byBzeXN0ZW0gbWVtb3J5IAo+IChhbm90aGVyIFJPIGR1bW15IHBhZ2UpCj4gZmlsbGVk
IHdpdGggMXMgPwoKClRoZW4gd3JpdGVzIGFyZSBub3QgZGlzY2FyZGVkLiBFLmcuIHRoZSAxcyB3
b3VsZCBjaGFuZ2UgdG8gc29tZXRoaW5nIGVsc2UuCgpDaHJpc3RpYW4uCgoKPgo+IEFuZHJleQo+
Cj4KPj4KPj4+IENocmlzdGlhbi4KPj4+Cj4+Pj4gSXQncyBhIG5pZnR5IGlkZWEgaW5kZWVkIG90
aGVyd2lzZSAuLi4KPj4+PiAtRGFuaWVsCj4+Pj4KPj4+Pj4gUmVnYXJkcywKPj4+Pj4gQ2hyaXN0
aWFuLgo+Pj4+Pgo+Pj4+Pgo+Pj4+Pj4+Pj4+IEJ1dCB1Z2ggLi4uCj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+PiBPdG9oIHZhbGlkYXRpbmcgYW4gZW50aXJlIGRyaXZlciBsaWtlIGFtZGdwdSB3aXRob3V0
IHN1Y2ggYSAKPj4+Pj4+Pj4+PiB0cmljawo+Pj4+Pj4+Pj4+IGFnYWluc3QgMHhmZiByZWFkcyBp
cyBwcmFjdGljYWxseSBpbXBvc3NpYmxlLiBTbyBtYXliZSB5b3UgCj4+Pj4+Pj4+Pj4gbmVlZCB0
byBhZGQKPj4+Pj4+Pj4+PiB0aGlzIGFzIG9uZSBvZiB0aGUgdGFza3MgaGVyZT8KPj4+Pj4+Pj4+
IE9yIEkgY291bGQganVzdCBmb3IgdmFsaWRhdGlvbiBwdXJwb3NlcyByZXR1cm4gfjAgZnJvbSBh
bGwgcmVnIAo+Pj4+Pj4+Pj4gcmVhZHMgaW4gdGhlIGNvZGUKPj4+Pj4+Pj4+IGFuZCBpZ25vcmUg
d3JpdGVzIGlmIGRybV9kZXZfdW5wbHVnZ2VkLCB0aGlzIGNvdWxkIGFscmVhZHkgCj4+Pj4+Pj4+
PiBlYXNpbHkgdmFsaWRhdGUgYSBiaWcKPj4+Pj4+Pj4+IHBvcnRpb24gb2YgdGhlIGNvZGUgZmxv
dyB1bmRlciBzdWNoIHNjZW5hcmlvLgo+Pj4+Pj4+PiBIbSB5ZWFoIGlmIHlvdXIgcmVhbGx5IHdy
YXAgdGhlbSBhbGwsIHRoYXQgc2hvdWxkIHdvcmsgdG9vLiBTaW5jZQo+Pj4+Pj4+PiBpb21tYXBw
aW5ncyBoYXZlIF9faW9tZW0gcG9pbnRlciB0eXBlLCBhcyBsb25nIGFzIGFtZGdwdSBpcyBzcGFy
c2UKPj4+Pj4+Pj4gd2FybmluZyBmcmVlLCBzaG91bGQgYmUgZG9hYmxlIHRvIGd1YXJhbnRlZSB0
aGlzLgo+Pj4+Pj4+IFByb2JsZW0gaXMgdGhhdCB+MCBpcyBub3QgYWx3YXlzIGEgdmFsaWQgcmVn
aXN0ZXIgdmFsdWUuCj4+Pj4+Pj4KPj4+Pj4+PiBZb3Ugd291bGQgbmVlZCB0byBhdWRpdCBldmVy
eSByZWdpc3RlciByZWFkIHRoYXQgaXQgZG9lc24ndCB1c2UgCj4+Pj4+Pj4gdGhlIHJldHVybmVk
Cj4+Pj4+Pj4gdmFsdWUgYmxpbmRseSBhcyBpbmRleCBvciBzaW1pbGFyLiBUaGF0IGlzIHF1aXRl
IGEgYml0IG9mIHdvcmsuCj4+Pj4+PiBZZWFoIHRoYXQncyB0aGUgZW50aXJlIGNydXggaGVyZSA6
LS8KPj4+Pj4+IC1EYW5pZWwKPj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
