Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 365852CC55A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 19:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87506EA9B;
	Wed,  2 Dec 2020 18:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A0C6EA9A;
 Wed,  2 Dec 2020 18:40:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFAMzXmbpyxIFNKVUDE585VuxIMLANTYn0CRBi4hpZPgXeLP+yMYeuJNrCF7z7TjVv3n1TYnGNW6WK//ggq0qe2gr0EbdffLRH48YQ+f0yOiSvH+7MN16TWyUtWi4ZSSKEjk6mPdqqVuw9UB8s0s8vqa8JsSKeIErhSaeFx++FpihZtKTBiZIKoiJSmeZP9rbrOS/FPLydYI1GpwX0jItd3lsLq73tsRn9WDCoBMO5MXCT5Ou34jHk726CFbNKpjbWxzPL3CWvlAfT3mMPR6wdtrzzS0dqEsyBkM0K7Fevx29BHmN2Pbs9TVUeoX+UQMfv5kQGC47UDi/QxH2InizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xsx+m6ZZ+FOItLLSZkoO348QW5zlrXYpuakxE4bBkzg=;
 b=ivgSlz5ZA2OCXyNXz1JWUmeiB9/JHbJxtv1uuCHrFmsVKB0xmQMcWHPakE6U8CHbIqkl/6ingtKwVR/+qdaRVPYq625V/AZnHAbuEVKUOP/JKleQqU6mgH/yWKnxgoiXPFdxSJb5ESWpnkwdtOI5cVSTAcKl5XiaKpy/0YZb3PqDktDPtPj0Svf20VttiBK+Nam++PWmzUxOZVEONqhRqYMka1fz+Pf4L1K3NwRmJD+2LF+vhGC0Xl47j/QeD4Apx5h/1MNHCRIXiseTHBWej6ef5pkKqfqOqrJA35U1enoFVzk/0sZmVqM8VFmtosMIbSvaRZ1blQg4d9pabrRbtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xsx+m6ZZ+FOItLLSZkoO348QW5zlrXYpuakxE4bBkzg=;
 b=ckbWRSspeJQAz/JKYEfOxcq5PZZOcPMkm2e7EbtpFJy29E/C7tW1dk35PKwZX3KjANq5Bu/jfYzcIOT+tnog607b5SXn/rIFdTtUMu4iYhZ1RfgV3x2+oCQmRHGV4ygwsJmZmU6jLhu7a5C6dCKXfffOKmp+mCZ7WSzjZ0f5jGY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB1145.namprd12.prod.outlook.com (2603:10b6:3:77::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17; Wed, 2 Dec 2020 18:40:46 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 18:40:46 +0000
Subject: Re: [PATCH v2 5/8] drm/amdgpu: Refactor sysfs removal
To: Greg KH <gregkh@linuxfoundation.org>
References: <20200623060532.GB3818201@kroah.com>
 <090c5a35-3088-d6d0-dcaf-5ce5542a4298@amd.com>
 <20200624061153.GA933050@kroah.com>
 <c864c559-71f4-08a5-f692-3f067a9a32f8@amd.com> <X6rU6lKDCyl6RN+V@kroah.com>
 <9db66134-0690-0972-2312-9d9155a0c5d8@amd.com> <X6wEbtSDm69gzFbR@kroah.com>
 <bc6cc476-4f09-1c0f-37b9-522723ecdc85@amd.com> <X8fQQpYDqsgGJUPt@kroah.com>
 <7a35f0d7-6e0c-0ebd-c6ea-6629335b85ff@amd.com> <X8fa3slOicbad0kN@kroah.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <583e22ec-2c6b-b192-37db-69b6db18f579@amd.com>
Date: Wed, 2 Dec 2020 13:40:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <X8fa3slOicbad0kN@kroah.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:9ced:9698:f02b:99c8]
X-ClientProxiedBy: YTBPR01CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::43) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:9ced:9698:f02b:99c8]
 (2607:fea8:3edf:49b0:9ced:9698:f02b:99c8) by
 YTBPR01CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 18:40:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0741de05-b8f1-4244-5265-08d896f1c804
X-MS-TrafficTypeDiagnostic: DM5PR12MB1145:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1145C187AAF1C2E19064DCDCEAF30@DM5PR12MB1145.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FSF7JDDXXNd2Ehd/sdR8Tnr3ar05UCD122EqXKred0LmU5n09OM4vyr/DtexJLAcY3RE6Qc1RIJq5thePnkKToB3VSxU6FxSIoxl7gQbk0aCgk04JYtsM7PhelXO8ZWak+vyDiJ9cIDEsH8DWCLBT3Nh2/P5jLg1vZgwjyp2ISPVgsHuKbvtcVHIWV/KUtiEnYmCR6PKb29aQvr9wbomCsDIdRmuMyrvCpMABJ5zXJ1nc8jg3+6xUSXHEpEzK6EMJJvLPTakxTqXxEmaHRFTK3I94Ygb6HRKBGVKlhHQ405DV9+xHO8z00DKlkr20BCpBX8jaGM02vcQrRcB2qhF28EusqibL83LXZynnbp11H8plCs/nJtPNxsgYgQgjzTzW9d/Lyrpij+qCoCv5wnKp4/hD7ymWVIKyNXUrHSkAAo5/aX/3M8e1I5wOeWnWbal
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(5660300002)(8676002)(8936002)(6666004)(66946007)(66556008)(66476007)(83380400001)(2616005)(31696002)(52116002)(53546011)(45080400002)(316002)(966005)(6916009)(478600001)(36756003)(31686004)(4326008)(86362001)(16526019)(186003)(6486002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SHFIdWJVR1RVUXk5ZnJSVFhWeHpkTjRDNWF5RzVVcVVWckF0ZVVkbEpTQjRQ?=
 =?utf-8?B?ZHVPSjY3UmlvazdoNzN4NE1qZUpVOGlvcXVTOUdEWFZMTHNaWmkxVnBRY0F2?=
 =?utf-8?B?Q0RsaUpPeWZmLzBlZnZTVEJmcm5FdnR0R0tyQk11RVhxWTNnZ0pWOWJxN2hF?=
 =?utf-8?B?eW5sdDBCVDg1ZnJ3Y2duU20rR096a1RpVDdOcW40UVo5dk1FYTdha0xPQkRq?=
 =?utf-8?B?VDdnd3pNbStXMkROSE05VlFBeWJ5TzNSNzR6WXR2eHBnOFFwRW5wNkFvRkhG?=
 =?utf-8?B?R3Y4WWsxMnJjMlc1WC9hZmNGbVo0Sy9tbEVvbGh1M3UzaUhxTkNKYmxnak16?=
 =?utf-8?B?aWRqOXpydml3ZjRZK2UyNHE5QmFDdWQxbEhUYUcvMDlGRkhiRndncWhhWFpi?=
 =?utf-8?B?eDRZMm80SDZ0TTBUeVFlb2lid3pHT0VpTS9Ya3IrL2o4aUltV2pzeStjV3Bw?=
 =?utf-8?B?emVjZS9pNm1vbm9uWWFvYTBNR1dTa0g5Y0REKy9xeFhRYkQ3djhjTzR3Zk9s?=
 =?utf-8?B?SWIrVWoreHNWeHkyUi9FRzgrditiaTNIMVRHQlRjT0NVMXYySE1sRllsN0JW?=
 =?utf-8?B?TzhNR1I2blE1NHZSRElQZlFibFczdlBFaHRyK3EzVVdDRFd0MnAvRHlyZDQy?=
 =?utf-8?B?VXRQbFpHVXowd0Y5K0FueElFY0dDako2UFFTdG1zUkxqV09KMy82dVpDZXp1?=
 =?utf-8?B?Sm02U28zM0VwQ2lOaWhXaHZlN0o3ekJMWUlOalV0aFd4cVNGYnNmOTZDRC94?=
 =?utf-8?B?SHJVQXN4QjJ1V2NmNGhIKzR5NTRJQ09hQWNES2FNVU84SjRsYno4MmNPamhF?=
 =?utf-8?B?blhrVmlSODVLS3pZWjFTVU44eGJ4K3UxejlGMVkxNVFGQUVaL2dnaWdxcUov?=
 =?utf-8?B?SVRsZlF3OXRsRTNpK3hTNXpyckxQQ1lPeXpPd0Izdi81RERvcFBKYU1yWmpw?=
 =?utf-8?B?eXNXTHQwWjRDR2lkd0ZqbllmbmNPRnNYUkRaR0VTaHJpTHZKNFRieGVNN05C?=
 =?utf-8?B?bldHSXFXVTlTLzdwOEYyY01qdExpSEtZeXVDY04xRTBhaXhVbno2ejJJZXBD?=
 =?utf-8?B?Q0s2OXhnbzZ0VVJTSDdxcWNWdzVudTBqTkdudDZiclRPN2JiUy83bkU3V2dQ?=
 =?utf-8?B?QXh6Rk5EcXUxWkZuSithYXZwRGJnLzJDQU9UejhxQ0paRXh4d1E2dHpRSk4z?=
 =?utf-8?B?UmdEU0UwTEhJM2phaFgrbUYrL296WDNiNklQNXM4TE4rWFcrbHlPaEY4aGJi?=
 =?utf-8?B?SUxXUmczSk9zMjRVcnNnRlpWdUJrS2hsTVNPZCtybi9YaVRybUdwK3dtVENF?=
 =?utf-8?B?T1NkZ1ZpODhXaXhzM1QzVGRLY2I1Z3ZJQ2cwbzR4c0VIVHRGdkE3UXpieVZC?=
 =?utf-8?B?c1M5c05NdEVGbklYME9sK0QrQ1NGeU5vdGhaZG83QU1PNUhLS0NjaG40MVBm?=
 =?utf-8?Q?XARSR57z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0741de05-b8f1-4244-5265-08d896f1c804
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 18:40:46.1738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPHQOwHiIOcXgpguA93WjlbBemXoT9n6h4KxCtA8eff/aIb5z+1pdTPmaZszhb3I0jelp2v8+5zWLcxQesaRsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1145
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEyLzIvMjAgMToyMCBQTSwgR3JlZyBLSCB3cm90ZToKPiBPbiBXZWQsIERlYyAwMiwgMjAy
MCBhdCAwMTowMjowNlBNIC0wNTAwLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4gT24gMTIv
Mi8yMCAxMjozNCBQTSwgR3JlZyBLSCB3cm90ZToKPj4+IE9uIFdlZCwgRGVjIDAyLCAyMDIwIGF0
IDEwOjQ4OjAxQU0gLTA1MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+IE9uIDExLzEx
LzIwIDEwOjM0IEFNLCBHcmVnIEtIIHdyb3RlOgo+Pj4+PiBPbiBXZWQsIE5vdiAxMSwgMjAyMCBh
dCAxMDoxMzoxM0FNIC0wNTAwLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4+Pj4+IE9uIDEx
LzEwLzIwIDEyOjU5IFBNLCBHcmVnIEtIIHdyb3RlOgo+Pj4+Pj4+IE9uIFR1ZSwgTm92IDEwLCAy
MDIwIGF0IDEyOjU0OjIxUE0gLTA1MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+Pj4+
PiBIaSwgYmFjayB0byB0aGlzIGFmdGVyIGEgbG9uZyBjb250ZXh0IHN3aXRjaCBmb3Igc29tZSBo
aWdoZXIgcHJpb3JpdHkgc3R1ZmYuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFNvIGhlcmUgSSB3YXMgYWJs
ZSBldmVudHVhbGx5IHRvIGRyb3AgYWxsIHRoaXMgY29kZSBhbmQgdGhpcyBjaGFuZ2UgaGVyZSBo
dHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHM6
JTJGJTJGY2dpdC5mcmVlZGVza3RvcC5vcmclMkZ+YWdyb2R6b3YlMkZsaW51eCUyRmNvbW1pdCUy
RiUzRmglM0RhbWQtc3RhZ2luZy1kcm0tbmV4dC1kZXZpY2UtdW5wbHVnJTI2aWQlM0Q2MTg1MmM4
YTU5YjRkZDg5ZDYzNzY5MzU1MmM3MzE3NWI5ZjJjY2Q2JmFtcDtkYXRhPTA0JTdDMDElN0NBbmRy
ZXkuR3JvZHpvdnNreSU0MGFtZC5jb20lN0MxMzA0MGFiOWI1MDk0N2E5NWFjYzA4ZDg5NmVlYzE1
ZCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0MjUyOTk1
MDcwOTIxODclN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pR
SWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2Rh
dGE9Q0lYRWw5aFdIVEFkbzd0OXlyZHR1ME9kRUlaM1gyR1FtSlJoRFVqMjhtdyUzRCZhbXA7cmVz
ZXJ2ZWQ9MAo+Pj4+Pj4+PiB3YXMgZW5vdWdoIGZvciBtZS4gU2VlbXMgbGlrZSB3aGlsZSBkZXZp
Y2VfcmVtb3ZlX2ZpbGUgY2FuIGhhbmRsZSB0aGUgdXNlCj4+Pj4+Pj4+IGNhc2Ugd2hlcmUgdGhl
IGZpbGUgYW5kIHRoZSBwYXJlbnQgZGlyZWN0b3J5IGFscmVhZHkgZ29uZSwKPj4+Pj4+Pj4gc3lz
ZnNfcmVtb3ZlX2dyb3VwIGdvZXMgZG93biBpbiBmbGFtZXMgaW4gdGhhdCBjYXNlCj4+Pj4+Pj4+
IGR1ZSB0byBrb2JqLT5zZCBiZWluZyB1bnNldCBvbiBkZXZpY2UgcmVtb3ZhbC4KPj4+Pj4+PiBB
IGRyaXZlciBzaG91bGRuJ3QgZXZlciBoYXZlIHRvIHJlbW92ZSBpbmRpdmlkdWFsIHN5c2ZzIGdy
b3VwcywgdGhlCj4+Pj4+Pj4gZHJpdmVyIGNvcmUvYnVzIGxvZ2ljIHNob3VsZCBkbyBpdCBmb3Ig
dGhlbSBhdXRvbWF0aWNhbGx5Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gQW5kIHdoZW5ldmVyIGEgZHJpdmVy
IGNhbGxzIGEgc3lzZnNfKiBjYWxsLCB0aGF0J3MgYSBoaW50IHRoYXQgc29tZXRoaW5nCj4+Pj4+
Pj4gaXMgbm90IHdvcmtpbmcgcHJvcGVybHkuCj4+Pj4+PiBEbyB5b3UgbWVhbiB0aGF0IHdoaWxl
IHRoZSBkcml2ZXIgY3JlYXRlcyB0aGUgZ3JvdXBzIGFuZCBmaWxlcyBleHBsaWNpdGx5Cj4+Pj4+
PiBmcm9tIGl0J3MgZGlmZmVyZW50IHN1YnN5c3RlbXMgaXQgc2hvdWxkIG5vdCBleHBsaWNpdGx5
IHJlbW92ZSBlYWNoCj4+Pj4+PiBvbmUgb2YgdGhlbSBiZWNhdXNlIGFsbCBvZiB0aGVtIHNob3Vs
ZCBiZSByZW1vdmVkIGF0IG9uY2UgKGFuZAo+Pj4+Pj4gcmVjdXJzaXZlbHkpIHdoZW4gdGhlIGRl
dmljZSBpcyBiZWluZyByZW1vdmVkID8KPj4+Pj4gSW5kaXZpZHVhbCBkcml2ZXJzIHNob3VsZCBu
ZXZlciBhZGQgZ3JvdXBzL2ZpbGVzIGluIHN5c2ZzLCB0aGUgZHJpdmVyCj4+Pj4+IGNvcmUgc2hv
dWxkIGRvIGl0IHByb3Blcmx5IGZvciB5b3UgaWYgeW91IGhhdmUgZXZlcnl0aGluZyBzZXQgdXAK
Pj4+Pj4gcHJvcGVybHkuICBBbmQgeWVzLCB0aGUgZHJpdmVyIGNvcmUgd2lsbCBhdXRvbWF0aWNh
bGx5IHJlbW92ZSB0aGVtIGFzCj4+Pj4+IHdlbGwuCj4+Pj4+Cj4+Pj4+IFBsZWFzZSB1c2UgdGhl
IGRlZmF1bHQgZ3JvdXBzIGF0dHJpYnV0ZSBmb3IgeW91ciBidXMvc3Vic3lzdGVtIGFuZCB0aGlz
Cj4+Pj4+IHdpbGwgaGFwcGVuIGF1dG9tYWdpY2FsbHkuCj4+Pj4gSGkgR3JlZywgSSB0cmllZCB5
b3VyIHN1Z2dlc3Rpb24gdG8gaGFuZyBhbWRncHUncyBzeXNmcwo+Pj4+IGF0dHJpYnV0ZXMgb24g
ZGVmYXVsdCBhdHRyaWJ1dGVzIGluIHN0cnVjdCBkZXZpY2UuZ3JvdXBzIGJ1dCB0dXJucyBvdXQg
aXQncwo+Pj4+IG5vdCB1c2FibGUgc2luY2UgYnkgdGhlCj4+Pj4gdGltZSBpIGhhdmUgYWNjZXNz
IHRvIHN0cnVjdCBkZXZpY2UgZnJvbSBhbWRncHUgY29kZSBpdCBoYXMgYWxyZWFkeSBiZWVuCj4+
Pj4gaW5pdGlhbGl6ZWQgYnkgcGNpIGNvcmUKPj4+PiAoaS5lLsKgIHBhc3QgdGhlIHBvaW50IHdo
ZXJlIGRldmljZV9hZGQtPmRldmljZV9hZGRfYXR0cnMtPmRldmljZV9hZGRfZ3JvdXBzCj4+Pj4g
d2l0aCBkZXYtPmdyb3VwcyBpcyBjYWxsZWQpCj4+Pj4gYW5kIHNvIGkgY2FuJ3QgcmVhbGx5IHVz
ZSBpdC4KPj4+IFRoYXQncyBvZGQsIHdoeSBjYW4ndCB5b3UganVzdCBzZXQgdGhlIGdyb3VwcyBw
b2ludGVyIGluIHlvdXIgcGNpX2RyaXZlcgo+Pj4gc3RydWN0dXJlPyAgVGhhdCdzIHdoYXQgaXQg
aXMgdGhlcmUgZm9yLCByaWdodD8KPj4gSSBhbSBwcm9iYWJseSBtaXNzaW5nIHNvbWV0aGluZyBi
dXQgYW1kZ3B1IHN5c2ZzIGF0dHJzIGFyZSBwZXIgZGV2aWNlIG5vdAo+PiBwZXIgZHJpdmVyCj4g
T29wcywgeW91IGFyZSByaWdodCwgeW91IHdhbnQgdGhlICdkZXZfZ3JvdXBzJyBmaWVsZC4gIExv
b2tzIGxpa2UgcGNpCj4gZG9lc24ndCBleHBvcnQgdGhhdCBkaXJlY3RseSwgc28geW91IGNhbiBk
bzoKPiAJLmRyaXZlciB7Cj4gCQkuZGV2X2dyb3VwcyA9IG15X2RldmljZV9ncm91cHM7Cj4gCX0s
Cj4gaW4geW91ciBwY2lfZHJpdmVyIHN0cnVjdHVyZS4KPgo+IE9yIEknbSBzdXJlIHRoZSBQQ0kg
ZHJpdmVyIG1haW50YWluZXIgd291bGQgdGFrZSBhIHBhdGNoIGxpa2UKPiA3ZDljMWQyZjdhY2Eg
KCJVU0I6IGFkZCBzdXBwb3J0IGZvciBkZXZfZ3JvdXBzIHRvIHN0cnVjdAo+IHVzYl9kZXZpY2Vf
ZHJpdmVyIikgd2FzIGRvbmUgZm9yIHRoZSBVU0Igc3Vic3lzdGVtLCBhcyBkaXZpbmcgaW50byB0
aGUKPiAicmF3IiAuZHJpdmVyIHBvaW50ZXIgaXNuJ3QgcmVhbGx5IHRoYXQgY2xlYW4gb3Igbmlj
ZSBpbiBteSBvcGluaW9uLgoKCkxvb2tzIGxpa2Ugd2hhdCBJIG5lZWQgZXhhY3RseS4gSSB3aWxs
IHByb2JhYmx5IHN0YXJ0IHdpdGggYXNzaWduaW5nIHJhdyBwb2ludGVyIApqdXN0CnRvIHB1c2gg
YWhlYWQgbXkgd29yayBhbmQgaW4gcGFyYWxsZWwgd2lsbCBwcm9iYWJseSBzdWJtaXQgc2FtZSBw
YXRjaCBhcyB5b3Vycwpmb3IgUENJIHN1YnN5c3RlbSByZXZpZXcgYXMgdGhlIHJld29yayB0byBz
d2l0Y2ggdG8gdGhpcyBpcyByZWFsbHkgbWluaW1hbC4KCkFuZHJleQoKCj4KPiB0aGFua3MsCj4K
PiBncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
