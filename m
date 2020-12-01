Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF7B2CA367
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 14:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856F66E4F1;
	Tue,  1 Dec 2020 13:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770078.outbound.protection.outlook.com [40.107.77.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951A26E4F1
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 13:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUh33LG8BiotR5waSQUVCIjjyhgk0YHJaBBeT+ZmOF4qc8G95i8YnlyzCjJgnMOaJspoYHeUnR7iF7bbVYJYhaiw02WaSI10GCcP/2s7XIggvIA8HlF9N38cPKfTL2XuHWQV/k4L2GQwwIvW5tB/Wr0/5v5ZieYKbRIkg4JkVQGK6P0a5OlreYKOrHAnoW+vhkjCRX5NiW6ZbhLdU3F1U6PJB+y3517qPkmZFTZb9nde6X7WczQ8T3ORDOJVae+5sNg2eTo8W3H4tfPh0bBBnj2VYnMhg+bGUacTFRkI8oxsb6QeEp28uJSwOP4nJx5ol6pBUcxxwoEyrq+ORD6s4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8LqTt2loRMXxHJ48JiPwJdwmuIU4y44WCyaixA7liI=;
 b=FqYeMCJXpRE4iykgNGTD+a9cQ1eQOglAivlc8PX0zKof2H/TOVyuHxQcZfAsMd5O06UA9g+vndM334lfNNkywZ2YawOLInh5USso8m0YxCRhRR3PUh2KCjr31bW9wCRQWSMQB2PYSF7Kgu2fC8q3WW4Hu2uc8rYzWW3vqqF1NkUkRAFU0wDYDmJcjlWlWdHphKB/UGtVx4KDIOfT9h8q4cWZvWHDnq9cZiYd/Zney0cf20/KtuNqRujkDZx5W+tO3Dpl3unlK7PyPhfvpTfZ9c6Yyw6aNmYaqRFkhhWvvsMsBMPOy+Tfrg3ZHBk23SL5iQXAkY8EsxF1fYQCRCpaaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8LqTt2loRMXxHJ48JiPwJdwmuIU4y44WCyaixA7liI=;
 b=NAQznO/HH6rdiSQtLbe5bc+y1nwUCE76Uhrsm/NAn0REEf09U3pUmL2vk0E+LA7HKHbMJ9RmH53TmDFFTMSiDJ7FkD9+sE8RtfU/yimhDE2qgtzCb6EIwsqOccDuIhSGyk1O96Cf8HDgN2BXJNrWuMxMsVJtMRmcCIZLaLyI408=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4112.namprd12.prod.outlook.com (2603:10b6:208:19a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 1 Dec
 2020 13:05:48 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 13:05:48 +0000
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
 <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
 <0237fafc-f57e-b60b-f92c-0b0a79e9448e@suse.de>
 <CAKMK7uG186rtmopf9h-ZrR+D1r7c2-5nrxg86dZxwmnLN1QGZg@mail.gmail.com>
 <d50074f7-145d-2af5-e8cd-08b57e204ede@suse.de>
 <CAKMK7uHe+Or2mnbESXoTm=yTFxyWK01DjHLdnxzGkK=PYb4_9g@mail.gmail.com>
 <56f730f5-eda1-3d87-0d35-63faf91c79e5@suse.de>
 <a8e15d38-2b92-a278-2ad9-e44c368c6a15@amd.com>
 <0e31f447-4195-77fe-a68d-97b96f46f327@suse.de>
 <aa3c4ad6-f99e-de48-e797-0748c9706e9e@amd.com>
 <7211f3d5-8298-6df3-05b5-c56b5e89f162@suse.de>
 <870cfd16-02a8-8a6d-8b7f-8ee4b57ef222@amd.com>
 <974e9258-d50c-c6ef-73e8-e5a762a58aa7@suse.de>
 <49c3560d-08f4-f49d-a55b-18ea87b2c2ad@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <74ad99d1-9963-b648-ffa8-ae0858326749@amd.com>
Date: Tue, 1 Dec 2020 14:05:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <49c3560d-08f4-f49d-a55b-18ea87b2c2ad@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0118.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0118.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 1 Dec 2020 13:05:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9d6b3147-b71d-4583-6e28-08d895f9d286
X-MS-TrafficTypeDiagnostic: MN2PR12MB4112:
X-Microsoft-Antispam-PRVS: <MN2PR12MB411235102A1C0287938851A883F40@MN2PR12MB4112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /yNIkKn9Ig8EKSoHHpKy5zc0sJ4slyub7NoW6kIqCfYUBRjWk4sTlHszdOIEf8UnaN3aMQhxXBNhGBTNJfOVZDJMkD5oJZ70v3loljJZUyI0conEALUNnBb4h37NKujcOg3H2EYOgeLotphmDC7lYDFIRoSa+2W3y0jKrasvnj0+efmRAcTcsNxTeE/KI0Ltu5YNQyftFaDGASmRIdH372SA3Z/pINsOkMD6q2ibOpHVOCjd4AdCoQTGQvwqreWj7ePx+TTcoPebskumLx9WkQO2O00wxj7crI+NlFDqSmcH3kxzeX/pp9XdAnunbnGhh+oqd4VVofVPkuek8pS8e0Ur1y2PLR0ZpKpVyKU5KF3haXKlWRSrynIty8cm2n/QUdo1woA5jDdSGf5Zs/FGJzcPOnRGmXqUN24VfdkfAmc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(966005)(52116002)(5660300002)(66556008)(66476007)(66946007)(478600001)(83380400001)(16526019)(31686004)(6486002)(66574015)(31696002)(186003)(4326008)(2616005)(8676002)(6666004)(54906003)(36756003)(8936002)(110136005)(316002)(2906002)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U2dSKzVTYjk2VHRwQ0t4SHlOS2VxTFhmeGQzcDlhVUxubmRJaC85bkUwL0o3?=
 =?utf-8?B?L0lNTUFSRkRIazdkMkx0S2E5S0pXN0MzSzlzYXMzbUJlUXVTSGo2Vmo5YnBJ?=
 =?utf-8?B?ZHl0QW41NXJsbnJpZXNjV0dWZCs5Wng5OFh6YngvYjh1Vm53RzhmWit6N1Bv?=
 =?utf-8?B?cWhDdmI0dlBiYjBQZnErb1lqakZ1Zi9vaFJKa2xId0ZHa2hWSmRGWW54c1N2?=
 =?utf-8?B?NE1NNkFNUnltZ0VaUlJETG52ckdHaUhNUk5FcTlCV1VFZVppVU54c2RlZ0FG?=
 =?utf-8?B?ZHg3bDdzUEZSNGg5eEE5T283aTRKWFBFVlAyTS9QZTBlaWhKaXVBT28zVnlk?=
 =?utf-8?B?emdqcWZHbVBERWJHL1pJM3F3d3l1SFVQUDA4anFEdHRIdU5ZNnRFU0FIWWhB?=
 =?utf-8?B?bUZrZkFJMTZZa015MnJia3BoWjJ1VWEzai96RFRCU0R4NlFsb0RadU1UbEQ5?=
 =?utf-8?B?bXBQVmlKa0p5ZmZSeTJFL09qblE2aEZUODg1a3QyL1cwOVlhclJhRGdiZFlP?=
 =?utf-8?B?cVZXdGlHWm4zS2FWb3pKbHFHcXFOc05TK2FzV1pXeFkrYkM1VDVwUXZJcUsr?=
 =?utf-8?B?ZnpwcG4zMWtQdVFTTTc3c2VpL0E1Z1YrcDR2Vy90VThEWW9GQkF3U2lsQ1Ji?=
 =?utf-8?B?N051SFF6OE85NUdnNUZ3WUtXOTdJTEE4OUp6UjJLNzFuaElSaEZ2UnV5OVhq?=
 =?utf-8?B?VTZXVHFzdFYyUTJtNGlPYTJxZGZRaTVNeXc5bzJhQlB0bk5NSWM0K1JGRk1p?=
 =?utf-8?B?SEVFN3ZUMzJhaXhLaXFpTVM1dEJNWVg3RG81U2hjN1pvdkJ2MEZrUXFSM1hr?=
 =?utf-8?B?MzRmZzVxZmFPZ09QcW5wd25aWVUvR2lvWU9yTlMrVWFQUnJPQWY4UmRXVzA0?=
 =?utf-8?B?eGd3Tm52eG1OM0hEOFdnWWU0bUhydVlEMEpkdW9aajJTVy9oTldVTFliRCtQ?=
 =?utf-8?B?NlJGbWZzUC8vT0I4ajYrMDN1VGlKVW5VKzRZZHJickk4Z2Q1MVZMSFNvcG9o?=
 =?utf-8?B?bERBQWhiMUZkRnRGUFVBNHgrMFA2YkxWYXhmZjd0eURFbU1YeWxGVWpXSTdC?=
 =?utf-8?B?bjdsQjdBaUViZ1M3Z2ZzK0loa0pET3JkYTZUeUlpd2FycmJVakpQK0hXWkNU?=
 =?utf-8?B?S1Z5L2lHbjlwQ3pvK3pHMFJtKzV4Y0dsZkJUSnR6c0hzYXRwbmxnVy9PempK?=
 =?utf-8?B?Zjh4endwZk8vWXpxZmFUb0Jac01iUStkNGc4VzBVSWVXdzY3NVF4dlVwUHVq?=
 =?utf-8?B?YmdicVlXSlBFRFJObUg1bDgyRjJGVVkvcE8ydWVFckxYY01KejhWOUFhd0Yz?=
 =?utf-8?B?OFMrZmg1SFYyMUgrK2RqY2tHU3NmeTVEM2owakNTdU4xeWUvWXY1U3c5UmFm?=
 =?utf-8?B?czZ1bHI5UjhuUktMR2MvN2dQeDZ4a1AyWkpyMndwZkhKeGZwWktVSnN4QkFN?=
 =?utf-8?Q?pruOv0GL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6b3147-b71d-4583-6e28-08d895f9d286
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 13:05:48.6054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/r3Awl6esdKqtE7xWFj8SU36/H5U/o1HdLJM9GJvnLmDTogEaxJPcUpxgh6PqEK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4112
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
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDEuMTIuMjAgdW0gMTM6NTMgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaQo+Cj4g
QW0gMDEuMTIuMjAgdW0gMTM6NTEgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPj4gSGkKPj4K
Pj4gQW0gMDEuMTIuMjAgdW0gMTM6Mzggc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+Pj4gQW0g
MDEuMTIuMjAgdW0gMTM6MzMgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPj4+PiBIaQo+Pj4+
Cj4+Pj4gQW0gMDEuMTIuMjAgdW0gMTM6MTQgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+Pj4+
PiBBbSAwMS4xMi4yMCB1bSAxMjozMCBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+Pj4+Pj4g
SGkKPj4+Pj4+Cj4+Pj4+PiBBbSAwMS4xMi4yMCB1bSAxMTozNCBzY2hyaWViIENocmlzdGlhbiBL
w7ZuaWc6Cj4+Pj4+Pj4+IFsuLi5dCj4+Pj4+Pj4+IEluIHBhdGNoIDYgb2YgdGhpcyBzZXJpZXMs
IHRoZXJlJ3MgYXN0IGN1cnNvciBjb2RlIHRoYXQgCj4+Pj4+Pj4+IGFjcXVpcmVzIHR3byBCTydz
IHJlc2VydmF0aW9uIGxvY2tzIGFuZCB2bWFwcyB0aGVtIGFmdGVyd2FyZHMuIAo+Pj4+Pj4+PiBU
aGF0J3MgcHJvYmFibHkgaG93IHlvdSBpbnRlbmQgdG8gdXNlIGRtYV9idWZfdm1hcF9sb2NhbC4K
Pj4+Pj4+Pj4KPj4+Pj4+Pj4gSG93ZXZlciwgSSB0aGluayBpdCdzIG1vcmUgbG9naWNhbGx5IHRv
IGhhdmUgYSB2bWFwIGNhbGxiYWNrIAo+Pj4+Pj4+PiB0aGF0IG9ubHkgZG9lcyB0aGUgYWN0dWFs
IHZtYXAuIFRoaXMgaXMgYWxsIHRoYXQgZXhwb3J0ZXJzIAo+Pj4+Pj4+PiB3b3VsZCBoYXZlIHRv
IGltcGxlbWVudC4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gQW5kIHdpdGggdGhhdCwgYnVpbGQgb25lIGhl
bHBlciB0aGF0IHBpbnMgYmVmb3JlIHZtYXAgYW5kIG9uZSAKPj4+Pj4+Pj4gaGVscGVyIHRoYXQg
Z2V0cyB0aGUgcmVzdiBsb2NrLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSBkb24ndCB0aGluayB0aGF0IHRo
aXMgaXMgd2lsbCB3b3JrIG5vciBpcyBpdCBhIGdvb2QgYXBwcm9hY2guCj4+Pj4+Pj4KPj4+Pj4+
PiBTZWUgdGhlIGFzdCBjdXJzb3IgaGFuZGxpbmcgZm9yIGV4YW1wbGUuIFlvdSBuZWVkIHRvIGFj
cXVpcmUgdHdvIAo+Pj4+Pj4+IEJPcyBoZXJlLCBub3QganVzdCBvbmUuIEFuZCB0aGlzIGNhbid0
IGJlIGRvbmUgY2xlYW5seSB3aXRoIGEgCj4+Pj4+Pj4gc2luZ2xlIHZtYXAgY2FsbC4KPj4+Pj4+
Cj4+Pj4+PiBUaGF0IHNlZW1zIHRvIGJlIGEgbWlzdW5kZXJzdGFuZGluZy4KPj4+Pj4+Cj4+Pj4+
PiBJIGRvbid0IG1lbnRpb25lZCBpdCBleHBsaWNpdGx5LCBidXQgdGhlcmUncyBvZiBjb3Vyc2Ug
YW5vdGhlciAKPj4+Pj4+IGhlbHBlciB0aGF0IG9ubHkgdm1hcHMgYW5kIG5vdGhpbmcgZWxzZS4g
VGhpcyB3b3VsZCBiZSB1c2VmdWwgZm9yIAo+Pj4+Pj4gY2FzZXMgbGlrZSB0aGUgY3Vyc29yIGNv
ZGUuIFNvIHRoZXJlIHdvdWxkIGJlOgo+Pj4+Pj4KPj4+Pj4+IMKgZG1hX2J1Zl92bWFwKCkgLSBw
aW4gKyB2bWFwCj4+Pj4+PiDCoGRtYV9idWZfdm1hcF9sb2NhbCgpIC0gbG9jayArIHZtYXAKPj4+
Pj4+IMKgZG1hX2J1Zl92bWFwX2xvY2tlZCgpIC0gb25seSB2bWFwOyBjYWxsZXIgaGFzIHNldCB1
cCB0aGUgQk9zCj4+Pj4+Cj4+Pj4+IFdlbGwgdGhhdCB6b28gb2YgaGVscGVycyB3aWxsIGNlcnRh
aW5seSBnZXQgYSBOQUsgZnJvbSBteSBzaWRlLgo+Pj4+Pgo+Pj4+PiBTZWUgaW50ZXJmYWNlcyBs
aWtlIHRoaXMgc2hvdWxkIGltcGxlbWVudCBzaW1wbGUgZnVuY3Rpb25zIGFuZCBub3QgCj4+Pj4+
IGhpZGUgd2hhdCdzIGFjdHVhbGx5IG5lZWRzIHRvIGJlIGRvbmUgaW5zaWRlIHRoZSBkcml2ZXJz
IHVzaW5nIAo+Pj4+PiB0aGlzIGludGVyZmFjZS4KPj4+Pgo+Pj4+IElmIDkgb2YgMTAgaW52b2Nh
dGlvbnMgdXNlIHRoZSBzYW1lIHBhdHRlcm4sIHdoeSBub3QgcHV0IHRoYXQgCj4+Pj4gcGF0dGVy
biBpbiBhIGhlbHBlcj8gSSBzZWUgbm90aGluZyB3cm9uZyB3aXRoIHRoYXQuCj4+Pgo+Pj4gQmVj
YXVzZSBpdCBoaWRlcyB0aGUgbG9ja2luZyBzZW1hbnRpY3MgaW5zaWRlIHRoZSBoZWxwZXIuIFNl
ZSB3aGVuIAo+Pj4geW91IGhhdmUgdGhlIGxvY2svdW5sb2NrIGluc2lkZSB0aGUgZHJpdmVyIGl0
IGlzIG9idmlvdXMgdGhhdCB5b3UgCj4+PiBuZWVkIHRvIGJlIGNhcmVmdWwgbm90IHRvIHRha2Ug
bG9ja3MgaW4gZGlmZmVyZW50IG9yZGVycy4KPj4+Cj4+Pj4+IFdoYXQgd2UgY291bGQgZG8gaXMg
dG8gYWRkIGEgcGluIGNvdW50IHRvIHRoZSBETUEtYnVmIGFuZCB0aGVuIGRvIAo+Pj4+PiBXQVJO
X09OKGRtYV9idWYtPnBpbl9jb3VudCB8fCBkbWFfcmVzdl9sb2NrX2hlbHAoZG1hX2J1Zi0+cmVz
dikpIAo+Pj4+PiBpbiB0aGUgdm1hcC92dW5tYXAgY2FsbHMuCj4+Pj4KPj4+PiBNb3N0IG9mIHRo
ZSB2bWFwIGNvZGUgaXMgZWl0aGVyIENNQSBvciBTSE1FTSBHRU0gc3R1ZmYuIFRoZXkgZG9uJ3Qg
Cj4+Pj4gbmVlZCB0byBwaW4uIEl0J3MganVzdCBiYWdnYWdlIHRvIHRoZW0uIFRoZSBUVE0gc3R1
ZmYgdGhhdCBkb2VzIAo+Pj4+IG5lZWQgcGlubmluZyBpcyB0aGUgbWlub3JpdHkuCj4+Pj4KPj4+
Pj4KPj4+Pj4+Cj4+Pj4+PiBJIGRpZCBzb21lIGNvbnZlcnNpb24gb2YgZHJpdmVycyB0aGF0IHVz
ZSB2cmFtIGFuZCBzaG1lbS4gVGhleSAKPj4+Pj4+IG9jY2FzaW9uYWxseSB1cGRhdGUgYSBidWZm
ZXIgKGFzdCBjdXJzb3JzKSBvciBmbHVzaCBhIEJPIGZyb20gCj4+Pj4+PiBzeXN0ZW0gbWVtb3J5
IHRvIEhXICh1ZGwsIGNpcnJ1cywgbWdhZzIwMCkuIEluIHRlcm1zIG9mIHRoZXNlIDMgCj4+Pj4+
PiBpbnRlcmZhY2VzOiBJIG5ldmVyIG5lZWRlZCBkbWFfYnVmX3ZtYXAoKSBiZWNhdXNlIHBpbm5p
bmcgd2FzIAo+Pj4+Pj4gbmV2ZXIgcmVhbGx5IHJlcXVpcmVkIGhlcmUuIEFsbW9zdCBhbGwgb2Yg
dGhlIGNhc2VzIHdlcmUgaGFuZGxlZCAKPj4+Pj4+IGJ5IGRtYV9idWZfdm1hcF9sb2NhbCgpLiBB
bmQgdGhlIGFzdCBjdXJzb3IgY29kZSB1c2VzIHRoZSAKPj4+Pj4+IGVxdWl2YWxlbnQgb2YgZG1h
X2J1Zl92bWFwX2xvY2tlZCgpLgo+Pj4+Pgo+Pj4+PiBZZWFoLCB0aGF0IGlzIGtpbmQgb2YgZXhw
ZWN0ZWQuIEkgd2FzIGFscmVhZHkgd29uZGVyaW5nIGFzIHdlbGwgCj4+Pj4+IHdoeSB3ZSBkaWRu
J3QgdXNlZCB0aGUgcmVzZXJ2YXRpb24gbG9jayBtb3JlIGV4dGVuc2l2ZWx5Lgo+Pj4+Cj4+Pj4g
QXMgYSBzaWRlIG5vdGUsIEkgZm91bmQgb25seSA2IHRyaXZpYWwgaW1wbGVtZW50YXRpb25zIG9m
IHZtYXAgCj4+Pj4gb3V0c2lkZSBvZiBkcml2ZXJzL2dwdS9kcm0uIEkgY2Fubm90IGZpbmQgYSBz
aW5nbGUgaW1wbGVtZW50YXRpb24gCj4+Pj4gb2YgcGluIHRoZXJlLiDCoFdoYXQgYW0gSSBtaXNz
aW5nPwo+Pj4KPj4+IEFtZGdwdSBpcyB0aGUgb25seSBvbmUgY3VycmVudGx5IGltcGxlbWVudGlu
ZyB0aGUgbmV3IGludGVyZmFjZS4gU28gCj4+PiBmYXIgd2UgZGlkbid0IGhhZCB0aGUgdGltZSBu
b3IgdGhlIG5lZWQgdG8gY29ycmVjdGx5IG1vdmUgdGhlIAo+Pj4gbG9ja2luZyBpbnRvIHRoZSBj
YWxsaW5nIGRyaXZlcnMuCj4+Pgo+Pj4gVGhhdCdzIHdoYXQgdGhlIHdob2xlIGR5bmFtaWMgRE1B
LWJ1ZiBwYXRjaGVzIHdoZXJlIGFsbCBhYm91dC4KPj4KPj4gVGhhbmtzIGZvciB0aGUgcG9pbnRl
ci4KPgo+IFRoYXQgd2FzIG5vdCBhIHNuYXJreSBjb21tZW50LCBhbHRob3VnaCBpdCBtaWdodCBz
b3VuZCBsaWtlIG9uZS4gSSAKPiBmb3VuZCB0aGUgc2VyaWVzIGluIG15IGluYm94LiA6KQoKSXQg
d2Fzbid0IHJlY29nbml6ZWQgYXMgc3VjaC4gQW5kIGp1c3QgdG8gYmUgY2xlYXIgeW91ciB3b3Jr
IGhlcmUgaXMgCmV4dHJlbWVseSB3ZWxjb21lZC4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiBC
ZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPgo+Pgo+PiBCZXN0IHJlZ2FyZHMKPj4gVGhvbWFzCj4+Cj4+
Pgo+Pj4gUmVnYXJkcywKPj4+IENocmlzdGlhbi4KPj4+Cj4+Pj4KPj4+PiBCZXN0IHJlZ2FyZHMK
Pj4+PiBUaG9tYXMKPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKPj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
