Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A46314EC0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 13:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9686E04E;
	Tue,  9 Feb 2021 12:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9986E046
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 12:11:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mrx829m9ND4fxlOtPn6yGhreBIXuz5u7O34KDrIjozXdGr2bZ2uht6V3BG+1b86H5Ag2pATAYGb7mOEBzzPpuvLFVRBQqfzLfcm8J5FNQ+ORkdKcLAbNcz6NIhkGke1OBfrHfFix3L8sNsSn7X2qamDYSguadm7M/3rhyVeTrIIYI7odzQ9ObGySbD0gnVbZADAgzKZKH652rzQXsmf3cCDycdrsahkFRQjSZdz5DTLDkQdoUmNA80YRhZIfoL1vjHKVM39Yd5Jim3+i3YmxzC0Z0ZD00T4r6ZI/gdRgkcULIkXb6svx8oekz2YTfipY+616k/Yum1O2TEl3L7zKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lirIvH87AEi9z9KBaO/s5muD93QGIa1juve6lnuznkM=;
 b=DIOBoTPVqVIEhWkyv0mkPc/ABpzMWlOonVRPRYARXgFKz1854jx3R7J+GP0QdC7LngOl95NZT2D8cyJfzi/P6+OJRir6uogLf78grTiNGPMvCSz2PYl6zGx8o/aDrI2gQPJ6LtnvBIYhQMMCLmIh8y5P/OMPE+kB/TF6WZ4cjKSv/cqNQN2VG6CuXoR0m1S9CG3Xo4oex0aEDXj8R9UwfcX5fK7TUo0sShsQwIAeG549Ry4OuapGOVpisAoe0AP83QTm5svREp521A60rY8OC9K6FvM9gbv1Zp3OCVE0uXGHB1QzyJhBeflzEdBDzMT0WDmNwBMC5FcHk9bSvMeVcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lirIvH87AEi9z9KBaO/s5muD93QGIa1juve6lnuznkM=;
 b=i3sWEYg/zoVGArLKdk2n1DX5vGIAv1Tmnm6RuXSkXpt+VDZdTZDSmqZPLwxAhAOepdXSa/riuWWhz6ll54Zbfvk8YWkH2W48SaVgV75Gi2WKDvUwGocJ8Z2KEXGiPuMh7L2XCeNfLKoc9dU+UTHSFB3XtR4RJMGYOppuoCpvJ6E=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.24; Tue, 9 Feb
 2021 12:11:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 12:11:22 +0000
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool
 implementation
To: John Stultz <john.stultz@linaro.org>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org>
 <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
Date: Tue, 9 Feb 2021 13:11:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:444c:9a67:948b:2493]
X-ClientProxiedBy: AM4PR0101CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:444c:9a67:948b:2493]
 (2a02:908:1252:fb60:444c:9a67:948b:2493) by
 AM4PR0101CA0056.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Tue, 9 Feb 2021 12:11:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c44009a3-3faf-470e-33c7-08d8ccf3d096
X-MS-TrafficTypeDiagnostic: MN2PR12MB4207:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42074C9A1A45F31615FB567F838E9@MN2PR12MB4207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eexS5PjTmB86hhAyXgbYc2PRbrqVrfERXs9PRTcZE0ldOgjh37VukpWOk85L/3F4/VuTyrXVSUBkih02gtv2fpvOn0VAs7MkLgnNk4pDFWeKJFl/pTf3RynNqVUIN/uTBJ7gUbhwhXsiYJOjX0Pr9EX70iZ1bV6DsaIabPj4/7Wcxp8GdGhdthT1rBa5VRjuehQH0kmi52o+cP0vAAEBzbYPLu+FpJh97GZ++8ah1BRvks4b5uI1Fb59zgQAGxIUq5YtBjApX6sYmWn0qe9qNWwBYgAkf1q8E/8DxrdXMGt8GDhvPrUa9iQOGbclB2szFjymufJyJa6+RT9to3bQNdo44MpnlFZBzAD6Q2kTVk6EC1vMd6cpde6HGdDNAP0O3hhVLenl0DkUcO+TBASDWyuHDWBwCU0MZi2NUpbmJC79UGxtS4f3hyg/X+C2KARMf8d/ioFaJUYmyCgGQkwFX4tofXh7XZ8tlecdV5utb4/M7U7k6WQSaHo/e78F7yCjVEC7jTRyw2vYms2dQNXUsPQTaEOfuPrllO6JDV56MFr4d/BrRynlXpuHEsrhqs/OKBgy6nNnwLWY++JM5Fi2Xbd+oFsOZu/k5TFkmJcm7doxSBQTlUCBT+ZQUoitadIytaOTJJARF1ucvRAVm4BxyqF6eV6+MzGv/GN9bBY66rQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(966005)(6916009)(31696002)(54906003)(478600001)(86362001)(52116002)(66946007)(66556008)(45080400002)(4326008)(53546011)(2906002)(316002)(6666004)(8676002)(66476007)(8936002)(2616005)(6486002)(31686004)(66574015)(16526019)(7416002)(83380400001)(5660300002)(186003)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Sk1SOFJiL0x4WFJXbWNONzZrRS9FdEkwdWZsaUU4UHZJQ3FyMVVnbGN0UXBq?=
 =?utf-8?B?dTVKWnB2ajQ5MENaTDNDNGpTaWloczFFVENGdkR0R1BKQU9HYnE0Y1NWbGN6?=
 =?utf-8?B?M09mSmdTKzNDcFFNWGhITmFmUDlGNzBrWWlyS0VqcUxYNXViRkhueEF3dUF6?=
 =?utf-8?B?YjNwT25kU21rRythb3ppVkdJT2dUaEUzU01KNXlFa3VVaWo1VXQ5MzlNMnl6?=
 =?utf-8?B?Mytzb1VOSnJERGxQVmdvTVpjSE5CSGs2V2JVRDlKczNZVlp4dDd1Tk8wZkhL?=
 =?utf-8?B?RzVXT1Fhc0VJdVhGOHBjU2grOEhyNnN0ek8yN1pKN3VkVnZpYmVGMW1GaDB1?=
 =?utf-8?B?azRtUmxkNlRpSVJSZTFneTZWeU1VWXVmcXBISTNYVkNLdHpqeEplYlBXd1VW?=
 =?utf-8?B?Y3JrOEVxOWRNY1pwMmJTbTgyaGlJTFh6b0d4c3lESWtVenRFR1NrWUxEUEdM?=
 =?utf-8?B?bWZFbzJEWjh5dVZNcCt6WTVWaGljZmhHQjM5cWlqandJNXh2dkgxQy8zbWFn?=
 =?utf-8?B?VjVldkNRcFE4L2pLOTR6M0Zpa2g3dkQ4U3h4YllwUHpoaXJPN01NYkFHcnhE?=
 =?utf-8?B?aFBLTE1pVTdCcXAyS2J4VTU2R3l0Q1hNclJrZEFBQUcxR2VOWEdVNnlYS1pZ?=
 =?utf-8?B?M3FKYnF5QTZhbVFYSkdxYm1KQ3JFZDRHTVdEMEhQcUF6UUFTWDlSUDQvZWxP?=
 =?utf-8?B?QVY3MGNCQUN3aThYby9LTUM0bi93N0E5RmJWUHZRbm0rUitUSnozSld0V0VJ?=
 =?utf-8?B?aWVhaExTU3pHK29hTUE4NVFmQ05jUVZvWTZYWXlDaDVERDZFTlcrV1U3WnR3?=
 =?utf-8?B?dFFWZmdkajVTNjA2QWlVcFFnRlR2ZkV6NjcwT2ZVaDBiOVZXdnhxekE2TndU?=
 =?utf-8?B?NHlEeFdxTGduY1ZPR3JIejIvMGQzY0c2QkxNQUFBOVpiUDBUa0JjejZic2hK?=
 =?utf-8?B?dkZYSkRQTExqOVBtc2t1WEx5UXMzTytkMU51NXBWeXB6UTFFQmZtWWIrZHZh?=
 =?utf-8?B?U0pWRjAwVUVRTkk0NnMzcFFrRWdpKzdWRitOT0JZK2dWSlplTFI0MytJZVJs?=
 =?utf-8?B?RHlFbE1kaWZyb2lCalpsOTJheWRpWjhZdnlSOWtSQ0J3SC9NeUV0aDZ5SnNI?=
 =?utf-8?B?a2FXSXdiR2ZqY3RlQkFMakFxeENoNHV4TFQ0RWJrdHlCZUpuNzlvMW5HeGp4?=
 =?utf-8?B?MmZQd1FrVFRzS3dMNzVkWkxYWmRhaWJDaXFpYk5OQXptbWVDbW5jckszaWtw?=
 =?utf-8?B?bXVvVWJXc3E4STliWEVGYVVseUNsMmdYUFAyZFhzbmtTdW5iLy9BcTFXZmRM?=
 =?utf-8?B?czd1SVcrNFZoT3ZJVm9jZElQcS9ncDNVeUhDY0NOOXdWVStyeW5MaDJiTlBF?=
 =?utf-8?B?MUpUVmdZVTJ4MHJRSHVxcEQrOXFrcDV4bjlBK0dWUzZhV2UrUi84bEhodGRv?=
 =?utf-8?B?c1dkenVaTitVdDZBQjNsR1NoY3JUeWpQUHNvUkE5cjVROGlOcFVDb0JocXVq?=
 =?utf-8?B?VWxZODRNVkZOWlFvdHZOYXhFVEVBL0dtUDFTWkRTVFRxUHdZMHRDSlZpbktU?=
 =?utf-8?B?dllOV2djZElUbHRwejVWY0VNZU5nU1EwOHRDUUZ3dzBHT2hMV3NRTTJYczl4?=
 =?utf-8?B?NEVjKzArL2RFN0FNVGNvRWZoUzVWKzBROWZLci9QUXFrQ3NLT2ZSdkxtNFJR?=
 =?utf-8?B?UnFtaUF4YkF5elFFbmhISkd5aGdiZ3BXQkV1SjJFNW43UWQzeDFMRWsvU052?=
 =?utf-8?B?ZXpIS1o3WndSWTRZZmc0dW0vV3Z5UmtqRlVXVVcwaTRUUFNoalRMeWF1b2NV?=
 =?utf-8?B?RUVFWmYvbWJvSVR3eXJ6OUVZY2ZXMWc2dlpmSXI5Y2FQNEcvdm5wNHU5cHN1?=
 =?utf-8?Q?ZVbqlVbZKe/uW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c44009a3-3faf-470e-33c7-08d8ccf3d096
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 12:11:22.2968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMFJ6ZpsxfAeuBwqQX7zrYD3+WNRdYS1rxm7XmyyJozBL+LttM+sCb5f+knQ1Dxg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Patil <sspatil@google.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, James Jones <jajones@nvidia.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=c3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAwNS4wMi4yMSB1bSAyMTo0NiBzY2hyaWViIEpvaG4gU3R1bHR6Ogo+IE9uIEZyaSwgRmVi
IDUsIDIwMjEgYXQgMTI6NDcgQU0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+IHdyb3RlOgo+PiBBbSAwNS4wMi4yMSB1bSAwOTowNiBzY2hyaWViIEpvaG4gU3R1
bHR6Ogo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYWdlX3Bvb2wuYyBiL2RyaXZl
cnMvZ3B1L2RybS9wYWdlX3Bvb2wuYwo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4
IDAwMDAwMDAwMDAwMC4uMjEzOWY4NmU2Y2E3Cj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vcGFnZV9wb29sLmMKPj4+IEBAIC0wLDAgKzEsMjIwIEBACj4+PiArLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPj4gUGxlYXNlIHVzZSBhIEJTRC9NSVQg
Y29tcGF0aWJsZSBsaWNlbnNlIGlmIHlvdSB3YW50IHRvIGNvcHkgdGhpcyBmcm9tCj4+IHRoZSBU
VE0gY29kZS4KPiBIcm0uIFRoaXMgbWF5IGJlIHByb2JsZW1hdGljLCBhcyBpdCdzIG5vdCBqdXN0
IFRUTSBjb2RlLCBidXQgc29tZSBvZgo+IHRoZSBUVE0gbG9naWMgaW50ZWdyYXRlZCBpbnRvIGEg
cGFnZS1wb29sIGltcGxlbWVudGF0aW9uIEkgd3JvdGUgYmFzZWQKPiBvbiBsb2dpYyBmcm9tIHRo
ZSBJT04gY29kZSAod2hpY2ggd2FzIEdQTC0yLjAgYmVmb3JlIGl0IHdhcyBkcm9wcGVkKS4KPiBT
byBJIGRvbid0IHRoaW5rIEkgY2FuIGp1c3QgbWFrZSBpdCBNSVQuICBBbnkgZXh0cmEgY29udGV4
dCBvbiB0aGUKPiBuZWVkIGZvciBNSVQsIG9yIHN1Z2dlc3Rpb25zIG9uIGhvdyB0byBiZXN0IHJl
c29sdmUgdGhpcz8KCk1vc3Qgb2YgdGhlIERSTS9UVE0gY29kZSBpcyBhbHNvIGxpY2Vuc2UgYWJs
ZSB1bmRlciB0aGUgQlNEL01JVCBzdHlsZSAKbGljZW5zZSBzaW5jZSB3ZSB3YW50IHRvIGVuYWJs
ZSB0aGUgQlNEIGd1eXMgdG8gcG9ydCBpdCBvdmVyIGFzIHdlbGwuCgpXaGF0IHN0dWZmIGRvIHlv
dSBuZWVkIGZyb20gdGhlIElPTiBjb2RlIHRoYXQgeW91IGNhbid0IGp1c3QgY29kZSAKeW91cnNl
bGY/IEFzIGZhciBhcyBJIGhhdmUgc2VlbiB0aGlzIGlzIGxpa2UgOTklIGNvZGUgZnJvbSB0aGUg
VFRNIHBvb2wuCgpDaHJpc3RpYW4uCgo+Cj4+PiAraW50IGRybV9wYWdlX3Bvb2xfZ2V0X3NpemUo
c3RydWN0IGRybV9wYWdlX3Bvb2wgKnBvb2wpCj4+PiArewo+Pj4gKyAgICAgaW50IHJldDsKPj4+
ICsKPj4+ICsgICAgIHNwaW5fbG9jaygmcG9vbC0+bG9jayk7Cj4+PiArICAgICByZXQgPSBwb29s
LT5jb3VudDsKPj4+ICsgICAgIHNwaW5fdW5sb2NrKCZwb29sLT5sb2NrKTsKPj4gTWF5YmUgdXNl
IGFuIGF0b21pYyBmb3IgdGhlIGNvdW50IGluc3RlYWQ/Cj4+Cj4gSSBjYW4gZG8gdGhhdCwgYnV0
IGFtIGN1cmlvdXMgYXMgdG8gdGhlIGJlbmVmaXQ/IFdlIGFyZSBtb3N0bHkgdXNpbmcKPiBjb3Vu
dCB3aGVyZSB3ZSBhbHJlYWR5IGhhdmUgdG8gdGFrZSB0aGUgcG9vbC0+bG9jayBhbnl3YXksIGFu
ZCB0aGlzCj4gZHJtX3BhZ2VfcG9vbF9nZXRfc2l6ZSgpIGlzIG9ubHkgdXNlZCBmb3IgZGVidWdm
cyBvdXRwdXQgc28gZmFyLCBzbyBJCj4gZG9uJ3QgZXhwZWN0IGl0IHRvIGJlIGEgaG90IHBhdGgu
CgpZZWFoLCBpdCdzIG5vdCByZWFsbHkgaW1wb3J0YW50LiBJSVJDIEkgZXZlbiB3YWxrZWQgb3Zl
ciB0aGUgbGlua2VkIGxpc3QgCnRvIGNvdW50IGhvdyBtYW55IHBhZ2VzIHdlIGhhZC4KCkNocmlz
dGlhbi4KCj4KPgo+Pj4gK3ZvaWQgZHJtX3BhZ2VfcG9vbF9hZGQoc3RydWN0IGRybV9wYWdlX3Bv
b2wgKnBvb2wsIHN0cnVjdCBwYWdlICpwYWdlKQo+Pj4gK3sKPj4+ICsgICAgIHNwaW5fbG9jaygm
cG9vbC0+bG9jayk7Cj4+PiArICAgICBsaXN0X2FkZF90YWlsKCZwYWdlLT5scnUsICZwb29sLT5p
dGVtcyk7Cj4+PiArICAgICBwb29sLT5jb3VudCsrOwo+Pj4gKyAgICAgYXRvbWljX2xvbmdfYWRk
KDEgPDwgcG9vbC0+b3JkZXIsICZ0b3RhbF9wYWdlcyk7Cj4+PiArICAgICBzcGluX3VubG9jaygm
cG9vbC0+bG9jayk7Cj4+PiArCj4+PiArICAgICBtb2Rfbm9kZV9wYWdlX3N0YXRlKHBhZ2VfcGdk
YXQocGFnZSksIE5SX0tFUk5FTF9NSVNDX1JFQ0xBSU1BQkxFLAo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAxIDw8IHBvb2wtPm9yZGVyKTsKPj4gSHVpIHdoYXQ/IFdoYXQgc2hvdWxkIHRo
YXQgYmUgZ29vZCBmb3I/Cj4gVGhpcyBpcyBhIGNhcnJ5b3ZlciBmcm9tIHRoZSBJT04gcGFnZSBw
b29sIGltcGxlbWVudGF0aW9uOgo+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdC5rZXJuZWwub3JnJTJGcHViJTJGc2Nt
JTJGbGludXglMkZrZXJuZWwlMkZnaXQlMkZ0b3J2YWxkcyUyRmxpbnV4LmdpdCUyRnRyZWUlMkZk
cml2ZXJzJTJGc3RhZ2luZyUyRmFuZHJvaWQlMkZpb24lMkZpb25fcGFnZV9wb29sLmMlM0ZoJTNE
djUuMTAlMjNuMjgmYW1wO2RhdGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29t
JTdDYzRlYWRiMGE5Y2Y2NDkxZDk5YmEwOGQ4Y2ExNzM0NTclN0MzZGQ4OTYxZmU0ODg0ZTYwOGUx
MWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDgxNTQ4MzI1MTc0ODg1JTdDVW5rbm93biU3Q1RX
RnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsx
aGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPUZValpLNU5TRE1VWWZVN3ZHZUU0
ZkRVMkhDRiUyRll5TkJ3YzMwYW9MTFBRNCUzRCZhbXA7cmVzZXJ2ZWQ9MAo+Cj4gTXkgc2Vuc2Ug
aXMgaXQgaGVscHMgd2l0aCB0aGUgdm1zdGF0L21lbWluZm8gYWNjb3VudGluZyBzbyBmb2xrcyBj
YW4KPiBzZWUgdGhlIGNhY2hlZCBwYWdlcyBhcmUgc2hyaW5rYWJsZS9mcmVlYWJsZS4gVGhpcyBt
YXliZSBmYWxscyB1bmRlcgo+IG90aGVyIGRtYWJ1ZiBhY2NvdW50aW5nL3N0YXRzIGRpc2N1c3Np
b25zLCBzbyBJJ20gaGFwcHkgdG8gcmVtb3ZlIGl0Cj4gZm9yIG5vdywgb3IgbGV0IHRoZSBkcml2
ZXJzIHVzaW5nIHRoZSBzaGFyZWQgcGFnZSBwb29sIGxvZ2ljIGhhbmRsZQo+IHRoZSBhY2NvdW50
aW5nIHRoZW1zZWx2ZXM/Cj4KPgo+Pj4gK3N0YXRpYyBzdHJ1Y3QgcGFnZSAqZHJtX3BhZ2VfcG9v
bF9yZW1vdmUoc3RydWN0IGRybV9wYWdlX3Bvb2wgKnBvb2wpCj4+PiArewo+Pj4gKyAgICAgc3Ry
dWN0IHBhZ2UgKnBhZ2U7Cj4+PiArCj4+PiArICAgICBpZiAoIXBvb2wtPmNvdW50KQo+Pj4gKyAg
ICAgICAgICAgICByZXR1cm4gTlVMTDsKPj4gQmV0dGVyIHVzZSBsaXN0X2ZpcnN0X2VudHJ5X29y
X251bGwgaW5zdGVhZCBvZiBjaGVja2luZyB0aGUgY291bnQuCj4+Cj4+IFRoaXMgd2F5IHlvdSBj
YW4gYWxzbyBwdWxsIHRoZSBsb2NrIGludG8gdGhlIGZ1bmN0aW9uLgo+IFllYSwgdGhhdCBjbGVh
bnMgYSBudW1iZXIgb2YgdGhpbmdzIHVwIG5pY2VseS4gVGhhbmsgeW91IQo+Cj4KPj4+ICtzdHJ1
Y3QgZHJtX3BhZ2VfcG9vbCAqZHJtX3BhZ2VfcG9vbF9jcmVhdGUodW5zaWduZWQgaW50IG9yZGVy
LAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgKCpmcmVl
X3BhZ2UpKHN0cnVjdCBwYWdlICpwLCB1bnNpZ25lZCBpbnQgb3JkZXIpKQo+Pj4gK3sKPj4+ICsg
ICAgIHN0cnVjdCBkcm1fcGFnZV9wb29sICpwb29sID0ga21hbGxvYyhzaXplb2YoKnBvb2wpLCBH
RlBfS0VSTkVMKTsKPj4gV2h5IG5vdCBtYWtpbmcgdGhpcyBhbiBlbWJlZGRlZCBvYmplY3Q/IFdl
IHNob3VsZCBub3Qgc2VlIG11Y2ggZHluYW1pYwo+PiBwb29sIGNyZWF0aW9uLgo+IFllYSwgaXQg
ZmVsdCBjbGVhbmVyIGF0IHRoZSB0aW1lIHRoaXMgd2F5LCBidXQgSSB0aGluayBJIHdpbGwgbmVl
ZCB0bwo+IHN3aXRjaCB0byBhbiBlbWJlZGRlZCBvYmplY3QgaW4gb3JkZXIgdG8gcmVzb2x2ZSB0
aGUgbWVtb3J5IHVzYWdlCj4gaXNzdWUgeW91IHBvaW50ZWQgb3V0IHdpdGggZ3Jvd2luZyB0aGUg
dHRtX3Bvb2xfZG1hLCBzbyB0aGFuayB5b3UgZm9yCj4gdGhlIHN1Z2dlc3Rpb24hCj4KPgo+Pj4g
K3ZvaWQgZHJtX3BhZ2VfcG9vbF9kZXN0cm95KHN0cnVjdCBkcm1fcGFnZV9wb29sICpwb29sKQo+
Pj4gK3sKPj4+ICsgICAgIHN0cnVjdCBwYWdlICpwYWdlOwo+Pj4gKwo+Pj4gKyAgICAgLyogUmVt
b3ZlIHVzIGZyb20gdGhlIHBvb2wgbGlzdCAqLwo+Pj4gKyAgICAgbXV0ZXhfbG9jaygmcG9vbF9s
aXN0X2xvY2spOwo+Pj4gKyAgICAgbGlzdF9kZWwoJnBvb2wtPmxpc3QpOwo+Pj4gKyAgICAgbXV0
ZXhfdW5sb2NrKCZwb29sX2xpc3RfbG9jayk7Cj4+PiArCj4+PiArICAgICAvKiBGcmVlIGFueSBy
ZW1haW5pbmcgcGFnZXMgaW4gdGhlIHBvb2wgKi8KPj4+ICsgICAgIHNwaW5fbG9jaygmcG9vbC0+
bG9jayk7Cj4+IExvY2tpbmcgc2hvdWxkIGJlIHVubmVjZXNzYXJ5IHdoZW4gdGhlIHBvb2wgaXMg
ZGVzdHJveWVkIGFueXdheS4KPiBJIGd1ZXNzIGlmIHdlJ3ZlIGFscmVhZHkgcHJ1bmVkIG91cnNl
bGYgZnJvbSB0aGUgcG9vbCBsaXN0LCB0aGVuIHlvdXIKPiByaWdodCwgd2UgY2FuJ3QgcmFjZSB3
aXRoIHRoZSBzaHJpbmtlciBhbmQgaXQncyBtYXliZSBub3QgbmVjZXNzYXJ5Lgo+IEJ1dCBpdCBh
bHNvIHNlZW1zIGVhc2llciB0byBjb25zaXN0ZW50bHkgZm9sbG93IHRoZSBsb2NraW5nIHJ1bGVz
IGluIGEKPiB2ZXJ5IHVubGlrZWx5IHBhdGggcmF0aGVyIHRoYW4gbGVhbmluZyBvbiBzdWJ0bGV0
eS4gIEVpdGhlciB3YXksIEkKPiB0aGluayB0aGlzIGJlY29tZXMgbW9vdCBpZiBJIG1ha2UgdGhl
IGltcHJvdmVtZW50cyB5b3Ugc3VnZ2VzdCB0bwo+IGRybV9wYWdlX3Bvb2xfcmVtb3ZlKCkuCj4K
Pj4+ICtzdGF0aWMgaW50IGRybV9wYWdlX3Bvb2xfc2hyaW5rX29uZSh2b2lkKQo+Pj4gK3sKPj4+
ICsgICAgIHN0cnVjdCBkcm1fcGFnZV9wb29sICpwb29sOwo+Pj4gKyAgICAgc3RydWN0IHBhZ2Ug
KnBhZ2U7Cj4+PiArICAgICBpbnQgbnJfZnJlZWQgPSAwOwo+Pj4gKwo+Pj4gKyAgICAgbXV0ZXhf
bG9jaygmcG9vbF9saXN0X2xvY2spOwo+Pj4gKyAgICAgcG9vbCA9IGxpc3RfZmlyc3RfZW50cnko
JnBvb2xfbGlzdCwgdHlwZW9mKCpwb29sKSwgbGlzdCk7Cj4+PiArCj4+PiArICAgICBzcGluX2xv
Y2soJnBvb2wtPmxvY2spOwo+Pj4gKyAgICAgcGFnZSA9IGRybV9wYWdlX3Bvb2xfcmVtb3ZlKHBv
b2wpOwo+Pj4gKyAgICAgc3Bpbl91bmxvY2soJnBvb2wtPmxvY2spOwo+Pj4gKwo+Pj4gKyAgICAg
aWYgKHBhZ2UpCj4+PiArICAgICAgICAgICAgIG5yX2ZyZWVkID0gZHJtX3BhZ2VfcG9vbF9mcmVl
X3BhZ2VzKHBvb2wsIHBhZ2UpOwo+Pj4gKwo+Pj4gKyAgICAgbGlzdF9tb3ZlX3RhaWwoJnBvb2wt
Pmxpc3QsICZwb29sX2xpc3QpOwo+PiBCZXR0ZXIgdG8gbW92ZSB0aGlzIHVwLCBkaXJlY3RseSBh
ZnRlciB0aGUgbGlzdF9maXJzdF9lbnRyeSgpLgo+IFNvdW5kcyBnb29kIQo+Cj4gVGhhbmtzIHNv
IG11Y2ggZm9yIHlvdXIgcmV2aWV3IGFuZCBmZWVkYmFjayEgSSdsbCB0cnkgdG8gZ2V0IHNvbWUg
b2YKPiB0aGUgZWFzeSBzdWdnZXN0aW9ucyBpbnRlZ3JhdGVkLCBhbmQgd2lsbCBoYXZlIHRvIGZp
Z3VyZSBvdXQgd2hhdCB0bwo+IGRvIGFib3V0IHRoZSByZS1saWNlbnNpbmcgcmVxdWVzdC4KPgo+
IHRoYW5rcwo+IC1qb2huCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
