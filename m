Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F32C81629E6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 16:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1386E32F;
	Tue, 18 Feb 2020 15:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577C16E32C;
 Tue, 18 Feb 2020 15:54:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzMvhTvB8/x1NGkOiGgH7J/AAZGfuv95ASZ0L3o+jeDQANZQj40+3HS/MCKSqgPGK953oMfwIojSgXijDeyXU3Ur6xv4ClSlry4IUt60naM1leiXMc/GTtoi799OnZqT/+zPDq/FhLxDAKB8ZWgVfqV8cu+41yilXkcRDwEE8o5O+b3WNUxyynNZ36TrdIA0PLmfXeKZbiWrLyCinFujXSNd/hOhYHs7qevzgOD0fjF54pBQ99lDo2443C5GURO+3NzBQANA1Ws3GYbZEJmgKuK2HNI6jQ8QdnXqOrAD5wOgP6nN3HHkwTevBXHbLLMW37yS4snuGK9zy6N8e01S1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8eOpU2c6JSInKP485j24Mm1AYt2qjb+2MBnXMvLsPo=;
 b=VOHNT2Y4Zhw9V5sQzROF4VCWo3fHadnWgenKFY3IljyIRcRVov9C4lnp6LuBysLK92YmvRxSTwBFrRElE7Rrk1HEeLcFbbaa093CkBAcTBpO7DJkP0IZRky7qvB9lJE+HqirpmilDT1HRxEZElv5p75jGbxQ3rrOXvPX7lyxX1VbrEKbNZ3lKdUbaZvVPX6MYrU5hTIoV3VRjneP+NPe3cf/njrLzek2//HnBlvMulhx25/Dhl1jo2DzQZpzAGA4hi5FIc6rgZ8G9xelUD6OmPSjW3hXjqRN9XGysK2RU/U6+CUtMFXeRCdAk/gK/FtZrYbC5+QIsKg95x8XFpyR2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8eOpU2c6JSInKP485j24Mm1AYt2qjb+2MBnXMvLsPo=;
 b=TU/o3ZvuKznitCivzyY1K1gw15jcrD0s4q+AQxQiB8vxCmgzuj8zCckU7clFod13hywrGbf1yttFEzDAmSLj6eon77kqMR+xYc2+bIqMV5w2FAriKfXUj2fNkteFwXQpH//dh3gAfixetW5+bz9sTJ6WchmCo5Tf6crYcpNIhhM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB1467.namprd12.prod.outlook.com (10.172.38.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Tue, 18 Feb 2020 15:54:32 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904%4]) with mapi id 15.20.2750.016; Tue, 18 Feb 2020
 15:54:31 +0000
Subject: Re: [PATCH 0/8] do not store GPU address in TTM
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <2775d4d2-ce72-7667-036f-6abe51960b21@suse.de>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <5cded71a-bd19-77d2-fcf4-63c4b3e43ecf@amd.com>
Date: Tue, 18 Feb 2020 16:57:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <2775d4d2-ce72-7667-036f-6abe51960b21@suse.de>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0902CA0021.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::31) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f2c:e900:7512:2832:6401:b174]
 (2003:c5:8f2c:e900:7512:2832:6401:b174) by
 AM4PR0902CA0021.eurprd09.prod.outlook.com (2603:10a6:200:9b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Tue, 18 Feb 2020 15:54:29 +0000
X-Originating-IP: [2003:c5:8f2c:e900:7512:2832:6401:b174]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d7642c53-c255-4af2-345f-08d7b48ad7dd
X-MS-TrafficTypeDiagnostic: DM5PR12MB1467:|DM5PR12MB1467:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB14675C0092C8215430A68FB08B110@DM5PR12MB1467.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 031763BCAF
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(199004)(189003)(186003)(16526019)(316002)(8676002)(2906002)(36756003)(8936002)(53546011)(110136005)(52116002)(31696002)(966005)(31686004)(478600001)(2616005)(66946007)(66556008)(81166006)(7416002)(66476007)(81156014)(4326008)(6486002)(6666004)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1467;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kZ2mgrISYfXXSLqMY/Wqp/8vhuA5Cn3oNL88BGx3WHLvUI6LbfPVFUnFQA7zprIr5csEXV3ezT7weTy76mNZyfTj5dSaE/gXC+Gy9IckHfND9adq7gHSmoinnEtYe15Ar9uYqVg34UN1iqep14/Po7Hz22Q+H0/0ql+FCixG7c6EkkOjb2CMRuCFO9iRYccbAOZZzApjvFET2lrszszmqdgl6fF0+NtYqX2XaKxiYjqiEdk8aO3/soDqV0Fguurl1SD1/zRqR76gmA/0J1naNsMgk1X5VffMdB3RAHrtrsXZ5A/SYK79TTXJQ/wpSSTsYj3e9WMwlEedo94lqP+MjvbmHdjGiPP5A71lFtczg7DsbdjhunZNbLzI9qjpxODWBAXgNrDBYrj3uy5JRiSokAJeU2EiZKXQnoF9l2OTUJ+Zdhbs7GNSTg/0wNgr5V7NkBZFBk7019FHwU5X7u1h5iBqJBIp8pvmxlKRFLt5SKLvI5ETSjxtJ97Iq90cX4lcBKnKBZiXOG9JoAaNAvP19g==
X-MS-Exchange-AntiSpam-MessageData: I92uXmXF6teGjBjDhWousEB9T/XQzfqFC8JuW4CvI3UWvcia5ruH3d6m7zpC5Uh7559TFB0dgwV7UJchCpFz4zNB/7kMBJI/QHKuiCDIqxItNdVgfJJQ34yjdknROeqSpRiSjpiyBhoHGe6XQlSROBZsWcmUmcM12JvC7IYUYnvAn7siTwrgRCv2G1C1WSU0xOEBuyke6RzlD5pRY4/HxQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7642c53-c255-4af2-345f-08d7b48ad7dd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2020 15:54:31.8118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKjmO9fNWnGh/OsFExxEDL1YSEi8AeY9JGCpU5DrPt6U1HVYTc4Z3oYBTcaxLRKuQBgUp4BBLfb8BBalqmH24Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1467
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvMTgvMjAgMTo0MiBQTSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gSGksCj4KPiB0
aGUgZW1haWwncyBzdWJqZWN0IGxpbmUgc2hvdWxkIGNvbnRhaW4gdGhlIHZlcnNpb24gb2YgdGhl
IHBhdGNoc2V0Cj4gKGUuZywgdjIsIHYzLCBldGMpLiBnaXQgc2VuZC1tYWlsIGFkZHMgdGhpcyB3
aXRoIHRoZSAtdiBzd2l0Y2gKClRoYW5rcyBUaG9tYXMuIEkgb3ZlciBsb29rZWQgdGhhdCzCoCB3
aWxsIGFkZCB2ZXJzaW9uIHRhZyBmcm9tIG15IG5leHQgCmVtYWlscy4KCk5pcm1veQoKPgo+IEJl
c3QgcmVnYXJkcwo+IFRob21hcwo+Cj4gQW0gMTcuMDIuMjAgdW0gMTY6MDQgc2NocmllYiBOaXJt
b3kgRGFzOgo+PiBXaXRoIHRoaXMgcGF0Y2ggc2VyaWVzIEkgYW0gdHJ5aW5nIHRvIHJlbW92ZSBH
UFUgYWRkcmVzcyBkZXBlbmRlbmN5IGluCj4+IFRUTSBhbmQgbW92aW5nIEdQVSBhZGRyZXNzIGNh
bGN1bGF0aW9uIHRvIGluZGl2aWR1YWwgZHJtIGRyaXZlcnMuCj4+Cj4+IEkgdGVzdGVkIHRoaXMg
cGF0Y2ggc2VyaWVzIG9uIHF4bCwgYm9jaHMgYW5kIGFtZGdwdS4gQ2hyaXN0aWFuIHRlc3RlZCBp
dCBvbiByYWRlb24gSFcuCj4+IEl0IHdvdWxkIGJlIG5pY2UgaWYgc29tZW9uZSB0ZXN0IHRoaXMg
Zm9yIG5vdXZlYXUgYW5kIHZtZ2Z4Lgo+Pgo+PiBOaXJtb3kgRGFzICg4KToKPj4gICAgZHJtL2Ft
ZGdwdTogbW92ZSB0dG0gYm8tPm9mZnNldCB0byBhbWRncHVfYm8KPj4gICAgZHJtL3JhZGVvbjog
ZG9uJ3QgdXNlIHR0bSBiby0+b2Zmc2V0Cj4+ICAgIGRybS92bXdnZng6IGRvbid0IHVzZSB0dG0g
Ym8tPm9mZnNldAo+PiAgICBkcm0vbm91dmVhdTogZG9uJ3QgdXNlIHR0bSBiby0+b2Zmc2V0Cj4+
ICAgIGRybS9xeGw6IGRvbid0IHVzZSB0dG0gYm8tPm9mZnNldAo+PiAgICBkcm0vdnJhbS1oZWxw
ZXI6IGRvbid0IHVzZSB0dG0gYm8tPm9mZnNldAo+PiAgICBkcm0vYm9jaHM6IHVzZSBkcm1fZ2Vt
X3ZyYW1fb2Zmc2V0IHRvIGdldCBibyBvZmZzZXQKPj4gICAgZHJtL3R0bTogZG8gbm90IGtlZXAg
R1BVIGRlcGVuZGVudCBhZGRyZXNzZXMKPj4KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfb2JqZWN0LmMgIHwgMjIgKysrKysrKysrKysrKystLQo+PiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaCAgfCAgMSArCj4+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jICAgICB8IDI5ICsrKysrKysrKysrKysrKystLS0t
LQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaCAgICAgfCAgMSAr
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jICAgICAgICAgICB8ICAyICst
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyAgICAgICB8ICAyICst
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvY3J0Yy5jICAgICB8ICA2ICsr
LS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvZGlzcC5jICAgICB8ICAy
ICstCj4+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvb3ZlcmxheS5jICB8ICA2
ICsrLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvYmFzZTUwN2MuYyB8
ICAyICstCj4+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY29yZTUwN2QuYyB8
ICAyICstCj4+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvb3ZseTUwN2UuYyB8
ICAyICstCj4+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvd25kdy5jICAgICB8
ICAyICstCj4+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvd25kd2MzN2UuYyB8
ICAyICstCj4+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9hYmkxNi5jICAgICB8
ICA4ICsrKy0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyAgICAg
ICAgfCAgMSArCj4+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5oICAgICAg
ICB8ICAzICsrKwo+PiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY2hhbi5jICAg
ICAgfCAgMiArLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jICAg
ICAgfCAgMiArLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZmJjb24uYyAg
ICAgfCAgMiArLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZ2VtLmMgICAg
ICAgfCAxMCArKystLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmggICAgICAg
ICAgICAgICB8ICA2ICsrLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfa21zLmMgICAg
ICAgICAgICAgICB8ICA1ICsrLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3Qu
aCAgICAgICAgICAgIHwgIDUgLS0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5j
ICAgICAgICAgICAgICAgfCAgOSAtLS0tLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb24uaCAgICAgICAgICAgICB8ICAxICsKPj4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9vYmplY3QuaCAgICAgIHwgMTYgKysrKysrKysrKystCj4+ICAgZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fdHRtLmMgICAgICAgICB8ICA0ICstLQo+PiAgIGRyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMgICAgICAgICAgICAgICAgfCAgNyAtLS0tLQo+PiAgIGRyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2JvLmMgICAgICAgICAgfCAgNCArLS0KPj4gICBkcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9leGVjYnVmLmMgICAgIHwgIDIgKy0KPj4gICBkcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9maWZvLmMgICAgICAgIHwgIDIgKy0KPj4gICBkcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgIHwgIDIgLS0KPj4gICBpbmNsdWRlL2Ry
bS90dG0vdHRtX2JvX2FwaS5oICAgICAgICAgICAgICAgIHwgIDIgLS0KPj4gICBpbmNsdWRlL2Ry
bS90dG0vdHRtX2JvX2RyaXZlci5oICAgICAgICAgICAgIHwgIDEgLQo+PiAgIDM1IGZpbGVzIGNo
YW5nZWQsIDk5IGluc2VydGlvbnMoKyksIDc2IGRlbGV0aW9ucygtKQo+Pgo+PiAtLQo+PiAyLjI1
LjAKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
