Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 132DA209ECB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 14:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A2C6EBC7;
	Thu, 25 Jun 2020 12:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2D36EBC5;
 Thu, 25 Jun 2020 12:44:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZjzAaGpGZqqhUjS+8gjhX/aIBVGMI/6Ye/xLE0BdmY7U2Qud/Hcj9QkzJpukcu0XUciITbIJeScXvgaBrvDF8WcVVlrDILHWNJpi2/hHCh9lQt6WzUnWsyxk1dcKdr9R15TSc5nr+CSZEoqpHr+S3pMMr4qaCb8KS47eBKniQ/264MOZOpmelu/OHBx3/wp0NF+O8uqjvBSrWZFZO/PJAPV0E/Kb2OYjy1T/9CH9/YGyi/pAIY0YJg0Ryg/+gJD6Eus+3Rr3Qgq2+x1CNOwNATghQ5BoUYABmC61g2djQFKpk1GKe7pj1YRb0U2aYZsGH6O6dpxnfO1UI5SoCYSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x328JqJ0UhNRogtmUzqFEHWuPB/HVPwM5daJFyx+6N4=;
 b=QWbR/BBjlfauNtmL3J4SprYZ9+fCyki6zZmMQzlQMt/mPOSRWF0xFz5aOJ1yXaX9ooxLQBS80P80WUlLPI4pJvZaFCbSRfLYzpj9l6/HNibvZe+zMpIvmsEKb24dxlCMJELlm5udVtdJ4HlFL0IyMbZUlgoKXRaE7gHTQeCzLociCc7V7wDX3ifD882FgaGK+LIRgNlAb10WT8udjf23iQQ3AzUURwo+uCkdgVXr2XHzsXU+QvH7/h0Hs4t9hJBfzjqutbpx0WNIgaVecooKIM8T2m2K9SgFHLI+IiKEOJBD5NyK5Fqyj+fyOoAKGuJT6J5138uPawFA+UVHhzTNYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x328JqJ0UhNRogtmUzqFEHWuPB/HVPwM5daJFyx+6N4=;
 b=PN/OBCEeWAtuC4ZwE3ITUcN6Hsvr2gAzrbp0nJ6FBfXc2zq9RHd8dKGfYBdTpVHwipIshYB91MFyBVHh57d3+AAfjm+zIjYbwPn80BwxkUD6u+K45XH2J1c6+AvShVXNhJlwlcsh49PtWwbr+9uoKFpLBXybkJqZyI519pYZkhk=
Authentication-Results: chris-wilson.co.uk; dkim=none (message not signed)
 header.d=none; chris-wilson.co.uk; dmarc=none action=none header.from=amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB2745.namprd12.prod.outlook.com (2603:10b6:5:45::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Thu, 25 Jun
 2020 12:44:12 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1%9]) with mapi id 15.20.3131.020; Thu, 25 Jun 2020
 12:44:12 +0000
Subject: Re: [PATCH 2/2] dma-buf: fix dma-fence-chain out of order test
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
 <20200625123443.19680-2-lionel.g.landwerlin@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e782f2eb-2345-a66f-6d5a-78fe3aeaaa85@amd.com>
Date: Thu, 25 Jun 2020 14:44:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200625123443.19680-2-lionel.g.landwerlin@intel.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0094.eurprd07.prod.outlook.com
 (2603:10a6:207:6::28) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0094.eurprd07.prod.outlook.com (2603:10a6:207:6::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.10 via Frontend Transport; Thu, 25 Jun 2020 12:44:11 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a4eabf7d-8bfb-44e8-74e7-08d819057680
X-MS-TrafficTypeDiagnostic: DM6PR12MB2745:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2745C4FC3AD7865A3ABACCC483920@DM6PR12MB2745.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aKpVJlqFSKCDqTYMUo0e1z+edKUBtM2kHWwizYCaLWGX2ni23mbd/AFGxAO5p065TFmbFhhxKC9aHb7rQWUe2cSC/pwuz/xYYk+gf4Mtj/yF5IAKcgqqs/NfakszbeotCgnIiCa5WkeMqq52zSa8Ion3rVVO8oj87V/+3XfivysvhddhYqR/wKmb2XuBkscX6+j18w/D6Kx+9btNgLTyTDmkGsBftPTNJqLBQubyaZgZ4956Ez8oA9Ry4rWUFYRW93cN4QvHv7Xnb4p89keFy4Li4xG4YKmDMd4asrB7+sSJvzF5BlAOTeeSwFfK7fUQm22H9UenvkUe3H2JMmF8VncjAVSBTEO1gNKqJCcprsuv0DjLoR5g0plT4G/ZdMNR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(2616005)(6486002)(186003)(52116002)(16526019)(316002)(66946007)(66556008)(66476007)(2906002)(4326008)(36756003)(5660300002)(31686004)(478600001)(6666004)(83380400001)(86362001)(31696002)(8936002)(66574015)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: EDU1cvMiy3lcmEbJ6Z0I9Yb+WFfxdNN04EAF+njuMM1Dm1PQhjfMqWhF9CURKObkOPu4tK4ZcWXjyc48gJsMjeB2P+WtHeKPAXmQtHwOV5EUY2039ClxB18Xda7FjL5Eb2mT4RDP83kmuQfSkovlGVU3XKtfgUzy5lH9Q42RqCn9Km8j3PdtjFnnAYClx75etPdAmeYm8TFyEyDW8zBW8kohiHz+R70GYBH2ehI5S84rW2rpOmVPfV+2uyHQlzpgq8JsPcdbI7ur/0CGrfVvQbHnPDCL5V1tWUkZ6gB/ZdaKIuylqDeyH+xS/N2+8vohJE+OceRWaaamjoFpzVZV3cASbVTYYHIE77EO8j+D/eckWrvxO2utUXayTJY7sti8Tm5Elct4H06I3cl6wntHx5sbZehsdYG6DYiPLAtvPrvZVecVVxduqkDGFjMnXdoa5N7N7HinScj6ryvL6ZYqaQNXLy06FTncywvivq2VOIPsSCMI3e0OEz4EbhKWMVUzhXdTELltfghK7DTBut0cqUKh6B3TKPpSDFfqQJekzXVRSkGgjDrIW/tNhqNojFb0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4eabf7d-8bfb-44e8-74e7-08d819057680
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 12:44:12.7960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TapJAGAyTOrCZM+EUVoTU9tspGwaz8WC0ZXxpn/VMC08YqfOljJg5B7W1lsG4LIO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2745
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
Cc: intel-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDYuMjAgdW0gMTQ6MzQgc2NocmllYiBMaW9uZWwgTGFuZHdlcmxpbjoKPiBUaGVyZSB3
YXMgcHJvYmFibHkgYSBtaXN1bmRlcnN0YW5kIG9uIGhvdyB0aGUgZG1hLWZlbmNlLWNoYWluIGlz
Cj4gc3VwcG9zZWQgdG8gd29yayBvciB3aGF0IGRtYV9mZW5jZV9jaGFpbl9maW5kX3NlcW5vKCkg
aXMgc3VwcG9zZWQgdG8KPiByZXR1cm4uCj4KPiBkbWFfZmVuY2VfY2hhaW5fZmluZF9zZXFubygp
IGlzIGhlcmUgdG8gZ2l2ZSB1cyB0aGUgZmVuY2UgdG8gd2FpdCB1cG9uCj4gZm9yIGEgcGFydGlj
dWxhciBwb2ludCBpbiB0aGUgdGltZWxpbmUuIFRoZSB0aW1lbGluZSBwcm9ncmVzc2VzIG9ubHkK
PiB3aGVuIGFsbCB0aGUgcG9pbnRzIHByaW9yIHRvIGEgZ2l2ZW4gbnVtYmVyIGhhdmUgY29tcGxl
dGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3
ZXJsaW5AaW50ZWwuY29tPgo+IEZpeGVzOiBkYzJmN2U2N2EyOGE1YyAoImRtYS1idWY6IEV4ZXJj
aXNlIGRtYS1mZW5jZS1jaGFpbiB1bmRlciBzZWxmdGVzdHMiKQoKQWNrZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2Rt
YS1idWYvc3QtZG1hLWZlbmNlLWNoYWluLmMgfCA0MyArKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL3N0LWRtYS1mZW5jZS1jaGFpbi5jIGIv
ZHJpdmVycy9kbWEtYnVmL3N0LWRtYS1mZW5jZS1jaGFpbi5jCj4gaW5kZXggNWQ0NWJhN2JhM2Nk
Li45NTI1ZjdmNTYxMTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL3N0LWRtYS1mZW5j
ZS1jaGFpbi5jCj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL3N0LWRtYS1mZW5jZS1jaGFpbi5jCj4g
QEAgLTMxOCwxNSArMzE4LDE2IEBAIHN0YXRpYyBpbnQgZmluZF9vdXRfb2Zfb3JkZXIodm9pZCAq
YXJnKQo+ICAgCQlnb3RvIGVycjsKPiAgIAl9Cj4gICAKPiAtCWlmIChmZW5jZSAmJiBmZW5jZSAh
PSBmYy5jaGFpbnNbMV0pIHsKPiArCS8qCj4gKwkgKiBXZSBzaWduYWxlZCB0aGUgbWlkZGxlIGZl
bmNlICgyKSBvZiB0aGUgMS0yLTMgY2hhaW4uIFRoZSBiZWhhdmlvcgo+ICsJICogb2YgdGhlIGRt
YS1mZW5jZS1jaGFpbiBpcyB0byBtYWtlIHVzIHdhaXQgZm9yIGFsbCB0aGUgZmVuY2VzIHVwIHRv
Cj4gKwkgKiB0aGUgcG9pbnQgd2Ugd2FudC4gU2luY2UgZmVuY2UgMSBpcyBzdGlsbCBub3Qgc2ln
bmFsZWQsIHRoaXMgd2hhdAo+ICsJICogd2Ugc2hvdWxkIGdldCBhcyBmZW5jZSB0byB3YWl0IHVw
b24gKGZlbmNlIDIgYmVpbmcgZ2FyYmFnZQo+ICsJICogY29sbGVjdGVkIGR1cmluZyB0aGUgdHJh
dmVyc2FsIG9mIHRoZSBjaGFpbikuCj4gKwkgKi8KPiArCWlmIChmZW5jZSAhPSBmYy5jaGFpbnNb
MF0pIHsKPiAgIAkJcHJfZXJyKCJJbmNvcnJlY3QgY2hhaW4tZmVuY2Uuc2Vxbm86JWxsZCByZXBv
cnRlZCBmb3IgY29tcGxldGVkIHNlcW5vOjJcbiIsCj4gLQkJICAgICAgIGZlbmNlLT5zZXFubyk7
Cj4gLQo+IC0JCWRtYV9mZW5jZV9nZXQoZmVuY2UpOwo+IC0JCWVyciA9IGRtYV9mZW5jZV9jaGFp
bl9maW5kX3NlcW5vKCZmZW5jZSwgMik7Cj4gLQkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7Cj4gLQkJ
aWYgKGVycikKPiAtCQkJcHJfZXJyKCJSZXBvcnRlZCAlZCBmb3IgZmluZGluZyBzZWxmIVxuIiwg
ZXJyKTsKPiArCQkgICAgICAgZmVuY2UgPyBmZW5jZS0+c2Vxbm8gOiAwKTsKPiAgIAo+ICAgCQll
cnIgPSAtRUlOVkFMOwo+ICAgCX0KPiBAQCAtNDE1LDIwICs0MTYsMTggQEAgc3RhdGljIGludCBf
X2ZpbmRfcmFjZSh2b2lkICphcmcpCj4gICAJCWlmICghZmVuY2UpCj4gICAJCQlnb3RvIHNpZ25h
bDsKPiAgIAo+IC0JCWVyciA9IGRtYV9mZW5jZV9jaGFpbl9maW5kX3NlcW5vKCZmZW5jZSwgc2Vx
bm8pOwo+IC0JCWlmIChlcnIpIHsKPiAtCQkJcHJfZXJyKCJSZXBvcnRlZCBhbiBpbnZhbGlkIGZl
bmNlIGZvciBmaW5kLXNlbGY6JWRcbiIsCj4gLQkJCSAgICAgICBzZXFubyk7Cj4gLQkJCWRtYV9m
ZW5jZV9wdXQoZmVuY2UpOwo+IC0JCQlicmVhazsKPiAtCQl9Cj4gLQo+IC0JCWlmIChmZW5jZS0+
c2Vxbm8gPCBzZXFubykgewo+IC0JCQlwcl9lcnIoIlJlcG9ydGVkIGFuIGVhcmxpZXIgZmVuY2Uu
c2Vxbm86JWxsZCBmb3Igc2Vxbm86JWRcbiIsCj4gLQkJCSAgICAgICBmZW5jZS0+c2Vxbm8sIHNl
cW5vKTsKPiAtCQkJZXJyID0gLUVJTlZBTDsKPiAtCQkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7Cj4g
LQkJCWJyZWFrOwo+ICsJCS8qCj4gKwkJICogV2UgY2FuIG9ubHkgZmluZCBvdXJzZWx2ZXMgaWYg
d2UgYXJlIG9uIGZlbmNlIHdlIHdlcmUKPiArCQkgKiBsb29raW5nIGZvci4KPiArCQkgKi8KPiAr
CQlpZiAoZmVuY2UtPnNlcW5vID09IHNlcW5vKSB7Cj4gKwkJCWVyciA9IGRtYV9mZW5jZV9jaGFp
bl9maW5kX3NlcW5vKCZmZW5jZSwgc2Vxbm8pOwo+ICsJCQlpZiAoZXJyKSB7Cj4gKwkJCQlwcl9l
cnIoIlJlcG9ydGVkIGFuIGludmFsaWQgZmVuY2UgZm9yIGZpbmQtc2VsZjolZFxuIiwKPiArCQkJ
CSAgICAgICBzZXFubyk7Cj4gKwkJCQlkbWFfZmVuY2VfcHV0KGZlbmNlKTsKPiArCQkJCWJyZWFr
Owo+ICsJCQl9Cj4gICAJCX0KPiAgIAo+ICAgCQlkbWFfZmVuY2VfcHV0KGZlbmNlKTsKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
