Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DAF347866
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 13:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA236E9F1;
	Wed, 24 Mar 2021 12:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBCB6E9F1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 12:24:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDgxdvXrd4i729NktA7TLfhfZLbk+gvWvcMrYwNEFpMPX2wE2wYKU+iu9++a8cwvWNhSRs5x71PQNr8g+fik01Gn/gM5uCO8JKaXzW5iRhmN8bJIz5I/FSauL6xN3XBBaktT+KL+WnWK4+H4DOybm/eq1CJAGzYYE9JDL1niCGW42ZNGTcbQlTeLy2dw7jSGlXiwZPYGi5KP0kSAITchKPeoepPYOIoFC1r6bAtGEv9rPQvwdcoL22I0WkUO9luchslOSGwCBQBHYyWlkEKoWPJzCB+cGPnAvMzU0/iExrwH5Ssp9OcsWFzuRK7pKlsoCHPbwwULy3JxNMFgpRgT2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FBWiIXAhofQbkYblUPIbb5ol27zUlwYxHQMNJEB7HU=;
 b=gLlBkTuYMz6kMviFxH4dqwcOhQ+WrTH1Ujwr6b0Wz4AKaP2aebX0BIF3vB3nXsiii046RdTr7ngntaZbYfdsx0KDfm39HtIL9AlrcWoUnKgn6tz+1yh8eU9WTEGjY1+fjZRqoZHJ+liaR3C2lTp4//0aq2XGgoSx7VoFGp6ajUczWYXc9/07q1HMwY7BkDRgAuaiYzwReafliqjkECDbgF2vBAPxKCTl0B/3lxhWbRMU5NYlvP1k+RSHjGizMgTJUEJR+5kMjAiWY/2Zjf6QwHNobBhH1dxQfEVZ12eL3HDc1T6oGb2wnIC2XJy1zC6GW2ivz4SAiOTuS6XajwJwMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FBWiIXAhofQbkYblUPIbb5ol27zUlwYxHQMNJEB7HU=;
 b=fjpGwJiNXO6YloZaU/yU58DhJXfUtorzNIsWDkjFfP9Tave5iUHNDrWewjhSF4mHkyPNPeSlq23GUhkCUGkfS3Cgb3VtmEvIvFgit86dkcBsvQeAt9hlgwj0lknP2Or+S5z17FcNQBf2/I/MJbCezvJx7kuqG9Cl57LvccbS2S5FtoTGE3t0oZuoiDLyS8M9YNvRUEKgMw+6UTnKnIht/oGxn9tjQhddQ98tu3f6viBnJhSJ5lHXS6a4iis3SEoEgPAhTQiYEvPscZNTV1D3yeHmoYEz1RwFKbra7/XLRdTfpPE2NlYhrLTwOjyUs0FpkzYYG71uv/4rm838yGnfmw==
Authentication-Results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1434.namprd12.prod.outlook.com (2603:10b6:3:77::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 12:24:32 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 12:24:32 +0000
Date: Wed, 24 Mar 2021 09:24:30 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Message-ID: <20210324122430.GW2356281@nvidia.com>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-2-thomas_os@shipmail.org>
 <YFnST5VLcEgv9q+s@phenom.ffwll.local>
 <314fc020-d243-dbf0-acb3-ecfcc9c2443c@shipmail.org>
 <20210323163715.GJ2356281@nvidia.com>
 <5824b731-ca6a-92fd-e314-d986b6a7b101@shipmail.org>
 <YFsM23t2niJwhpM/@phenom.ffwll.local>
Content-Disposition: inline
In-Reply-To: <YFsM23t2niJwhpM/@phenom.ffwll.local>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Wed, 24 Mar 2021 12:24:32 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lP2Yo-001yu8-BY; Wed, 24 Mar 2021 09:24:30 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 471eed84-f9dc-4738-78b7-08d8eebfc748
X-MS-TrafficTypeDiagnostic: DM5PR12MB1434:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1434BC102C211EA874A68E7AC2639@DM5PR12MB1434.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zPLZtBABdo5QzJNJUk7YXugEOmGVOvsnyT652lKBf7KdqNPZbwMikaNfRLj64Xh76vydt2npGpJnSrDr3luuEKON9CvAOJ028O3DYbk0ztb+o7rtkfO6cEXP8r/gZvPJjrBNE1oF2iR4wrb845ktZliHz/OJXeKeJgZH4UMiAxsyny7SoL2KRHyfCIIGSihArdDgBhihJPYfKOs8tRoucsgWwDkJMQ/b7NAFl/yPwbCGo29kgHtu0s3jzRMiqLRKI+xb2xwT1slLTjnpQvbhxA9LdDzwvoiTOO1eCtKscyejj8Ra9LYCIaBAKY2D/yF/Hxw1i8McnqzKmH7WRN6msJuhjG86bCspVCsA2+n9SOaaiZ5R2FTRgpAWQzg+XS4/VNfDRAjDX+aCKKcNtRejM2nIB2jdUuFT8YnaYI90M1kFMfh8mokCQmeVSX8Y+uKfatPH6OV+RSCGOK8mqe49b2MUCks8PB1WuMGKBgiUSUvJXr61E+qNhBwcNz7GXrW+Dap5YKoM0E3w8cn4nxsnhgkzgaO1wCnkX2ODEfd9IDmtSUA2X8J9i8aVNpmw1LvG9s15qVGop4KwUQIe1f43CMJBKv4cRiJ6dvjOIqd70hzzyMrMHAT6uzWU8OsAg6sPmr3SpI4VZD8ad5BxMx1U5wdxVPGTffQ+7XWwc137mhOpZNzseUmmgI+1oZ23fBjTZKINOZMdh/9DAJFV/W6r0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(66556008)(83380400001)(1076003)(5660300002)(9786002)(9746002)(478600001)(26005)(186003)(66574015)(86362001)(316002)(426003)(2616005)(110136005)(66476007)(36756003)(38100700001)(8676002)(8936002)(66946007)(53546011)(33656002)(2906002)(21314003)(14583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dFVsZXNEZG5BWmxSZUJXZzdRNzlvc2Voc0JMSThoREhIby9XRGt6YkpFSm53?=
 =?utf-8?B?RkZBZnV1N1VYV2t2NXhmUU9HTU1Sa043ZWhBT0VKRHhweFJReThzdnErTjNs?=
 =?utf-8?B?anFONkpkNmtFbDFxNnpRaUFhV29QV29VcnMxZ2xBWTRWb0kxTVdUaEFxcWpt?=
 =?utf-8?B?TkY0RnZ1eFRzRU00bHVJbGRaUk1GMG83aGNtUUNBdjRZSlpOeTV0b09sZTlw?=
 =?utf-8?B?RWlrbFZkeEkvT0MxTk5CaUdiQTlFeXd6cVlxWVY2QXd3VG1ucVA4ZitVZUx5?=
 =?utf-8?B?bzdoSDlHaVo3VXJZSmY5Z0prVDZWajVVMmp0UmxVZlJzWVZvNGVyeUpaMXE5?=
 =?utf-8?B?VUQ3Nkx0MElPanBMbys1SHBucU8vTzQ3c25CNDJKSnc5cjVENzYrd1c4a0hv?=
 =?utf-8?B?ZHVOT0s5VndDY3dibnQ1RlN3RnlkM25rTDRYRmdNUGNmOFZCTnBRTGlzMnNB?=
 =?utf-8?B?SnpxWDczbmwxck9ZTS9EZUFEci9hVnJOeEk4dW91amlxL3Vlcy9Tc3lKU3BG?=
 =?utf-8?B?cmMyZGVKSkx4VGkvYUQ5RVA4OXB2Mjg3K1Bwenh2MFlzSWJ0OTk0aUtPb1cz?=
 =?utf-8?B?N1Y5UXJSV01LcmJkZDIvaDd4NWtodWc5V2xwRjQ1MXVBQTFkYWN2RGJab25t?=
 =?utf-8?B?Q3ZXOExiTjQwNERnQTRQUFdWdytkbnBjUG9PaTR3V3lDZjFYdDk1b3k0RC9p?=
 =?utf-8?B?cFV4RXVSc1YwSGljeC9QbDlNcllpN1ZzU2Q3bVRJanpwWGppZnh2djZsN1pH?=
 =?utf-8?B?ZEZHd1RLWWdHdkZrZWI3UkxHWFRjZXVPNnFJZUI1QUR5bkdTdjQ0TTJkR1ZT?=
 =?utf-8?B?K0Nuc0xtOTQ1TktPZnQxOUdrQ3ZWMFYzdzdHZzVvRURpcHo1aTJ1REg0TFpu?=
 =?utf-8?B?SlhKZks5V1p4eU1nbWUzZWdrTnlJcVE5Q1c0TnFjT0FEeGdWSjZqdWZhK1pl?=
 =?utf-8?B?R2tsMFAwMjBtaVh5WTVuRWx3RmZqSVRGMzV0b1FteUc4NDd6eDRxNi91dHBw?=
 =?utf-8?B?Tml3OEdPNUNuVHNDWm9jU0tXVFRGcGpGZ0o0cXdpUFBGaUFXdFl4SE9sS1hY?=
 =?utf-8?B?L1dzeE5CV00xU3BKeTNYUzBpZFlwbnRvcjd5c2NDdUlDbGRPanB4UVdXVytK?=
 =?utf-8?B?S3BLMzkzdjd2ZmJnNjVNUHg3MW9iSDNCd3R3U1dkalNHZVFHSHJvTHkweGFx?=
 =?utf-8?B?d0JTdnRTaXVJQzVIZHZEbDQyRmhuaUtWa2h0UDJVNHBreFhKWElQK0QzYjFm?=
 =?utf-8?B?ditqc05aZnZ5dEtpQ1NCWEo4c0NRUlY5OU81Sm9uSzlCZklML3RPdHJtSE8r?=
 =?utf-8?B?Z2d4U0grdlZqdi9kWG5wb2l3cXBseWNiM05jWkMxMUpaS1drUlZxcnFXU0ZJ?=
 =?utf-8?B?V1d4amxoRTFrUTA5WXd5UXZLbkFmTU5Mc1NJV2YwdVNHSVJoc0VYSjJ3NGN5?=
 =?utf-8?B?WmtKczloNUFGa3RUVVJrYkcxaE54b3ZXMk04SlZ4WFpmaUhzNjFCTVVTZ1RB?=
 =?utf-8?B?UVM4SnB0ZE82QlJlaGRESmdBRjI0dnJrcnRhZWliZHlGUW9rMklOTTU2WnZO?=
 =?utf-8?B?ZmVkdkVQWnUrYkVkMWxXRDVuRlZzZm5abk1BNk54RVhTK3Z0SkU1NkRhc0k0?=
 =?utf-8?B?dVRxSFE2ZEIwR2lQYW1HR09PRmJsTm5pZnB5eVluQmE3VG1YQXF0QlYvMGRP?=
 =?utf-8?B?TDBUWDltM0Q3c3dENzdPK2IrSXlYTkoxZkV0a3g5Ly83RytZOTJWL0sxK1l2?=
 =?utf-8?Q?5vpv+hP6EwfF1Y54BmhAl/I4ePCNP6Hpphkhzgj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471eed84-f9dc-4738-78b7-08d8eebfc748
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 12:24:32.4923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/mQ9uFNpgYN4xpXoiphKDjI83MyFxwSWFl8Uz548ioD6d3UWsvH2hzov5XQQmay
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1434
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMjQsIDIwMjEgYXQgMTA6NTY6NDNBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIE1hciAyMywgMjAyMSBhdCAwNjowNjo1M1BNICswMTAwLCBUaG9tYXMg
SGVsbHN0csO2bSAoSW50ZWwpIHdyb3RlOgo+ID4gCj4gPiBPbiAzLzIzLzIxIDU6MzcgUE0sIEph
c29uIEd1bnRob3JwZSB3cm90ZToKPiA+ID4gT24gVHVlLCBNYXIgMjMsIDIwMjEgYXQgMDU6MzQ6
NTFQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSB3cm90ZToKPiA+ID4gCj4gPiA+
ID4gPiA+IEBAIC0yMTAsNiArMjExLDIwIEBAIHN0YXRpYyB2bV9mYXVsdF90IHR0bV9ib192bV9p
bnNlcnRfaHVnZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKPiA+ID4gPiA+ID4gICAgCWlmICgocGZu
ICYgKGZhdWx0X3BhZ2Vfc2l6ZSAtIDEpKSAhPSAwKQo+ID4gPiA+ID4gPiAgICAJCWdvdG8gb3V0
X2ZhbGxiYWNrOwo+ID4gPiA+ID4gPiArCS8qCj4gPiA+ID4gPiA+ICsJICogSHVnZSBlbnRyaWVz
IG11c3QgYmUgc3BlY2lhbCwgdGhhdCBpcyBtYXJraW5nIHRoZW0gYXMgZGV2bWFwCj4gPiA+ID4g
PiA+ICsJICogd2l0aCBubyBiYWNraW5nIGRldmljZSBtYXAgcmFuZ2UuIElmIHRoZXJlIGlzIGEg
YmFja2luZwo+ID4gPiA+ID4gPiArCSAqIHJhbmdlLCBEb24ndCBpbnNlcnQgYSBodWdlIGVudHJ5
Lgo+ID4gPiA+ID4gPiArCSAqIElmIHRoaXMgY2hlY2sgdHVybnMgb3V0IHRvIGJlIHRvbyBtdWNo
IG9mIGEgcGVyZm9ybWFuY2UgaGl0LAo+ID4gPiA+ID4gPiArCSAqIHdlIGNhbiBpbnN0ZWFkIGhh
dmUgZHJpdmVycyBpbmRpY2F0ZSB3aGV0aGVyIHRoZXkgbWF5IGhhdmUKPiA+ID4gPiA+ID4gKwkg
KiBiYWNraW5nIGRldmljZSBtYXAgcmFuZ2VzIGFuZCBpZiBub3QsIHNraXAgdGhpcyBsb29rdXAu
Cj4gPiA+ID4gPiA+ICsJICovCj4gPiA+ID4gPiBJIHRoaW5rIHdlIGNhbiBkbyB0aGlzIHN0YXRp
Y2FsbHk6Cj4gPiA+ID4gPiAtIGlmIGl0J3Mgc3lzdGVtIG1lbW9yeSB3ZSBrbm93IHRoZXJlJ3Mg
bm8gZGV2bWFwIGZvciBpdCwgYW5kIHdlIGRvIHRoZQo+ID4gPiA+ID4gICAgIHRyaWNrIHRvIGJs
b2NrIGd1cF9mYXN0Cj4gPiA+ID4gWWVzLCB0aGF0IHNob3VsZCB3b3JrLgo+ID4gPiA+ID4gLSBp
ZiBpdCdzIGlvbWVtLCB3ZSBrbm93IGd1cF9mYXN0IHdvbnQgd29yayBhbnl3YXkgaWYgZG9uJ3Qg
c2V0IFBGTl9ERVYsCj4gPiA+ID4gPiAgICAgc28gbWlnaHQgYXMgd2VsbCBub3QgZG8gdGhhdAo+
ID4gPiA+IEkgdGhpbmsgZ3VwX2Zhc3Qgd2lsbCB1bmZvcnR1bmF0ZWx5IG1pc3Rha2UgYSBodWdl
IGlvbWVtIHBhZ2UgZm9yIGFuCj4gPiA+ID4gb3JkaW5hcnkgcGFnZSBhbmQgdHJ5IHRvIGFjY2Vz
cyBhIG5vbi1leGlzdGFudCBzdHJ1Y3QgcGFnZSBmb3IgaXQsIHVubGVzcyB3ZQo+ID4gPiA+IGRv
IHRoZSBkZXZtYXAgdHJpY2suCj4gPiA+ID4gCj4gPiA+ID4gQW5kIHRoZSBsb29rdXAgd291bGQg
dGhlbiBiZSBmb3IgdGhlIHJhcmUgY2FzZSB3aGVyZSBhIGRyaXZlciB3b3VsZCBoYXZlCj4gPiA+
ID4gYWxyZWFkeSByZWdpc3RlcmVkIGEgZGV2X3BhZ2VtYXAgZm9yIGFuIGlvbWVtIGFyZWEgd2hp
Y2ggbWF5IGFsc28gYmUgbWFwcGVkCj4gPiA+ID4gdGhyb3VnaCBUVE0gKGxpa2UgdGhlIHBhdGNo
IGZyb20gRmVsaXggYSBjb3VwbGUgb2Ygd2Vla3MgYWdvKS4gSWYgYSBkcml2ZXIKPiA+ID4gPiBj
YW4gcHJvbWlzZSBub3QgdG8gZG8gdGhhdCwgdGhlbiB3ZSBjYW4gc2FmZWx5IHJlbW92ZSB0aGUg
bG9va3VwLgo+ID4gPiBJc24ndCB0aGUgZGV2bWFwIFBURSBmbGFnIGFyY2ggb3B0aW9uYWw/IERv
ZXMgdGhpcyBmYWxsIGJhY2sgdG8gbm90Cj4gPiA+IHVzaW5nIGh1Z2UgcGFnZXMgb24gYXJjaGVz
IHRoYXQgZG9uJ3Qgc3VwcG9ydCBpdD8KPiA+IAo+ID4gR29vZCBwb2ludC4gTm8sIGN1cnJlbnRs
eSBpdCdzIG9ubHkgY29uZGl0aW9uZWQgb24gdHJhbnNodWdlIHBhZ2Ugc3VwcG9ydC4KPiA+IE5l
ZWQgdG8gY29uZGl0aW9uIGl0IG9uIGFsc28gZGV2bWFwIHN1cHBvcnQuCj4gPiAKPiA+ID4gCj4g
PiA+IEFsc28sIEkgZmVlbCBsaWtlIHRoaXMgY29kZSB0byBpbnN0YWxsICJwdGVfc3BlY2lhbCIg
aHVnZSBwYWdlcyBkb2VzCj4gPiA+IG5vdCBiZWxvbmcgaW4gdGhlIGRybSBzdWJzeXN0ZW0uLgo+
ID4gCj4gPiBJIGNvdWxkIGFkZCBoZWxwZXJzIGluIGh1Z2VfbWVtb3J5LmM6Cj4gPiAKPiA+IHZt
Zl9pbnNlcnRfcGZuX3BtZF9wcm90X3NwZWNpYWwoKSBhbmQKPiA+IHZtZl9pbnNlcnRfcGZuX3B1
ZF9wcm90X3NwZWNpYWwoKQo+IAo+IFRoZSBzb21ld2hhdCBhbm5veWluZyB0aGluZyBpcyB0aGF0
IHdlJ2QgbmVlZCBhbiBlcnJvciBjb2RlIHNvIHdlIGZhbGwKPiBiYWNrIHRvIHB0ZSBmYXVsdCBo
YW5kbGluZy4gVGhhdCdzIGF0IGxlYXN0IG15IHVuZGVyc3RhbmRpbmcgb2YgaG93Cj4gcHVkL3Bt
ZCBmYXVsdCBoYW5kbGluZyB3b3Jrcy4gTm90IHN1cmUgaG93IGF3a3dhcmQgdGhhdCBpcyBnb2lu
ZyB0byBiZQo+IHdpdGggdGhlIG92ZXJhbGwgZmF1bHQgaGFuZGxpbmcgZmxvdy4KPiAKPiBCdXQg
YXNpZGUgZnJvbSB0aGF0IEkgdGhpbmsgdGhpcyBtYWtlcyB0b25zIG9mIHNlbnNlLgoKV2h5IHNo
b3VsZCB0aGUgZHJpdmVyIGJlIHNvIHNwZWNpZmljPwoKdm1mX2luc2VydF9wZm5fcmFuZ2VfWFhY
KCkKCkFuZCBpdCB3aWxsIGZpZ3VyZSBvdXQgdGhlIG9wdGltYWwgd2F5IHRvIGJ1aWxkIHRoZSBw
YWdlIHRhYmxlcy4KCkRyaXZlciBzaG91bGQgcHJvdmlkZSB0aGUgbGFyZ2VzdCBwaHlzaWNhbGx5
IGNvbnRpZ3VvdXMgcmFuZ2UgaXQgY2FuCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
