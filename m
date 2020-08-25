Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 702CB251DAE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 18:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625736E91C;
	Tue, 25 Aug 2020 16:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4C56E528;
 Tue, 25 Aug 2020 16:58:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjJBtjxaG2CUNf0GuucFe4XBlstiBhj6efdPG1Egzoqb4PveNWV3A1ZBnCxmvnKuV6vCMSHF+VJG7+MuOvCGFhp9Hrm7dhO8ih/XeKVkOeLkrSFD06rS9BjNw4jHSJqi2CKQmgZQoyv9jE0phAPRLCoBlV0Hb6kSNOqa85pc6W9lBfmNzGLOJyGTg4+/WHh0gnLHpL427aGzdrYU8b+uqhiQQYWEDtPieNPHc1rfQ6ETlCCTpk9h/88VAjpuMwFprNpfR1k/uG983rykETBu8iG2Yca846AqcN4A6u32HecIyI7Ta/YvH/W3Dz2LR+e/HNCDxYLdq8GRlK5NoLgQRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jp/8VLGh589zGMdvufPkeFxuJGwenbJZCQ/ABLr0X0c=;
 b=YgLu99NnJmf/eUoWlnFVuvHo63R4zMSmJ92rKINHkkbGBSlSt9S6gK0asH7LmB2A+jM2yVJ8V2biXREN+n2+j4kHH+u+uWPdwd6LNTvXT/1GFDLtRe94C0LIyhxoT/L6V5tEP1LEuLPVJyy1VIvxOiI0VZPAe9QNLQFysKL2O6Se+FydpFnnRqCdGRA5VeTd0+mpEoPuJ0sGb6qZN7SGv7hMFu0BJsGe08/7ePaocHahoCxRjbxjoQoWgP63kHMPjgLbyQyexiYdERs0Nc5U28hVX5Awas3UAJ/4259Soex2/21h92Jid5rzJk7VkFMovzv7yaTD+LTbRgdUgtHd3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jp/8VLGh589zGMdvufPkeFxuJGwenbJZCQ/ABLr0X0c=;
 b=Crak8yIeAVy9xZXA+znEXdQStOF0e2ZeKIbchYQVqubkcbHxIacoUwGgS8NSN2HZfE2SpVe5sxEZzk7Tpnez1VeFp0bu+zWXdKjGC7FYS6eowFOEId0mTQts47ldOaT8vbX8Ee6XINpRqSHGGj711se2qpa1LySeDxjBI0GI89Q=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BY5PR12MB4131.namprd12.prod.outlook.com (2603:10b6:a03:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Tue, 25 Aug
 2020 16:58:23 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::2:7a78:c54b:7d47]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::2:7a78:c54b:7d47%5]) with mapi id 15.20.3305.026; Tue, 25 Aug 2020
 16:58:23 +0000
Subject: Re: [PATCH] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Leo Li <sunpeng.li@amd.com>
References: <20200821165758.1106210-1-michel@daenzer.net>
 <58dc5ed0-307e-74c9-1a8b-1e998be04900@amd.com>
 <91391bb3-a855-1a29-2d2e-a31856c99946@daenzer.net>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <15b4eb58-a51b-b2fd-f51d-1576d50914cc@amd.com>
Date: Tue, 25 Aug 2020 12:58:19 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <91391bb3-a855-1a29-2d2e-a31856c99946@daenzer.net>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Tue, 25 Aug 2020 16:58:22 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27a778b9-3cd2-4ec4-e974-08d8491813b0
X-MS-TrafficTypeDiagnostic: BY5PR12MB4131:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB4131555E0E24B42B358801C6EC570@BY5PR12MB4131.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E1ZU/Om7PqZ5NC1/OT6twrn11f/RkAj/0PYDp+zqHJyKEJgaGeaO6a29PLM4vPXY2oS1mxzUJkq/+gjIEyCBed6OakHFDPZrjD4Ppx/X3JS6E4o2SmUOlHUqciqvNYBNq2Eo49p7KINXZjsmZcNgCLuo1yaBfJRy4CRQc6d0ZBxnjSy8KQrSLuj9lz/brpGj0ll3YmL1kEqcX9T3INDVo1WQaoRpV5TK9CmDJCgd6b4gTNg8EXn0MAeG4ICAEiODpkKZkREwuru9sJRycO+WIW+3T3ABmJTLYEr6LV2V3IpjaqBhD4ypTd0noWz/t+7sz6LJGt4IFjEfDxaxrCO6jh0HIgNrEAjIOpOi7yDWqdUPfXMfsETFWqw57NfkDNVa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(8936002)(83380400001)(6666004)(36756003)(4326008)(186003)(26005)(86362001)(53546011)(956004)(6636002)(6486002)(5660300002)(31696002)(2906002)(52116002)(478600001)(110136005)(66574015)(66556008)(66946007)(66476007)(2616005)(16576012)(316002)(31686004)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: pXNBf4ulcXpKPLX2aCCGGKsZvXPEe0P6YbdmLFGNAPa2XcPyJPBCm5K/T1uqcUDSVskkIbeECko3SpPUMFW2LfoPd99/plOGgox/uSz4hasmYZFFkGo1AAQO4Yb0gktK9OK2GnLBchTD+o3s4+dJEjOcR1BLEdiI/L3sc7PedoZomQtZdzAinpOs3M+g3AEOHMbA9JMpXjXZi+3DJoUxYR4H8RC26BJJnQxqw1BHeGJFiOzDVxacbCgssm6KEbo/oSlZ++2K2p6K0mo7/qAAEpPLsreflGI6sXVCnFhafw09z8XDUwmlilM7QTYiQ+u8zWvYyVomx+MA2Lni1MRCCV4l+f9IDui9KzIf1EpZI65My21vnrVnlZAPS8Oy2oEpxh3zGv+DrnuzR0cUYZTZtHZFLTVhZn3tFCK3wBAcJSjCJAm0X6HaU3ULrznT78ZHKjvrpbSWEPpEPBphDsN9c3z4IH9xChbRtdhZld40YlnnszKws/PpltEBw0kNcGeTfO/OA4IlKk2wuecWff8/wGZDHZAFXySGU1NckT8sgvilnqi9jW82BQXuADyizhzfwgH8BAY+OX/Y4UiyRySwT2fzWLSBqOLb0z0Q8kkb8iTfZgpbSrGFPZJpmZJvV9KSDLxMrYFd2HvmUs65YM/Oeg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a778b9-3cd2-4ec4-e974-08d8491813b0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 16:58:23.6646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjMY4qMRElF0dA3RNocC6qzZDqVK5JCr0p2r589XPxFmCpUS+JipY6Uk31SzjVjzZZon+4gcTKWnIzdtM5iwSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4131
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOC0yMiA1OjU5IGEubS4sIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+IE9uIDIwMjAt
MDgtMjEgODowNyBwLm0uLCBLYXpsYXVza2FzLCBOaWNob2xhcyB3cm90ZToKPj4gT24gMjAyMC0w
OC0yMSAxMjo1NyBwLm0uLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPj4+IEZyb206IE1pY2hlbCBE
w6RuemVyIDxtZGFlbnplckByZWRoYXQuY29tPgo+Pj4KPj4+IERvbid0IGNoZWNrIGRybV9jcnRj
X3N0YXRlOjphY3RpdmUgZm9yIHRoaXMgZWl0aGVyLCBwZXIgaXRzCj4+PiBkb2N1bWVudGF0aW9u
IGluIGluY2x1ZGUvZHJtL2RybV9jcnRjLmg6Cj4+Pgo+Pj4gIMKgICogSGVuY2UgZHJpdmVycyBt
dXN0IG5vdCBjb25zdWx0IEBhY3RpdmUgaW4gdGhlaXIgdmFyaW91cwo+Pj4gIMKgICogJmRybV9t
b2RlX2NvbmZpZ19mdW5jcy5hdG9taWNfY2hlY2sgY2FsbGJhY2sgdG8gcmVqZWN0IGFuIGF0b21p
Ywo+Pj4gIMKgICogY29tbWl0Lgo+Pj4KPj4+IFRoZSBhdG9taWMgaGVscGVycyBkaXNhYmxlIHRo
ZSBDUlRDIGFzIG5lZWRlZCBmb3IgZGlzYWJsaW5nIHRoZSBwcmltYXJ5Cj4+PiBwbGFuZS4KPj4+
Cj4+PiBUaGlzIHByZXZlbnRzIGF0IGxlYXN0IHRoZSBmb2xsb3dpbmcgcHJvYmxlbXMgaWYgdGhl
IHByaW1hcnkgcGxhbmUgZ2V0cwo+Pj4gZGlzYWJsZWQgKGUuZy4gZHVlIHRvIGRlc3Ryb3lpbmcg
dGhlIEZCIGFzc2lnbmVkIHRvIHRoZSBwcmltYXJ5IHBsYW5lLAo+Pj4gYXMgaGFwcGVucyBlLmcu
IHdpdGggbXV0dGVyIGluIFdheWxhbmQgbW9kZSk6Cj4+Pgo+Pj4gKiBUb2dnbGluZyBDUlRDIGFj
dGl2ZSB0byAxIGZhaWxlZCBpZiB0aGUgY3Vyc29yIHBsYW5lIHdhcyBlbmFibGVkCj4+PiAgwqDC
oCAoZS5nLiB2aWEgbGVnYWN5IERQTVMgcHJvcGVydHkgJiBjdXJzb3IgaW9jdGwpLgo+Pj4gKiBF
bmFibGluZyB0aGUgY3Vyc29yIHBsYW5lIGZhaWxlZCwgZS5nLiB2aWEgdGhlIGxlZ2FjeSBjdXJz
b3IgaW9jdGwuCj4+Cj4+IFdlIHByZXZpb3VzbHkgaGFkIHRoZSByZXF1aXJlbWVudCB0aGF0IHRo
ZSBwcmltYXJ5IHBsYW5lIG11c3QgYmUgZW5hYmxlZAo+PiBidXQgc29tZSB1c2Vyc3BhY2UgZXhw
ZWN0cyB0aGF0IHRoZXkgY2FuIGVuYWJsZSBqdXN0IHRoZSBvdmVybGF5IHBsYW5lCj4+IHdpdGhv
dXQgYW55dGhpbmcgZWxzZS4KPj4KPj4gSSB0aGluayB0aGUgY2hyb211aXVtb3MgYXRvbWljdGVz
dCB2YWxpZGF0ZXMgdGhhdCB0aGlzIHdvcmtzIGFzIHdlbGw6Cj4+Cj4+IFNvIGlzIERSTSBnb2lu
ZyBmb3J3YXJkIHRoZW4gd2l0aCB0aGUgZXhwZWN0YXRpb24gdGhhdCB0aGlzIGlzIHdyb25nCj4+
IGJlaGF2aW9yIGZyb20gdXNlcnNwYWNlPwo+Pgo+PiBXZSByZXF1aXJlIGF0IGxlYXN0IG9uZSBw
bGFuZSB0byBiZSBlbmFibGVkIHRvIGRpc3BsYXkgYSBjdXJzb3IsIGJ1dCBpdAo+PiBkb2Vzbid0
IG5lY2Vzc2FyaWx5IG5lZWQgdG8gYmUgdGhlIHByaW1hcnkuCj4gCj4gSXQncyBhICJwaWNrIHlv
dXIgcG9pc29uIiBzaXR1YXRpb246Cj4gCj4gMSkgQ3VycmVudGx5IHRoZSBjaGVja3MgYXJlIGlu
dmFsaWQgKGF0b21pY19jaGVjayBtdXN0IG5vdCBkZWNpZGUgYmFzZWQKPiBvbiBkcm1fY3J0Y19z
dGF0ZTo6YWN0aXZlKSwgYW5kIGl0J3MgZWFzeSBmb3IgbGVnYWN5IEtNUyB1c2Vyc3BhY2UgdG8K
PiBhY2NpZGVudGFsbHkgaGl0IGVycm9ycyB0cnlpbmcgdG8gZW5hYmxlL21vdmUgdGhlIGN1cnNv
ciBvciBzd2l0Y2ggRFBNUwo+IG9mZiDihpIgb24uCj4gCj4gMikgQWNjdXJhdGVseSByZWplY3Rp
bmcgb25seSBhdG9taWMgc3RhdGVzIHdoZXJlIHRoZSBjdXJzb3IgcGxhbmUgaXMKPiBlbmFibGVk
IGJ1dCBhbGwgb3RoZXIgcGxhbmVzIGFyZSBvZmYgd291bGQgYnJlYWsgdGhlIEtNUyBoZWxwZXIg
Y29kZSwKPiB3aGljaCBjYW4gb25seSBkZWFsIHdpdGggdGhlICJDUlRDIG9uICYgcHJpbWFyeSBw
bGFuZSBvZmYgaXMgbm90Cj4gYWxsb3dlZCIgY2FzZSBzcGVjaWZpY2FsbHkuCj4gCj4gMykgVGhp
cyBwYXRjaCBhZGRyZXNzZXMgMSkgJiAyKSBidXQgbWF5IGJyZWFrIGV4aXN0aW5nIGF0b21pYyB1
c2Vyc3BhY2UKPiB3aGljaCB3YW50cyB0byBlbmFibGUgYW4gb3ZlcmxheSBwbGFuZSB3aGlsZSBk
aXNhYmxpbmcgdGhlIHByaW1hcnkgcGxhbmUuCj4gCj4gCj4gSSBkbyB0aGluayBpbiBwcmluY2lw
bGUgYXRvbWljIHVzZXJzcGFjZSBpcyBleHBlY3RlZCB0byBoYW5kbGUgY2FzZSAzKQo+IGFuZCBs
ZWF2ZSB0aGUgcHJpbWFyeSBwbGFuZSBlbmFibGVkLiBIb3dldmVyLCB0aGlzIGlzIG5vdCBpZGVh
bCBmcm9tIGFuCj4gZW5lcmd5IGNvbnN1bXB0aW9uIFBvVi4gVGhlcmVmb3JlLCBoZXJlJ3MgYW5v
dGhlciBpZGVhIGZvciBhIHBvc3NpYmxlCj4gd2F5IG91dCBvZiB0aGlzIHF1YWdtaXJlOgo+IAo+
IGFtZGdwdV9kbSBkb2VzIG5vdCByZWplY3QgYW55IGF0b21pYyBzdGF0ZXMgYmFzZWQgb24gd2hp
Y2ggcGxhbmVzIGFyZQo+IGVuYWJsZWQgaW4gaXQuIElmIHRoZSBjdXJzb3IgcGxhbmUgaXMgZW5h
YmxlZCBidXQgYWxsIG90aGVyIHBsYW5lcyBhcmUKPiBvZmYsIGFtZGdwdV9kbSBpbnRlcm5hbGx5
IGVpdGhlcjoKPiAKPiBhKSBFbmFibGVzIGFuIG92ZXJsYXkgcGxhbmUgYW5kIG1ha2VzIGl0IGlu
dmlzaWJsZSwgZS5nLiBieSBhc3NpZ25pbmcgYQo+IG1pbmltdW0gc2l6ZSBGQiB3aXRoIGFscGhh
ID0gMC4KPiAKPiBiKSBFbmFibGVzIHRoZSBwcmltYXJ5IHBsYW5lIGFuZCBhc3NpZ25zIGEgbWlu
aW11bSBzaXplIEZCIChzY2FsZWQgdXAgdG8KPiB0aGUgcmVxdWlyZWQgc2l6ZSkgY29udGFpbmlu
ZyBhbGwgYmxhY2ssIHBvc3NpYmx5IHVzaW5nIGNvbXByZXNzaW9uLgo+IChUcnlpbmcgdG8gbWlu
aW1pemUgdGhlIG1lbW9yeSBiYW5kd2lkdGgpCj4gCj4gCj4gRG9lcyBlaXRoZXIgb2YgdGhlc2Ug
c2VlbSBmZWFzaWJsZT8gSWYgYm90aCBkbywgd2hpY2ggb25lIHdvdWxkIGJlCj4gcHJlZmVyYWJs
ZT8KPiAKPiAKCkl0J3MgcmVhbGx5IHRoZSBzYW1lIHNvbHV0aW9uIHNpbmNlIERDTiBkb2Vzbid0
IG1ha2UgYSBkaXN0aW5jdGlvbiAKYmV0d2VlbiBwcmltYXJ5IG9yIG92ZXJsYXkgcGxhbmVzIGlu
IGhhcmR3YXJlLiBEQ0UgZG9lc24ndCBoYXZlIG92ZXJsYXkgCnBsYW5lcyBlbmFibGVkIHNvIHRo
aXMgaXMgbm90IHJlbGV2YW50IHRoZXJlLgoKVGhlIG9sZCBiZWhhdmlvciAocHJlIDUuMT8pIHdh
cyB0byBzaWxlbnRseSBhY2NlcHQgdGhlIGNvbW1pdCBldmVuIAp0aG91Z2ggdGhlIHNjcmVlbiB3
b3VsZCBiZSBjb21wbGV0ZWx5IGJsYWNrIGluc3RlYWQgb2Ygb3V0cmlnaHQgCnJlamVjdGluZyB0
aGUgY29tbWl0LgoKSSBhbG1vc3Qgd29uZGVyIGlmIHRoYXQgbWFrZXMgbW9yZSBzZW5zZSBpbiB0
aGUgc2hvcnQgdGVybSBoZXJlIHNpbmNlIAp0aGUgb25seSAidXNlcnNwYWNlIiBhZmZlY3RlZCBo
ZXJlIGlzIElHVC4gV2UnbGwgZmFpbCB0aGUgQ1JDIGNoZWNrcywgCmJ1dCBubyB1c2Vyc3BhY2Ug
YWN0dWFsbHkgdHJpZXMgdG8gYWN0aXZlbHkgdXNlIGEgY3Vyc29yIHdpdGggbm8gcHJpbWFyeSAK
cGxhbmUgZW5hYmxlZCBmcm9tIG15IHVuZGVyc3RhbmRpbmcuCgpJbiB0aGUgbG9uZyB0ZXJtIEkg
dGhpbmsgd2UgY2FuIHdvcmsgb24gZ2V0dGluZyBjdXJzb3IgYWN0dWFsbHkgb24gdGhlIApzY3Jl
ZW4gaW4gdGhpcyBjYXNlLCB0aG91Z2ggSSBjYW4ndCBzYXkgSSByZWFsbHkgbGlrZSBoYXZpbmcg
dG8gcmVzZXJ2ZSAKc29tZSBzbWFsbCBidWZmZXIgKGVnLiAxNngxNikgZm9yIGFsbG93aW5nIGxp
Z2h0dXAgb24gdGhpcyBjb3JuZXIgY2FzZS4KClJlZ2FyZHMsCk5pY2hvbGFzIEthemxhdXNrYXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
