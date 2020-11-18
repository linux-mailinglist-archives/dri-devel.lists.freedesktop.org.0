Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6812B8100
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 16:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9626E442;
	Wed, 18 Nov 2020 15:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1081C6E441;
 Wed, 18 Nov 2020 15:43:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xsn3NEA0hSfYKVJQjr8V/8RRuUetQcnA0YRmJ6ZtJXckxqviYCq255vCZr96Ma/1T48BCm76l32K9dV3HrV/jCVB1HHUWYNVQWhV/pF6NxFLOF2l3xV3Trkcm9kEX7Tt5y6kKIdv29PGhkWuZvUZJesaXPK27IA5GqiucSRT73cM9dyxu6kSi42D7kvnVHP1zx19wetU+LHMcYmdxq/0lckud4NNpFjwWYusv8h0LAGKOmCD2c4dUIfGRaxasOrxiqtHUr6Rrl5rkAp7rJ6MzVjorS+8Eh41JBfx+Dhi1Cutq8ktt6v3sMVO7CiAsieubbs8vVfw22T9ZNun3DRt6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r29T0ObSlSINr3L6Y9JRgMme40ri2MOjD8QXTmvn9A=;
 b=MgY3n/m+0iaJmH1WSOQVEKCHVuvGlVtJvZTWdDMSGIEOhCD9pO1TxdISGo14Z7kZHBayH96PkKHfx7Ni0fgsWl04psK/0i4YX63YQ05csNomCKsswlqwtjMyx+9nGtEsTJmVe6Bd5PXv9vYjUIKok+sUleGgToNIcm9bHP4QvpITjwxlvIpwlko3wA0Lzgi1unwS4uTtd+VjdvzEyN0m8v0V/Ljj4hnn5kLX6ZpxqXC7Rv3BTiJyUxdAWm6lRfJHVfzZxhe45H6QuJUU18GYOSTeJ5l/sQvqYPwFirtd3f1fy5KM1bBYxOGawqVcU9sweitS6oMtvq/VRojyvwWZ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r29T0ObSlSINr3L6Y9JRgMme40ri2MOjD8QXTmvn9A=;
 b=Ua+9SnodAhiOWG3F2Utdgsdp1lIFaPYH9oliu7riz/4Lk5bUAO0pivH4l4mSXpcjiEQCccutXuKoOK+Sc1rqgeqysYAX+vgooTQm6uUw4mjQm1brWdE3BXWC5dM5yFoLceHkpm97j+iuD6gzkgXTaKcoP3j77uXbtfgQ+ctc3+g=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB3866.namprd12.prod.outlook.com (2603:10b6:5:1c6::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 15:43:16 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3564.032; Wed, 18 Nov 2020
 15:43:16 +0000
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Prevent any job recoveries after
 device is unplugged.
To: christian.koenig@amd.com, Daniel Vetter <daniel@ffwll.ch>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-9-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095345.GF20149@phenom.ffwll.local>
 <24dd3691-5599-459c-2e5d-a8f2e504ec66@amd.com>
 <20201117185255.GP401619@phenom.ffwll.local>
 <b827fa7a-d89e-d138-d275-60a9f15c128a@amd.com>
 <20201117194922.GW401619@phenom.ffwll.local>
 <064ef461-8f59-2eb8-7777-6ff5b8d28cdd@amd.com>
 <CAKMK7uF9uvT09zDb6fS0j68fWrq2qV7h_JQAt8vpaGPJ1d64cQ@mail.gmail.com>
 <d0a3ee49-64f3-a223-7e84-0c8eb3481f61@gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <5d40ed7d-10f4-a7ab-94a1-8749cd30b3be@amd.com>
Date: Wed, 18 Nov 2020 10:43:13 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
In-Reply-To: <d0a3ee49-64f3-a223-7e84-0c8eb3481f61@gmail.com>
Content-Language: en-CA
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: CH0PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:610:b1::29) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.18.65] (165.204.54.211) by
 CH0PR13CA0024.namprd13.prod.outlook.com (2603:10b6:610:b1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.17 via Frontend Transport; Wed, 18 Nov 2020 15:43:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ae074185-78e2-45d2-593f-08d88bd8aa0d
X-MS-TrafficTypeDiagnostic: DM6PR12MB3866:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB38663CCD51B86E82F55B1C7999E10@DM6PR12MB3866.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h7sBN0kGdkh7fBkLgwBd2ixpiQRMTfiOTZtlZjDPxktHjxd54wf4lrWjPp4zYpw62+uSZRTciM8QuXEP2GUHdxvFJc5YpnjA4K5XCccYzHPH9r0VzY4CVuUyAdqK/sxLDozQZu5w6g1+cBhCPp6hCaASGU1bLRIqn/LnqGaBwNNqut3hi0o5N3JQC0quHOcL2sUov57idOz+fUNnzHOfB9A7WxV3TUWldgRu8hnnaaMPU1+ZCJdZpLo4v04R+1ZVIZrbIBL/A6xyszUmuA9nSfN3f5Y1BwjHweJEudgbd04wiKzAyK4kTxV4Jpx7p2nsvwGh1jgtr0GGKMBtlhtO5m5dMhunkf1dkYk76RIVHN/Lc5junlUG0M2N9/hlmXZj12Uo1Xf4x0wGYC5wZslt12Eh2e/3YdoVvdDxhmNEXlY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(31686004)(186003)(52116002)(45080400002)(26005)(31696002)(16526019)(36756003)(316002)(86362001)(6486002)(5660300002)(4001150100001)(4326008)(6636002)(2906002)(53546011)(66574015)(66556008)(8936002)(54906003)(83380400001)(2616005)(956004)(66946007)(8676002)(16576012)(110136005)(478600001)(66476007)(966005)(44832011)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: CB+tdPHdd+tkISK4FhyRRlfa5k856/AbMZ0QmkDEgwaI+06+d19iUorf3qC2/Guc+UCnsuKn3bfXe8Jgu3qTtqXH6/+dOAutJul/zrHC3PC37Y4LEPm/VPWfiL+aNGvCqFDw2MFtdhN8L3pTqcJDrsjPBMqeCmkyiJFIZTQErRH40XurvVT8GNxD4dqrnGiuTBofnKXh3jBVTzkXbI3owCheJKqN7PnznW889L1z4i0MeDs/igrZ/LJAUIhzMQzvfNjA2hz2YPK2oLlNlg6jjrNElON9wYiR3sWneV8wy0uTWFGYKZGw1jQelcXXPXiwEzfdieNtvudlXoNr76Agl1dROpPzTpaLcb3jsMpDV75ygxtyBJ2LWzz7ZEP2cQnrVEnBYVrXch5POHu6Y8BNg+r07auuga0JIjaOhunP2EMGBM6+RJhuAjJd22bK7StPVHKMyG+6INSZVxPCL7fKwVwAWuXo5Eyt3WmuU+B/F5JfOxIzIoddeNwDCCmQaC27ESY0HAAV+GOBEAFqrisZThw35o9GHqRHFiBmx0AbikNhkfNK0CvZKceGXZS+sDeaX0wfpubKVM3LbqTgIjfX4Tg5SPOxiOJqFwXAaOLg5H68yBMplQkl4KebZpanBdsNhBqxoKnaidco8Eb090IJOQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae074185-78e2-45d2-593f-08d88bd8aa0d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 15:43:15.8941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEZ/eB+5UaEdIEQMHfkRRQchwe3seGK2bTY5ZHn0HCVLUStSRdCx6tzKCrZn1y/M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3866
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
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMS0xOCAwNzowMSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAxOC4xMS4y
MCB1bSAwODozOSBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+IE9uIFR1ZSwgTm92IDE3LCAyMDIw
IGF0IDk6MDcgUE0gQW5kcmV5IEdyb2R6b3Zza3kKPj4gPEFuZHJleS5Hcm9kem92c2t5QGFtZC5j
b20+IHdyb3RlOgo+Pj4KPj4+IE9uIDExLzE3LzIwIDI6NDkgUE0sIERhbmllbCBWZXR0ZXIgd3Jv
dGU6Cj4+Pj4gT24gVHVlLCBOb3YgMTcsIDIwMjAgYXQgMDI6MTg6NDlQTSAtMDUwMCwgQW5kcmV5
IEdyb2R6b3Zza3kgd3JvdGU6Cj4+Pj4+IE9uIDExLzE3LzIwIDE6NTIgUE0sIERhbmllbCBWZXR0
ZXIgd3JvdGU6Cj4+Pj4+PiBPbiBUdWUsIE5vdiAxNywgMjAyMCBhdCAwMTozODoxNFBNIC0wNTAw
LCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4+Pj4+PiBPbiA2LzIyLzIwIDU6NTMgQU0sIERh
bmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4+Pj4+IE9uIFN1biwgSnVuIDIxLCAyMDIwIGF0IDAyOjAz
OjA4QU0gLTA0MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+Pj4+Pj4gTm8gcG9pbnQg
dG8gdHJ5IHJlY292ZXJ5IGlmIGRldmljZSBpcyBnb25lLCBqdXN0IG1lc3NlcyB1cCB0aGluZ3Mu
Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFu
ZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+ICAgICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMTYgKysrKysrKysrKysrKysr
Kwo+Pj4+Pj4+Pj4gICAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMg
fCAgOCArKysrKysrKwo+Pj4+Pj4+Pj4gICAgICAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlv
bnMoKykKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Rydi5jCj4+Pj4+Pj4+PiBpbmRleCA2OTMyZDc1Li41ZDZkM2Q5IDEwMDY0NAo+Pj4+Pj4+Pj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4+Pj4+Pj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPj4+Pj4+Pj4+IEBA
IC0xMTI5LDEyICsxMTI5LDI4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3BjaV9wcm9iZShzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwKPj4+Pj4+Pj4+ICAgICAgICAgICByZXR1cm4gcmV0Owo+Pj4+Pj4+Pj4g
ICAgICB9Cj4+Pj4+Pj4+PiArc3RhdGljIHZvaWQgYW1kZ3B1X2NhbmNlbF9hbGxfdGRyKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQo+Pj4+Pj4+Pj4gK3sKPj4+Pj4+Pj4+ICsgICAgICAgIGlu
dCBpOwo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gKyAgICAgICAgZm9yIChpID0gMDsgaSA8IEFNREdQ
VV9NQVhfUklOR1M7ICsraSkgewo+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICBzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcgPSBhZGV2LT5yaW5nc1tpXTsKPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICsg
ICAgICAgICAgICAgICAgaWYgKCFyaW5nIHx8ICFyaW5nLT5zY2hlZC50aHJlYWQpCj4+Pj4+Pj4+
PiArICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+
PiArICAgICAgICAgICAgICAgIGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmcmluZy0+c2NoZWQu
d29ya190ZHIpOwo+Pj4+Pj4+Pj4gKyAgICAgICAgfQo+Pj4+Pj4+Pj4gK30KPj4+Pj4+Pj4gSSB0
aGluayB0aGlzIGlzIGEgZnVuY3Rpb24gdGhhdCdzIHN1cHBvc2VkIHRvIGJlIGluIGRybS9zY2hl
ZHVsZXIsIG5vdAo+Pj4+Pj4+PiBoZXJlLiBNaWdodCBhbHNvIGp1c3QgYmUgeW91ciBjbGVhbnVw
IGNvZGUgYmVpbmcgb3JkZXJlZCB3cm9uZ2x5LCBvciB5b3VyCj4+Pj4+Pj4+IHNwbGl0IGluIG9u
ZSBvZiB0aGUgZWFybGllciBwYXRjaGVzIG5vdCBkb25lIHF1aXRlIHJpZ2h0Lgo+Pj4+Pj4+PiAt
RGFuaWVsCj4+Pj4+Pj4gVGhpcyBmdW5jdGlvbiBpdGVyYXRlcyBhY3Jvc3MgYWxsIHRoZSBzY2hl
ZHVsZXJzICBwZXIgYW1kZ3B1IGRldmljZSBhbmQgYWNjZXNzZXMKPj4+Pj4+PiBhbWRncHUgc3Bl
Y2lmaWMgc3RydWN0dXJlcyAsIGRybS9zY2hlZHVsZXIgZGVhbHMgd2l0aCBzaW5nbGUgc2NoZWR1
bGVyIGF0IG1vc3QKPj4+Pj4+PiBzbyBsb29rcyB0byBtZSBsaWtlIHRoaXMgaXMgdGhlIHJpZ2h0
IHBsYWNlIGZvciB0aGlzIGZ1bmN0aW9uCj4+Pj4+PiBJIGd1ZXNzIHdlIGNvdWxkIGtlZXAgdHJh
Y2sgb2YgYWxsIHNjaGVkdWxlcnMgc29tZXdoZXJlIGluIGEgbGlzdCBpbgo+Pj4+Pj4gc3RydWN0
IGRybV9kZXZpY2UgYW5kIHdyYXAgdGhpcyB1cC4gVGhhdCB3YXMga2luZGEgdGhlIGlkZWEuCj4+
Pj4+Pgo+Pj4+Pj4gTWluaW1hbGx5IEkgdGhpbmsgYSB0aW55IHdyYXBwZXIgd2l0aCBkb2NzIGZv
ciB0aGUKPj4+Pj4+IGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmc2NoZWQtPndvcmtfdGRyKTsg
d2hpY2ggZXhwbGFpbnMgd2hhdCB5b3UgbXVzdAo+Pj4+Pj4gb2JzZXJ2ZSB0byBtYWtlIHN1cmUg
dGhlcmUncyBubyByYWNlLgo+Pj4+PiBXaWxsIGRvCj4+Pj4+Cj4+Pj4+Cj4+Pj4+PiBJJ20gbm90
IGV4YWN0bHkgc3VyZSB0aGVyZSdzIG5vCj4+Pj4+PiBndWFyYW50ZWUgaGVyZSB3ZSB3b24ndCBn
ZXQgYSBuZXcgdGRyIHdvcmsgbGF1bmNoZWQgcmlnaHQgYWZ0ZXJ3YXJkcyBhdAo+Pj4+Pj4gbGVh
c3QsIHNvIHRoaXMgbG9va3MgYSBiaXQgbGlrZSBhIGhhY2suCj4+Pj4+IE5vdGUgdGhhdCBmb3Ig
YW55IFREUiB3b3JrIGhhcHBlbmluZyBwb3N0IGFtZGdwdV9jYW5jZWxfYWxsX3Rkcgo+Pj4+PiBh
bWRncHVfam9iX3RpbWVkb3V0LT5kcm1fZGV2X2lzX3VucGx1Z2dlZAo+Pj4+PiB3aWxsIHJldHVy
biB0cnVlIGFuZCBzbyBpdCB3aWxsIHJldHVybiBlYXJseS4gVG8gbWFrZSBpdCB3YXRlciBwcm9v
ZiB0aWdodAo+Pj4+PiBhZ2FpbnN0IHJhY2UKPj4+Pj4gaSBjYW4gc3dpdGNoIGZyb20gZHJtX2Rl
dl9pc191bnBsdWdnZWQgdG8gZHJtX2Rldl9lbnRlci9leGl0Cj4+Pj4gSG0gdGhhdCdzIGNvbmZ1
c2luZy4gWW91IGRvIGEgd29ya19jYW5jZWxfc3luYywgc28gdGhhdCBhdCBsZWFzdCBsb29rcwo+
Pj4+IGxpa2UgInRkciB3b3JrIG11c3Qgbm90IHJ1biBhZnRlciB0aGlzIHBvaW50Igo+Pj4+Cj4+
Pj4gSWYgeW91IG9ubHkgcmVseSBvbiBkcm1fZGV2X2VudGVyL2V4aXQgY2hlY2sgd2l0aCB0aGUg
dGRyIHdvcmssIHRoZW4KPj4+PiB0aGVyZSdzIG5vIG5lZWQgdG8gY2FuY2VsIGFueXRoaW5nLgo+
Pj4KPj4+IEFncmVlLCBzeW5jaHJvbml6ZV9zcmN1IGZyb20gZHJtX2Rldl91bnBsdWcgc2hvdWxk
IHBsYXkgdGhlIHJvbGUKPj4+IG9mICdmbHVzaGluZycgYW55IGVhcmxpZXIgKGluIHByb2dyZXNz
KSB0ZHIgd29yayB3aGljaCBpcwo+Pj4gdXNpbmcgZHJtX2Rldl9lbnRlci9leGl0IHBhaXIuIEFu
eSBsYXRlciBhcmlzaW5nIHRkciB3aWxsIHRlcm1pbmF0ZSBlYXJseSB3aGVuCj4+PiBkcm1fZGV2
X2VudGVyCj4+PiByZXR1cm5zIGZhbHNlLgo+PiBOb3BlLCBhbnl0aGluZyB5b3UgcHV0IGludG8g
dGhlIHdvcmsgaXRzZWxmIGNhbm5vdCBjbG9zZSB0aGlzIHJhY2UuCj4+IEl0J3MgdGhlIHNjaGVk
dWxlX3dvcmsgdGhhdCBtYXR0ZXJzIGhlcmUuIE9yIEknbSBtaXNzaW5nIHNvbWV0aGluZyAuLi4K
Pj4gSSB0aG91Z2h0IHRoYXQgdGhlIHRkciB3b3JrIHlvdSdyZSBjYW5jZWxsaW5nIGhlcmUgaXMg
bGF1bmNoZWQgYnkKPj4gZHJtL3NjaGVkdWxlciBjb2RlLCBub3QgYnkgdGhlIGFtZCBjYWxsYmFj
az8KPiAKPiBZZXMgdGhhdCBpcyBjb3JyZWN0LiBDYW5jZWxpbmcgdGhlIHdvcmsgaXRlbSBpcyBu
b3QgdGhlIHJpZ2h0IGFwcHJvYWNoIAo+IGF0IGFsbCwgbm9yIGlzIGFkZGluZyBkZXZfZW50ZXIv
ZXhpdCBwYWlyIGluIHRoZSByZWNvdmVyeSBoYW5kbGVyLgo+IAo+IFdoYXQgd2UgbmVlZCB0byBk
byBoZXJlIGlzIHRvIHN0b3AgdGhlIHNjaGVkdWxlciB0aHJlYWQgYW5kIHRoZW4gd2FpdCAKPiBm
b3IgYW55IHRpbWVvdXQgaGFuZGxpbmcgdG8gaGF2ZSBmaW5pc2hlZC4KPiAKPiBPdGhlcndpc2Ug
aXQgY2FuIHNjaGVkdWxlciBhIG5ldyB0aW1lb3V0IGp1c3QgYWZ0ZXIgd2UgaGF2ZSBjYW5jZWxl
ZCAKPiB0aGlzIG9uZS4KClllcCwgdGhhdCdzIGV4YWN0bHkgd2hhdCBJIHNhaWQgaW4gbXkgZW1h
aWwgYWJvdmUuCgpSZWdhcmRzLApMdWJlbgoKPiAKPiBSZWdhcmRzLAo+IENocmlzdGlhbi4KPiAK
Pj4gLURhbmllbAo+Pgo+Pj4gV2lsbCB1cGRhdGUuCj4+Pgo+Pj4gQW5kcmV5Cj4+Pgo+Pj4KPj4+
PiBGb3IgcmFjZSBmcmVlIGNhbmNlbF93b3JrX3N5bmMgeW91IG5lZWQ6Cj4+Pj4gMS4gbWFrZSBz
dXJlIHdoYXRldmVyIGlzIGNhbGxpbmcgc2NoZWR1bGVfd29yayBpcyBndWFyYW50ZWVkIHRvIG5v
IGxvbmdlcgo+Pj4+IGNhbGwgc2NoZWR1bGVfd29yay4KPj4+PiAyLiBjYWxsIGNhbmNlbF93b3Jr
X3N5bmMKPj4+Pgo+Pj4+IEFueXRoaW5nIGVsc2UgaXMgY2FyZ28tY3VsdGVkIHdvcmsgY2xlYW51
cDoKPj4+Pgo+Pj4+IC0gMS4gd2l0aG91dCAyLiBtZWFucyBpZiBhIHdvcmsgZ290IHNjaGVkdWxl
ZCByaWdodCBiZWZvcmUgaXQnbGwgc3RpbGwgYmUKPj4+PiAgICAgYSBwcm9ibGVtLgo+Pj4+IC0g
Mi4gd2l0aG91dCAxLiBtZWFucyBhIHNjaGVkdWxlX3dvcmsgcmlnaHQgYWZ0ZXIgbWFrZXMgeW91
IGNhbGxpbmcKPj4+PiAgICAgY2FuY2VsX3dvcmtfc3luYyBwb2ludGxlc3MuCj4+Pj4KPj4+PiBT
byBlaXRoZXIgYm90aCBvciBub3RoaW5nLgo+Pj4+IC1EYW5pZWwKPj4+Pgo+Pj4+PiBBbmRyZXkK
Pj4+Pj4KPj4+Pj4KPj4+Pj4+IC1EYW5pZWwKPj4+Pj4+Cj4+Pj4+Pj4gQW5kcmV5Cj4+Pj4+Pj4K
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gICAgICBzdGF0aWMgdm9pZAo+Pj4+Pj4+Pj4g
ICAgICBhbWRncHVfcGNpX3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKPj4+Pj4+Pj4+ICAg
ICAgewo+Pj4+Pj4+Pj4gICAgICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwY2lfZ2V0
X2RydmRhdGEocGRldik7Cj4+Pj4+Pj4+PiArICAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiA9IGRldi0+ZGV2X3ByaXZhdGU7Cj4+Pj4+Pj4+PiAgICAgICAgICAgZHJtX2Rldl91bnBs
dWcoZGV2KTsKPj4+Pj4+Pj4+ICsgICAgICAgIGFtZGdwdV9jYW5jZWxfYWxsX3RkcihhZGV2KTsK
Pj4+Pj4+Pj4+ICAgICAgICAgICB0dG1fYm9fdW5tYXBfdmlydHVhbF9hZGRyZXNzX3NwYWNlKCZh
ZGV2LT5tbWFuLmJkZXYpOwo+Pj4+Pj4+Pj4gICAgICAgICAgIGFtZGdwdV9kcml2ZXJfdW5sb2Fk
X2ttcyhkZXYpOwo+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9qb2IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2Iu
Ywo+Pj4+Pj4+Pj4gaW5kZXggNDcyMDcxOC4uODdmZjBjMCAxMDA2NDQKPj4+Pj4+Pj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYwo+Pj4+Pj4+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jCj4+Pj4+Pj4+PiBAQCAtMjgs
NiArMjgsOCBAQAo+Pj4+Pj4+Pj4gICAgICAjaW5jbHVkZSAiYW1kZ3B1LmgiCj4+Pj4+Pj4+PiAg
ICAgICNpbmNsdWRlICJhbWRncHVfdHJhY2UuaCIKPj4+Pj4+Pj4+ICsjaW5jbHVkZSA8ZHJtL2Ry
bV9kcnYuaD4KPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICAgICAgc3RhdGljIHZvaWQgYW1kZ3B1X2pv
Yl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc19qb2IpCj4+Pj4+Pj4+PiAgICAgIHsK
Pj4+Pj4+Pj4+ICAgICAgICAgICBzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSB0b19hbWRncHVf
cmluZyhzX2pvYi0+c2NoZWQpOwo+Pj4+Pj4+Pj4gQEAgLTM3LDYgKzM5LDEyIEBAIHN0YXRpYyB2
b2lkIGFtZGdwdV9qb2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNfam9iKQo+Pj4+
Pj4+Pj4gICAgICAgICAgIG1lbXNldCgmdGksIDAsIHNpemVvZihzdHJ1Y3QgYW1kZ3B1X3Rhc2tf
aW5mbykpOwo+Pj4+Pj4+Pj4gKyAgICAgICAgaWYgKGRybV9kZXZfaXNfdW5wbHVnZ2VkKGFkZXYt
PmRkZXYpKSB7Cj4+Pj4+Pj4+PiArICAgICAgICAgICAgICAgIERSTV9JTkZPKCJyaW5nICVzIHRp
bWVvdXQsIGJ1dCBkZXZpY2UgdW5wbHVnZ2VkLCBza2lwcGluZy5cbiIsCj4+Pj4+Pj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc19qb2ItPnNjaGVkLT5uYW1l
KTsKPj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgcmV0dXJuOwo+Pj4+Pj4+Pj4gKyAgICAgICAg
fQo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gICAgICAgICAgIGlmIChhbWRncHVfcmluZ19zb2Z0X3Jl
Y292ZXJ5KHJpbmcsIGpvYi0+dm1pZCwgc19qb2ItPnNfZmVuY2UtPnBhcmVudCkpIHsKPj4+Pj4+
Pj4+ICAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigicmluZyAlcyB0aW1lb3V0LCBidXQgc29m
dCByZWNvdmVyZWRcbiIsCj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc19q
b2ItPnNjaGVkLT5uYW1lKTsKPj4+Pj4+Pj4+IC0tCj4+Pj4+Pj4+PiAyLjcuNAo+Pj4+Pj4+Pj4K
Pj4KPj4KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJs
PWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZv
JTJGZHJpLWRldmVsJmFtcDtkYXRhPTA0JTdDMDElN0NsdWJlbi50dWlrb3YlNDBhbWQuY29tJTdD
NGE1ZjhhMjk4ODIxNGE5MzEzY2EwOGQ4OGJiOWFhYzQlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4
MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDEyOTc2ODQyMjgzNDU4JTdDVW5rbm93biU3Q1RXRnBi
R1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFX
d2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPU1SdzZPWDFUSnRBNFhwazV5ZzUzYWRh
djAlMkZZb1lEVU4wVkxqeWpKNVIlMkJZJTNEJmFtcDtyZXNlcnZlZD0wCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
