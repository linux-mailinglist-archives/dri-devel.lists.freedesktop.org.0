Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DFA1EFB6B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 16:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B151A6E910;
	Fri,  5 Jun 2020 14:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F716E910;
 Fri,  5 Jun 2020 14:29:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjUjW6ztcbRpPYzEYv6cFr5lxA8hM2i+64HRPUH/fZiwAFJQ4ubF95SZJ3tJ9j53uP+Ihpm2T+dUOUOxWMdOqglGpK0Z2BfdvgYQXOi+QtXJu+k8ChJuc644tEHpzGk7yxPZzZy4Oec1lpGfRCA2vfEs3ngVkhNIJbz1b4xgwG7y1W2ZH70r6kpC4jxCJx+PsTBGb5f5GCe7agtx+OZ4CV+9eKIlaBJW+e72miS326lg/8DOAwaNCHzQUrhFNfOAiFAoJq6MsTswIFXlR8NiEZ2cLBdaKKlUZ7dHzfaSztMR1fztyzDB2xiH7uclVoFktbDVPdNUdkAEl8QBBgCG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pi8bvE6eiXwqsoEsDqL91BFkV+5s1ZW3xZ/Rh/Cn7Bw=;
 b=Y7OhgE3znJ/eJdQHWJeOd3Z7lH8vuS5AtdTbGr3ED3yvNSA2hBaqk2LiXamwW6Ugk1ZbQjtwXtWlwPBAtSSp5p+xktdTykukPG9O1xhoyC6vPpFxHu8TBtONroSvMTWOFU1w1ACxqkmug9xuT2ykaoxMMMS9XiEP0HsfL080mFb6/kEb1v4CXbWYuCfZe11B3hj6MFMKHblUjnLx7ttEF3VtVHM19yfMeA1w735Owl0OF4CRBwMNRIIjCBQhcojZpAOTOEO9uknM0vf0jZw4gohsKF9g/rClzpU6w8u9l3TR6GASxwKhircRR2OkgP2TGbbCHlVRjdYkpM6S0AFJfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pi8bvE6eiXwqsoEsDqL91BFkV+5s1ZW3xZ/Rh/Cn7Bw=;
 b=LXUgJ4hjJBh8hAMdZAY/Nk6ObGxE1VyKlS5EXKI81yUEL8t/ste949iojb3JWoUmBXiAh0H7OI6Pfqi6XKszN7VDPC5i5W6p7QBtbmfM7e4xZ3bkStcb/vvb6Cy1qqMshQsf7OUZl7ZWOBQeI0kFsJm5zX76B0zh8e2BJRgH1kw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB4009.namprd12.prod.outlook.com (2603:10b6:5:1cd::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.19; Fri, 5 Jun 2020 14:29:43 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df%2]) with mapi id 15.20.3066.018; Fri, 5 Jun 2020
 14:29:43 +0000
Subject: Re: [PATCH 1/6] drm/ttm: Add unampping of the entire device address
 space
To: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <1589050310-19666-2-git-send-email-andrey.grodzovsky@amd.com>
 <e293af59-99df-c147-68d6-8fa3ade38829@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <3758b335-25b5-403c-5936-25d5fe714842@amd.com>
Date: Fri, 5 Jun 2020 10:29:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <e293af59-99df-c147-68d6-8fa3ade38829@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::20) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3ee0:2de:4897:a403:c330:dfde]
 (2607:fea8:3ee0:2de:4897:a403:c330:dfde) by
 YTXPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Fri, 5 Jun 2020 14:29:42 +0000
X-Originating-IP: [2607:fea8:3ee0:2de:4897:a403:c330:dfde]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5a746af1-cfaa-44c2-0233-08d8095ce3a4
X-MS-TrafficTypeDiagnostic: DM6PR12MB4009:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB40093C0860B22E4D74B69E13EA860@DM6PR12MB4009.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OSap9vixX6jcr0N+KQ+r6c95SXfVolHbMUFh+DYaR795NFIrjZnjlm5uzMPoHoEB9w6IkOahOu4vzeF1343/b+jJv7WbOqdWne70mFtoTStrgNuZa9qPHb/dxm2IO0OqopRi4rBJXhXCAaXOGgLHJByEoh/cf4JiLzXok5Qj+BS8pdafa9hZ1UyeucfhSrCIaWkQhQv5IgaIYvVMtxD55n3Uhx8Qxi8zxb8WTAh3hIyNTXjHWNBDuRgqJnoZuQk4xB/C5XWhYouCf5Q7jVo/23+9I0Bf69AXej3fdRyb5VQFEvigsVeyyluwNKvA6E/aqoosTgUw4/KI1sJnWFhUO06bUc7N3mepN9iPH32X65S9T5UHnQs+kFuk7bPJX50E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(53546011)(16526019)(31686004)(186003)(36756003)(2616005)(8676002)(2906002)(6486002)(4326008)(8936002)(316002)(66476007)(31696002)(5660300002)(86362001)(66574014)(52116002)(66556008)(83380400001)(478600001)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 295ZJ3o05yapvDytdiXqe96dncLAmqiB+svWvK+0DsAItVmgHleAMGZii2vk5no8vXhc2f80i8LhWfqS/avbICnvS7tgT1WeWF6Q6mLG2n9y2aFlG9069x4+dCZUWgGSQKWdw+W9JHULGm4gpGyihbiQ200mWyggw4pZRkCS3wWP13UP73Hxw1qegQGzmdJYuNxTWdHhsOnJoOt2ls3OlT3cckrlbEPkD0f2LOeVDEiUgTKHkQWekmzkVz6Q72OsZIv8DMEyUeuF/jQzssdVu97gk2q8stFVbSKDYdpVfnEsDzU+QR+niAORdXdTfv/9a5w8f4/hkvWObwdT7cHWPVmfOusxVFlpKa4uo5J62Z/tsG8Sni64dUSwzPKOzsbI4eaH9+zEm9/+k7tTj4WkHMD/hPSH3EbnErZmgbKUchpwUDZxHJMghk0koEcsuUGBifdt9jqNcpRLYE2JSRIy9FU4PI25whfn8mO3Zx48JCb/6/lGcW7vHLDqdIkyWa8X36fSx8yJY9G4vmlsk6OgVjn6EfX+/7ZeiVxbkcZikN4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a746af1-cfaa-44c2-0233-08d8095ce3a4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 14:29:43.5087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PktOUr18sNiKYkdP1cDVUbak+Irl2Pxv4Th09+TuygHLSomt3RL7uoCib0AJo1UJxq8K5e8UfXSB5dzEGP9c6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4009
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDUvMTEvMjAgMjo0NSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAwOS4wNS4y
MCB1bSAyMDo1MSBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+PiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4gLS0tCj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmPCoMKgwqAgfCAyMiArKysrKysrKysrKysrKysr
KysrKystCj4+IMKgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggfMKgIDIgKysKPj4g
wqAgMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYwo+PiBpbmRleCBjNWI1MTZmLi5lYWU2MWNjIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMKPj4gQEAgLTE3NTAsOSArMTc1MCwyOSBAQCB2b2lkIHR0bV9ib191bm1hcF92
aXJ0dWFsKHN0cnVjdCAKPj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+PiDCoMKgwqDCoMKgIHR0
bV9ib191bm1hcF92aXJ0dWFsX2xvY2tlZChibyk7Cj4+IMKgwqDCoMKgwqAgdHRtX21lbV9pb191
bmxvY2sobWFuKTsKPj4gwqAgfQo+PiArRVhQT1JUX1NZTUJPTCh0dG1fYm9fdW5tYXBfdmlydHVh
bCk7Cj4+IMKgICt2b2lkIHR0bV9ib191bm1hcF92aXJ0dWFsX2FkZHJlc3Nfc3BhY2Uoc3RydWN0
IHR0bV9ib19kZXZpY2UgKmJkZXYpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IHR0bV9tZW1fdHlw
ZV9tYW5hZ2VyICptYW47Cj4+ICvCoMKgwqAgaW50IGk7Cj4+IMKgIC1FWFBPUlRfU1lNQk9MKHR0
bV9ib191bm1hcF92aXJ0dWFsKTsKPgo+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBUVE1fTlVN
X01FTV9UWVBFUzsgaSsrKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBtYW4gPSAmYmRldi0+bWFuW2ld
Owo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKG1hbi0+aGFzX3R5cGUgJiYgbWFuLT51c2VfdHlwZSkK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHRtX21lbV9pb19sb2NrKG1hbiwgZmFsc2UpOwo+
PiArwqDCoMKgIH0KPgo+IFlvdSBzaG91bGQgZHJvcCB0aGF0IGl0IHdpbGwganVzdCByZXN1bHQg
aW4gYSBkZWFkbG9jayB3YXJuaW5nIGZvciAKPiBOb3V2ZWF1IGFuZCBoYXMgbm8gZWZmZWN0IGF0
IGFsbC4KPgo+IEFwYXJ0IGZyb20gdGhhdCBsb29rcyBnb29kIHRvIG1lLAo+IENocmlzdGlhbi4K
CgpBcyBJIGFtIGNvbnNpZGVyaW5nIHRvIHJlLWluY2x1ZGUgdGhpcyBpbiBWMiBvZiB0aGUgcGF0
Y2hzZXRzLCBjYW4geW91IApjbGFyaWZ5IHBsZWFzZSB3aHkgdGhpcyB3aWxsIGhhdmUgbm8gZWZm
ZWN0IGF0IGFsbCA/CgpBbmRyZXkKCgo+Cj4+ICsKPj4gK8KgwqDCoCB1bm1hcF9tYXBwaW5nX3Jh
bmdlKGJkZXYtPmRldl9tYXBwaW5nLCAwLCAwICwgMSk7Cj4+ICvCoMKgwqAgLypUT0RPIFdoYXQg
YWJvdXQgdHRtX21lbV9pb19mcmVlX3ZtKGJvKSA/ICovCj4+ICsKPj4gK8KgwqDCoCBmb3IgKGkg
PSBUVE1fTlVNX01FTV9UWVBFUyAtIDE7IGkgPj0gMDsgaS0tKSB7Cj4+ICvCoMKgwqDCoMKgwqDC
oCBtYW4gPSAmYmRldi0+bWFuW2ldOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKG1hbi0+aGFzX3R5
cGUgJiYgbWFuLT51c2VfdHlwZSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHRtX21lbV9p
b191bmxvY2sobWFuKTsKPj4gK8KgwqDCoCB9Cj4+ICt9Cj4+ICtFWFBPUlRfU1lNQk9MKHR0bV9i
b191bm1hcF92aXJ0dWFsX2FkZHJlc3Nfc3BhY2UpOwo+PiDCoCDCoCBpbnQgdHRtX2JvX3dhaXQo
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wg
aW50ZXJydXB0aWJsZSwgYm9vbCBub193YWl0KQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
dHRtL3R0bV9ib19kcml2ZXIuaCAKPj4gYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5o
Cj4+IGluZGV4IGM5ZTBmZDAuLjMxMzM0NjMgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvZHJtL3R0
bS90dG1fYm9fZHJpdmVyLmgKPj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIu
aAo+PiBAQCAtNjAwLDYgKzYwMCw4IEBAIGludCB0dG1fYm9fZGV2aWNlX2luaXQoc3RydWN0IHR0
bV9ib19kZXZpY2UgKmJkZXYsCj4+IMKgwqAgKi8KPj4gwqAgdm9pZCB0dG1fYm9fdW5tYXBfdmly
dHVhbChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKTsKPj4gwqAgK3ZvaWQgdHRtX2JvX3Vu
bWFwX3ZpcnR1YWxfYWRkcmVzc19zcGFjZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldik7Cj4+
ICsKPj4gwqAgLyoqCj4+IMKgwqAgKiB0dG1fYm9fdW5tYXBfdmlydHVhbAo+PiDCoMKgICoKPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
