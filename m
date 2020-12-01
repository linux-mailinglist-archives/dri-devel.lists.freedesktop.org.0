Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C1B2CA24E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 13:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C876F89FF7;
	Tue,  1 Dec 2020 12:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A989589F0B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:14:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSjtTCDk7HuAQS3J+sFO32RH8VxyduybYWmnIFWDvazE/lcES0+Hac3Vg2ctIhsihdg3jbdsIrtMW0niY6bNdY5khF58iSL/OoQSPAGFiIOUvCfSx8IbvMCwRxml5ZXpQRrMDv8qkyBDlx5AJGT0+oEt3Kzt8S5wp9OzANrnYC9iaqbb8TJnnFqnRFQ4cXTNsJS70gzvAunV+Q20rm7ZYoNzc4/UQ66ibUGXxQARJNi8mNcefwAbRrl7blHthQjIC9BMKtcMG+pX4UrVNni0EqQwhYARGOQ3UEIn1oL7lRz8JPYDGu9AcKFmE6ZdNCwMQ/664LdTI7INFstt2KAmOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoRo20EKoxr9GyiUmNlmBikkABpxb8N4krjE9TV24N0=;
 b=Em5PY20+KVliVpyZlPkTDlsf+QZnPIDB3OmBKPft95BKpe9MxSgrA2GUtkJIjO6qgEWan5ji7kNH4n7Ng38EkjYBlJvowqk1vpJ/h0h79WoxbUC6ytPYhdbS1wY7o/M23hgpxNLkapehKpETtZJWSGi7gARuIcc0oEjnmUmz6jKUvD0efmiaK7aEZR98K5zWW1Xv9fuIWLIJAwcc9rYm71pxnm9w6dVCqPHk97UI8KhpdtOnSaMfI3lBwXOA2ndiT4bxHo+A07b481ULWtfW5107+lI4kjKa+t5yAzN3bG3Wyu3I5wpIo4rRXHwO28Y4oXyDMlX5ULE44VCU1yO2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoRo20EKoxr9GyiUmNlmBikkABpxb8N4krjE9TV24N0=;
 b=c5Yj0gyqnEq4iX95W1BL0Lb/Z4jhWZI5ClqSOewHjyLzo1IV+C7zccXIIcRk7U+0kc+serunJepZAefD+x+dsf1RpD8jhooTi+OGrwwbm4EvKfGDwGq46HAeYGjC3ru6Z8JAZjiovbneAILDJFKHnLrZk9arul7S0lQiHGIZr8U=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4318.namprd12.prod.outlook.com (2603:10b6:208:1d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 1 Dec
 2020 12:14:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 12:14:40 +0000
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <aa3c4ad6-f99e-de48-e797-0748c9706e9e@amd.com>
Date: Tue, 1 Dec 2020 13:14:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <0e31f447-4195-77fe-a68d-97b96f46f327@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0302CA0020.eurprd03.prod.outlook.com
 (2603:10a6:205:2::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0302CA0020.eurprd03.prod.outlook.com (2603:10a6:205:2::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 1 Dec 2020 12:14:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a9d89641-6205-4a48-b1a6-08d895f2add5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4318:
X-Microsoft-Antispam-PRVS: <MN2PR12MB431816E791357C84347F707A83F40@MN2PR12MB4318.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ifILQeRDxA8oS+vz3kzanCdvRCeFDOo+sTXyOPFQXhX7eQwnLpZLZ4zybYqCHH4ivuzq+AaZE02y/1WiexsgmXOAcxARV7vxBaeQP1B0CGEov1b/V/9oZP+Y5/qkjP151j0YpgEQ2b7LpW6h8dLeXSvVMNs3H+or0f3Hefx0hFX2xR2xUnIZi61alkjv9Ktsx0NEi2T1oHmVBoTsK6AaLI9jkfDX+AuRaqPVtgSam0diOYwi4MYhReFLTR4r/pQEt2fxn1TLYK7yTPQmSxvJ9aAaO8//orT9HG5qAUorlqAUuIloWiVWym1JZ7n8BG/ivaZDIZLXII1WbvIt9Z01bv3QKaqjCPwEPddKJsdcyzqqAJwDnJmzEb1hGbXA/enENf7FlyYOt3s8Qrd4HGHwsoQxAl8gOzcVabuSvNgzUw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(6666004)(5660300002)(2906002)(31686004)(66556008)(66946007)(4326008)(66476007)(2616005)(8936002)(16526019)(83380400001)(186003)(478600001)(966005)(8676002)(31696002)(66574015)(316002)(52116002)(36756003)(6486002)(54906003)(110136005)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bEQxVHpNdkd1dTc3VmcwSDMvQWVBUG9lcWhnb0s3UFNoSTZDbDJTY0hRbW5y?=
 =?utf-8?B?cm1iUm00aTNBcGNRQVVNVXhlbkhsKzd6a2s4aEk3NE84M3UxUHFnSUM0bG9U?=
 =?utf-8?B?WGVNcit3VXlkamtIWVI0KzVjVStGRTZacG1hajN5U1R2ZDE1SFZPUUF3eWxH?=
 =?utf-8?B?WktEZlZ1ZGMvMGJvd05Fd1BVam11V01ta3BrRVNqaWNJOE5mK2lJcnpqcVN1?=
 =?utf-8?B?ZnV3ZEhUU09wQnN1akI5WXBwN1hYWVVpMG1Jb2xkc0VXandLdTZPdFQxRldQ?=
 =?utf-8?B?UENtVVN5ZStPWjl1N0srSXZxK2o0azR6dTAvanJWMjdaK0lrNVRoZGt1Zlh2?=
 =?utf-8?B?VW5VemJERDZRTG1lREVrY2ZzSlIyUEx6WWdwSEZWOFF4dkpNSnY5V1BJVjdH?=
 =?utf-8?B?NC82enA2WEFIVStVZklTNFNtSzc4YUF3eCtEcEV6YWhNaDZNa0FWY1V1Y0ha?=
 =?utf-8?B?ZEdlQm5iMisrQ01kTFBvSmxaMGhuSDh6ekhPMWgvWk0yOVNCMDVmYjF2U2Mx?=
 =?utf-8?B?U1ZsVzgrR291SjVTTU8rWEVQZXdNRVBVQk52aXJuS29TUXdJZkxZS1pXTHNM?=
 =?utf-8?B?Ukdyb3VzNFNBQWZFSVhyMjNYYUw5bmNOMklhQkRkVUNxUXJ1UE1uWTNHV2JZ?=
 =?utf-8?B?UGJ3eXFpWUhaK0p2WmJUQ2E5bWFsUzZHTmRKeEtIRCsvRW82cWZjdkxUM2dX?=
 =?utf-8?B?ZUJpT2ZTZFA4TGd6OTJwME5xT0RneWxINFpsS20zNFphSzREVTdHRUR1ZFlt?=
 =?utf-8?B?N1cxbFFiNjQyN09zNTVVVWxVSll2RUFIdlp5ZWNJN2FkaVV1aWN0a3lxRHEv?=
 =?utf-8?B?ZUV0Yk1iZzlxQmMvYmNyaEZyWUxTQ1RQVExaOHFlZ1hLWVQ4NlF6Y0dERG1X?=
 =?utf-8?B?ZnVZQkhRaTh3dm1yL1VoeXp3b1FsMzRVQlpNQkxFMjN6Y0NLaXZaNHZKZkkw?=
 =?utf-8?B?aEpibGpkUEVJWlVPdTQwTWgwMVAwYUNHNWxXUzMrNkpwS1lqa240MWw3OUpP?=
 =?utf-8?B?WGx6RVZoT01LbG1aazZTQ3hNWUhNVWpOd0FzKzlZSTkyMTVtSjdYRW1wc3pq?=
 =?utf-8?B?MVhXcUx0eG50N2xSY1I0ckpvTWcrajZ0U0Fab3JrSkNUUFJHN1g1OEF5NUIy?=
 =?utf-8?B?TWdoM1kzd1NWc1NnaE9xaGhiUXhBRWRrdkFyUENsOEMzcUszYlpVTnNhaldJ?=
 =?utf-8?B?cytxYzNVUXowNmpHOWdWMWxxSU53NXZtZkd6WXBDNnozaE9icWordFJLTFpB?=
 =?utf-8?B?ZEdhbHI3OGdsOGExSG5VSHJoa0pLbUFNQXZkTXFSS1l5eTlZTlFyZ0NmMWIr?=
 =?utf-8?B?WEFmZlNwY3lxQ3R1SFkvT2ZQVjlNMlRrTWM0eFpyWllaZ3o5bVRuSWV5SEc2?=
 =?utf-8?B?QStwVEROREZIenZ2RXRrcUcxTEhNMmkyVTdYWER1cGpXQS9IcW8rSTRWbjBn?=
 =?utf-8?Q?kW0EybUJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d89641-6205-4a48-b1a6-08d895f2add5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 12:14:40.6191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98h4BfIpZmVBrV91YWqQ/9Zm8ut5IONgo6y3IFm4j1jmFps3FqdYRK1F4D7R7LZZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4318
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

QW0gMDEuMTIuMjAgdW0gMTI6MzAgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaQo+Cj4g
QW0gMDEuMTIuMjAgdW0gMTE6MzQgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+Pj4gWy4uLl0K
Pj4+IEluIHBhdGNoIDYgb2YgdGhpcyBzZXJpZXMsIHRoZXJlJ3MgYXN0IGN1cnNvciBjb2RlIHRo
YXQgYWNxdWlyZXMgdHdvIAo+Pj4gQk8ncyByZXNlcnZhdGlvbiBsb2NrcyBhbmQgdm1hcHMgdGhl
bSBhZnRlcndhcmRzLiBUaGF0J3MgcHJvYmFibHkgCj4+PiBob3cgeW91IGludGVuZCB0byB1c2Ug
ZG1hX2J1Zl92bWFwX2xvY2FsLgo+Pj4KPj4+IEhvd2V2ZXIsIEkgdGhpbmsgaXQncyBtb3JlIGxv
Z2ljYWxseSB0byBoYXZlIGEgdm1hcCBjYWxsYmFjayB0aGF0IAo+Pj4gb25seSBkb2VzIHRoZSBh
Y3R1YWwgdm1hcC4gVGhpcyBpcyBhbGwgdGhhdCBleHBvcnRlcnMgd291bGQgaGF2ZSB0byAKPj4+
IGltcGxlbWVudC4KPj4+Cj4+PiBBbmQgd2l0aCB0aGF0LCBidWlsZCBvbmUgaGVscGVyIHRoYXQg
cGlucyBiZWZvcmUgdm1hcCBhbmQgb25lIGhlbHBlciAKPj4+IHRoYXQgZ2V0cyB0aGUgcmVzdiBs
b2NrLgo+Pgo+PiBJIGRvbid0IHRoaW5rIHRoYXQgdGhpcyBpcyB3aWxsIHdvcmsgbm9yIGlzIGl0
IGEgZ29vZCBhcHByb2FjaC4KPj4KPj4gU2VlIHRoZSBhc3QgY3Vyc29yIGhhbmRsaW5nIGZvciBl
eGFtcGxlLiBZb3UgbmVlZCB0byBhY3F1aXJlIHR3byBCT3MgCj4+IGhlcmUsIG5vdCBqdXN0IG9u
ZS4gQW5kIHRoaXMgY2FuJ3QgYmUgZG9uZSBjbGVhbmx5IHdpdGggYSBzaW5nbGUgdm1hcCAKPj4g
Y2FsbC4KPgo+IFRoYXQgc2VlbXMgdG8gYmUgYSBtaXN1bmRlcnN0YW5kaW5nLgo+Cj4gSSBkb24n
dCBtZW50aW9uZWQgaXQgZXhwbGljaXRseSwgYnV0IHRoZXJlJ3Mgb2YgY291cnNlIGFub3RoZXIg
aGVscGVyIAo+IHRoYXQgb25seSB2bWFwcyBhbmQgbm90aGluZyBlbHNlLiBUaGlzIHdvdWxkIGJl
IHVzZWZ1bCBmb3IgY2FzZXMgbGlrZSAKPiB0aGUgY3Vyc29yIGNvZGUuIFNvIHRoZXJlIHdvdWxk
IGJlOgo+Cj4gwqBkbWFfYnVmX3ZtYXAoKSAtIHBpbiArIHZtYXAKPiDCoGRtYV9idWZfdm1hcF9s
b2NhbCgpIC0gbG9jayArIHZtYXAKPiDCoGRtYV9idWZfdm1hcF9sb2NrZWQoKSAtIG9ubHkgdm1h
cDsgY2FsbGVyIGhhcyBzZXQgdXAgdGhlIEJPcwoKV2VsbCB0aGF0IHpvbyBvZiBoZWxwZXJzIHdp
bGwgY2VydGFpbmx5IGdldCBhIE5BSyBmcm9tIG15IHNpZGUuCgpTZWUgaW50ZXJmYWNlcyBsaWtl
IHRoaXMgc2hvdWxkIGltcGxlbWVudCBzaW1wbGUgZnVuY3Rpb25zIGFuZCBub3QgaGlkZSAKd2hh
dCdzIGFjdHVhbGx5IG5lZWRzIHRvIGJlIGRvbmUgaW5zaWRlIHRoZSBkcml2ZXJzIHVzaW5nIHRo
aXMgaW50ZXJmYWNlLgoKV2hhdCB3ZSBjb3VsZCBkbyBpcyB0byBhZGQgYSBwaW4gY291bnQgdG8g
dGhlIERNQS1idWYgYW5kIHRoZW4gZG8gCldBUk5fT04oZG1hX2J1Zi0+cGluX2NvdW50IHx8IGRt
YV9yZXN2X2xvY2tfaGVscChkbWFfYnVmLT5yZXN2KSkgaW4gdGhlIAp2bWFwL3Z1bm1hcCBjYWxs
cy4KCj4KPiBJIGRpZCBzb21lIGNvbnZlcnNpb24gb2YgZHJpdmVycyB0aGF0IHVzZSB2cmFtIGFu
ZCBzaG1lbS4gVGhleSAKPiBvY2Nhc2lvbmFsbHkgdXBkYXRlIGEgYnVmZmVyIChhc3QgY3Vyc29y
cykgb3IgZmx1c2ggYSBCTyBmcm9tIHN5c3RlbSAKPiBtZW1vcnkgdG8gSFcgKHVkbCwgY2lycnVz
LCBtZ2FnMjAwKS4gSW4gdGVybXMgb2YgdGhlc2UgMyBpbnRlcmZhY2VzOiBJIAo+IG5ldmVyIG5l
ZWRlZCBkbWFfYnVmX3ZtYXAoKSBiZWNhdXNlIHBpbm5pbmcgd2FzIG5ldmVyIHJlYWxseSByZXF1
aXJlZCAKPiBoZXJlLiBBbG1vc3QgYWxsIG9mIHRoZSBjYXNlcyB3ZXJlIGhhbmRsZWQgYnkgZG1h
X2J1Zl92bWFwX2xvY2FsKCkuIAo+IEFuZCB0aGUgYXN0IGN1cnNvciBjb2RlIHVzZXMgdGhlIGVx
dWl2YWxlbnQgb2YgZG1hX2J1Zl92bWFwX2xvY2tlZCgpLgoKWWVhaCwgdGhhdCBpcyBraW5kIG9m
IGV4cGVjdGVkLiBJIHdhcyBhbHJlYWR5IHdvbmRlcmluZyBhcyB3ZWxsIHdoeSB3ZSAKZGlkbid0
IHVzZWQgdGhlIHJlc2VydmF0aW9uIGxvY2sgbW9yZSBleHRlbnNpdmVseS4KClJlZ2FyZHMsCkNo
cmlzdGlhbi4KCj4KPiBUaGUgZHJpdmVyIGV4cG9ydGluZyB0aGUgYnVmZmVyIHdvdWxkIG9ubHkg
aGF2ZSB0byBpbXBsZW1lbnQgdm1hcCgpIAo+IGFuZCDCoHBpbigpIGludGVyZmFjZXMuIEVhY2gg
ZG9lcyBvbmx5IGl0cyBvbmUgdGhpbmcgYW5kIHdvdWxkIGFzc3VtZSAKPiB0aGF0IHRoZSBjYWxs
ZXIgaG9sZHMgdGhlIGxvY2suCj4KPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPgo+Pgo+PiBSZWdh
cmRzLAo+PiBDaHJpc3RpYW4uCj4+Cj4+Pgo+Pj4gSSBrbm93IHRoYXQgaXQgbWlnaHQgcmVxdWly
ZSBzb21lIHdvcmsgb24gZXhwb3J0aW5nIGRyaXZlcnMuIEJ1dCAKPj4+IHdpdGggeW91ciBwcm9w
b3NhbCwgd2UgcHJvYmFibHkgbmVlZCBhbm90aGVyIGRtYS1idWYgY2FsbGJhY2sganVzdCAKPj4+
IGZvciB2bWFwX2xvY2FsLiAoPykgVGhhdCBzZWVtcyBldmVuIGxlc3MgYXBwZWFsaW5nIHRvIG1l
Lgo+Pj4KPj4+IEJlc3QgcmVnYXJkcwo+Pj4gVGhvbWFzCj4+Pgo+Pj4+Cj4+Pj4gVHJ5aW5nIHRv
IHNob3ZlbCBib3RoIHNlbWFudGljcyBpbnRvIG9uZSBpbnRlcmZhY2UsIGRlcGVuZGluZyB1cG9u
Cj4+Pj4gd2hpY2ggaW1wbGVtZW50YXRpb24gd2UgaGF2ZSBiYWNraW5nIHRoZSBidWZmZXIsIGRv
ZXNuJ3Qgd29yayBpbmRlZWQuCj4+Pj4KPj4+PiBBbHNvIG9uIHRoZSBwaW4gdG9waWMsIEkgdGhp
bmsgbmVpdGhlciBpbnRlcmZhY2Ugc2hvdWxkIHJlcXVpcmUKPj4+PiBjYWxsZXJzIHRvIGV4cGxp
Y2l0bHkgcGluIGFueXRoaW5nLiBGb3IgZXhpc3RpbmcgdXNlcnMgaXQgc2hvdWxkCj4+Pj4gaGFw
cGVuIGF1dG9tYXRpY2FsbHkgYmVoaW5kIHRoZSBzY2VuZXMgaW1vLCB0aGF0J3Mgd2hhdCB0aGV5
J3JlCj4+Pj4gZXhwZWN0aW5nLgo+Pj4+IC1EYW5pZWwKPj4+Pgo+Pj4+Cj4+Pj4+PiBJIHRoaW5r
IHdlIGNvdWxkIHVzZSB3aGF0IHdlJ3ZlIGRvbmUgZm9yIGR5bmFtaWMgZG1hLWJ1ZiBhdHRhY2ht
ZW50Cj4+Pj4+PiAod2hpY2ggYWxzbyBjaGFuZ2UgbG9ja2luZyBydWxlcykgYW5kIGp1c3QgaGF2
ZSBuZXcgZnVuY3Rpb25zIGZvciAKPj4+Pj4+IHRoZQo+Pj4+Pj4gbmV3IHdheSAoaS5lLiBzaG9y
dCB0ZXJtIHZtYXAgcHJvdGVjdGVkIGJ5IGRtYV9yZXN2IGxvY2suIE1heWJlIGNhbGwKPj4+Pj4+
IHRoZXNlIGRtYV9idWZfdm1hcF9sb2NhbCwgaW4gdGhlIHNwaXJpdCBvZiB0aGUgbmV3IGttYXBf
bG9jYWwgd2hpY2gKPj4+Pj4+IGFyZSBjdXJyZW50bHkgdW5kZXIgZGlzY3Vzc2lvbi4gSSB0aGlu
ayBfbG9jYWwgc3VmZml4IGlzIGJldHRlciwgZm9yCj4+Pj4+PiBvdGhlcndpc2UgcGVvcGxlIG1p
Z2h0IGRvIHNvbWV0aGluZyBzaWxseSBsaWtlCj4+Pj4+Pgo+Pj4+Pj4gwqDCoMKgwqDCoCBkbWFf
cmVzdl9sb2NrKCk7Cj4+Pj4+PiDCoMKgwqDCoMKgIGRtYV9idWZfdm1hcF9sb2NrZWQoKTsKPj4+
Pj4+IMKgwqDCoMKgwqAgZG1hX3Jlc3ZfdW5sb2NrKCk7Cj4+Pj4+Pgo+Pj4+Pj4gwqDCoMKgwqDC
oCAvKiBhY3R1YWwgYWNjZXNzIG1heWJlIGV2ZW4gaW4gc29tZSBvdGhlciB0aHJlYWQgKi8KPj4+
Pj4+Cj4+Pj4+PiDCoMKgwqDCoCBkbWFfYnVmX3Jlc3ZfbG9jaygpOwo+Pj4+Pj4gwqDCoMKgwqAg
ZG1hX2J1Zl92dW5tYXBfdW5sb2NrZWQoKTsKPj4+Pj4+IMKgwqDCoMKgIGRtYV9yZXN2X3VubG9j
aygpOwo+Pj4+Pj4KPj4+Pj4+IF9sb2NhbCBzdWZmaXggaXMgYmV0dGVyIGF0IHRlbGxpbmcgdGhh
dCB0aGUgcmVzdWx0aW5nIHBvaW50ZXIgaGFzIAo+Pj4+Pj4gdmVyeQo+Pj4+Pj4gbGltaXRlZCB1
c2UgKGVzc2VudGlhbGx5IGp1c3QgbG9jYWwgdG8gdGhlIGNhbGxpbmcgY29udGV4dCwgaWYgeW91
Cj4+Pj4+PiBkb24ndCBjaGFuZ2UgYW55IGxvY2tpbmcgb3IgYW55dGhpbmcpLgo+Pj4+Pgo+Pj4+
PiBfbG9jYWwgc291bmRzIGdvb2QuCj4+Pj4+Cj4+Pj4+IEJlc3QgcmVnYXJkcwo+Pj4+PiBUaG9t
YXMKPj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBJIHRoaW5rIGVuY291cmFnaW5nIGltcG9ydGVycyB0byBj
YWxsIGRtYV9idWZfcGluL3VucGluIGlzbid0IGEgZ29vZAo+Pj4+Pj4gaWRlYS4gWWVzIGR5bmFt
aWMgb25lcyBuZWVkIGl0LCBidXQgbWF5YmUgd2Ugc2hvdWxkIGNoZWNrIGZvciB0aGF0Cj4+Pj4+
PiBzb21laG93IGluIHRoZSBleHBvcnRlcmQgaW50ZXJmYWNlIChhdG0gb25seSBhbWRncHUgaXMg
dXNpbmcgaXQpLgo+Pj4+Pj4gLURhbmllbAo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4KPj4+
Pj4+Cj4+Pj4+Pj4gQmVzdCByZWdhcmRzCj4+Pj4+Pj4gVGhvbWFzCj4+Pj4+Pj4KPj4+Pj4+Pgo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiBDaGVlcnMsCj4+Pj4+Pj4+IENocmlzdGlhbi4KPj4+Pj4+Pj4KPj4+
Pj4+Pj4+Cj4+Pj4+Pj4+PiBUaGF0J3Mgd2hhdCBJIG1lYW50IHdpdGggdGhhdCB0aGlzIGFwcHJv
YWNoIGhlcmUgaXMgdmVyeSAKPj4+Pj4+Pj4+IHNwcmF3bGluZyA6LS8KPj4+Pj4+Pj4+IC1EYW5p
ZWwKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gwqDCoMKgwqAgKi8KPj4+Pj4+Pj4+PiDCoMKgwqAgaW50
IGRybV9nZW1fZG1hYnVmX3ZtYXAoc3RydWN0IGRtYV9idWYgKmRtYV9idWYsIHN0cnVjdCAKPj4+
Pj4+Pj4+PiBkbWFfYnVmX21hcAo+Pj4+Pj4+Pj4+ICptYXApCj4+Pj4+Pj4+Pj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV9nZW0uaCBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaAo+Pj4+Pj4+
Pj4+IGluZGV4IDVlNmRhYTFjOTgyZi4uN2MzNGNkNWVjMjYxIDEwMDY0NAo+Pj4+Pj4+Pj4+IC0t
LSBhL2luY2x1ZGUvZHJtL2RybV9nZW0uaAo+Pj4+Pj4+Pj4+ICsrKyBiL2luY2x1ZGUvZHJtL2Ry
bV9nZW0uaAo+Pj4+Pj4+Pj4+IEBAIC0xMzcsNyArMTM3LDIxIEBAIHN0cnVjdCBkcm1fZ2VtX29i
amVjdF9mdW5jcyB7Cj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAqIFJldHVybnMgYSB2aXJ0
dWFsIGFkZHJlc3MgZm9yIHRoZSBidWZmZXIuIFVzZWQgYnkgdGhlCj4+Pj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoCAqIGRybV9nZW1fZG1hYnVmX3ZtYXAoKSBoZWxwZXIuCj4+Pj4+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoCAqCj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgICogTm90ZXMgdG8gaW1wbGVtZW50
b3JzOgo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoCAqCj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgICogLSBJbXBs
ZW1lbnRhdGlvbnMgbXVzdCBleHBlY3QgcGFpcnMgb2YgQHZtYXAgYW5kIAo+Pj4+Pj4+Pj4+IEB2
dW5tYXAgdG8gYmUKPj4+Pj4+Pj4+PiArwqDCoMKgwqAgKsKgwqAgY2FsbGVkIGZyZXF1ZW50bHkg
YW5kIHNob3VsZCBvcHRpbWl6ZSBmb3IgdGhpcyBjYXNlLgo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoCAq
Cj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgICogLSBJbXBsZW1lbmF0aW9ucyBtYXkgZXhwZWN0IHRoZSBj
YWxsZXIgdG8gaG9sZCB0aGUgCj4+Pj4+Pj4+Pj4gR0VNIG9iamVjdCdzCj4+Pj4+Pj4+Pj4gK8Kg
wqDCoMKgICrCoMKgIHJlc2VydmF0aW9uIGxvY2sgdG8gcHJvdGVjdCBhZ2FpbnN0IGNvbmN1cnJl
bnQgCj4+Pj4+Pj4+Pj4gY2FsbHMgYW5kCj4+Pj4+Pj4+Pj4gcmVsb2NhdGlvbgo+Pj4+Pj4+Pj4+
ICvCoMKgwqDCoCAqwqDCoCBvZiB0aGUgR0VNIG9iamVjdC4KPj4+Pj4+Pj4+PiArwqDCoMKgwqAg
Kgo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoCAqIC0gSW1wbGVtZW50YXRpb25zIG1heSBwcm92aWRlIGFk
ZGl0aW9uYWwgZ3VhcmFudGVlcyAKPj4+Pj4+Pj4+PiAoZS5nLiwKPj4+Pj4+Pj4+PiB3b3JraW5n
Cj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgICrCoMKgIHdpdGhvdXQgaG9sZGluZyB0aGUgcmVzZXJ2YXRp
b24gbG9jaykuCj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgICoKPj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgICogVGhpcyBjYWxsYmFjayBpcyBvcHRpb25hbC4KPj4+Pj4+Pj4+PiArwqDCoMKgwqAgKgo+
Pj4+Pj4+Pj4+ICvCoMKgwqDCoCAqIFNlZSBhbHNvIGRybV9nZW1fZG1hYnVmX3ZtYXAoKQo+Pj4+
Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBpbnQg
KCp2bWFwKShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IAo+Pj4+Pj4+Pj4+IGRt
YV9idWZfbWFwICptYXApOwo+Pj4+Pj4+Pj4+IEBAIC0xNDgsNiArMTYyLDggQEAgc3RydWN0IGRy
bV9nZW1fb2JqZWN0X2Z1bmNzIHsKPj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgICogZHJtX2dl
bV9kbWFidWZfdnVubWFwKCkgaGVscGVyLgo+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgKgo+
Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgKiBUaGlzIGNhbGxiYWNrIGlzIG9wdGlvbmFsLgo+
Pj4+Pj4+Pj4+ICvCoMKgwqDCoCAqCj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgICogU2VlIGFsc28gQHZt
YXAuCj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDC
oMKgIHZvaWQgKCp2dW5tYXApKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3QgCj4+
Pj4+Pj4+Pj4gZG1hX2J1Zl9tYXAKPj4+Pj4+Pj4+PiAqbWFwKTsKPj4+Pj4+Pj4+PiAtLSAKPj4+
Pj4+Pj4+PiAyLjI5LjIKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+Pj4+PiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4+Pj4+Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+Pj4+
Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKPj4+Pj4+Pgo+Pj4+Pj4+IC0tIAo+Pj4+Pj4+IFRob21hcyBaaW1tZXJtYW5uCj4+Pj4+Pj4g
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcgo+Pj4+Pj4+IFNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSAo+Pj4+Pj4+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2Vy
bWFueQo+Pj4+Pj4+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKPj4+Pj4+PiBHZXNjaMOkZnRz
ZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCj4+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pgo+
Pj4+PiAtLSAKPj4+Pj4gVGhvbWFzIFppbW1lcm1hbm4KPj4+Pj4gR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcgo+Pj4+PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKPj4+Pj4g
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4+Pj4+IChIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykKPj4+Pj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZl
cgo+Pj4+Pgo+Pj4+Cj4+Pj4KPj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
