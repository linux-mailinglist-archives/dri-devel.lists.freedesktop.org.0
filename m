Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E9626D452
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 09:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E646E13D;
	Thu, 17 Sep 2020 07:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76356E13D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 07:11:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVHj8vEsJHBO/qVrtBBHrJum0cbSthCMGWqLh2rxzLPEWrDWfdACtII4HWtFy1FPefFhw+oJ6OaFHosjLYFvzaju5farh5uJcSRHtuOR8ZhEV8cR7OCULh2etZJg3gG0ISVF4ovYygMluCUyQtqX10WLkF/Yard16HFER5lsZ601IhqsFDHsvIN6jWi/B7je6gnuQWWE9GNlftNvaxalBhIeSmdiiuP+cjmfGgpLG+9qyahTD3CjXbBRxLMaQasZt//Wp+l5guvJjagtcRL7UZwiSHuMRM9uHTBRNxdsRSlStbwMf9UvhKETiujXGygXb1OgiX0QVSh/ERLZvCKyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oDqHcZy0WFDS771oSIjH7NkcOzAyAYevGyeSRicsOA=;
 b=DsLGNPkJuS6KjhDndG2oT+i4wzLh7NOzujRzPm5viqkl+RvE3IpUjfe4xq9/42tUevW2DYCbqfh/K1ID+8dV/q6UEPmOJgXw0fAZrYlRMo8SCAUGAhQRJ9/Q15/MGGKwI68BdqzrrOkFJoFEaHTKEnGDf54CbLT/8zGGWshsg0zemXk6/Q+rxw4iMLi6EV0Be5CScQUEf8YUNQchahXLhw/xxgdpmtqxBx/uInXlI9pF+G7kXsGzUpFiUlPbVnfRmN7VmHGmiyi8nlA/A0eObhmTEfT/DpoaQzvNjkVlNLYePWLXudhox3gEyGGH1EpLH9NgomTHKO3sx14vaGV61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oDqHcZy0WFDS771oSIjH7NkcOzAyAYevGyeSRicsOA=;
 b=Hhm2x0K98rEkGlCQVmHK1fnitvCUiq5XtdSCNTUjJGXoQwSSeMaS9Ld2blgp9nF6LvDjTUKQWSr6hDq9LIPZ/xQvt2B9kHO9edq8xianbAWlaTMmNeVYnx5/XGX+v+BKnkVo0vmfiEyIDANYVtv4hgtBn+V6ojwWM3Jtq4zhSmc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2483.namprd12.prod.outlook.com (2603:10b6:207:4c::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 17 Sep
 2020 07:11:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 07:11:38 +0000
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
 <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
 <20200916095359.GD438822@phenom.ffwll.local> <20200916140710.GA8409@ziepe.ca>
 <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
Date: Thu, 17 Sep 2020 09:11:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0103.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::44) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0103.eurprd06.prod.outlook.com (2603:10a6:208:fa::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.13 via Frontend Transport; Thu, 17 Sep 2020 07:11:37 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 75e717d0-6a78-462f-9bf6-08d85ad8eb6e
X-MS-TrafficTypeDiagnostic: BL0PR12MB2483:
X-Microsoft-Antispam-PRVS: <BL0PR12MB248313738E1792CBE67061CF833E0@BL0PR12MB2483.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B+upB1Nv1U0ubfNHJkIHBxpCTg3r8ay9Bz4OQZiPloAvulJUFyNGxQsfror+JZdIxd92k0RZNNGiSt8OBt+NOtFRLym4rNq6Oo0xuCSDh5jl7jb98qVJVVGQbzOZvv/Qv9optN0mFlZJ+ZpT4pA+gLOs81OKckl+fDeadoBYtrZPIFVdVwtwbRxrvAMk12LsIj7AXoGUEnrmqrWx2f57sXQRqB3G2fB5U9S7PeAZxkJNNZyaHZleDG4nZkQTMqKOlSFRtEaT2k9TGFRp6TaWZpqdnEQ79GDlx1ST4yBDtVqJaOQQ16Ngacb6hxGAPcejwQMggVQRqnv6lNQrpCwdbrY3wnuJ79ZvTuWlOzmuUvxQUZRPGwL1O90fe3ODxVs6K7PzbwNtwYaA2sW+BtnHvrPEcU01OErV85o5pDOSFbu9EaVM16gugP5ugjMo47SJUM4FprAeRWg13oSQFzfwug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(8676002)(8936002)(36756003)(966005)(4326008)(31686004)(2906002)(5660300002)(66946007)(66556008)(66476007)(86362001)(6486002)(83380400001)(52116002)(31696002)(478600001)(54906003)(186003)(45080400002)(53546011)(2616005)(316002)(6916009)(66574015)(16526019)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +DWDHXmtkgVi8tv9p3COQzpTTvdclLg8LwDJU65pKucAcpkJ2Jt1CR34NdBHLLDtTPszcmtC+xoXRkraEm7VlWx7hIaQ6ynzLM+OToyPra0iH0rE1+pY9ubBUDQkKV4KUWza/YsqP32fT44/kVj3EPofoR9fFIBrg7BRaLRFlgJwncZRfxepj8d/OsMbQWDiHEK5IlxFOc882JCn+GWHLRXMe2RNvMAxtALrUSPUbr9YH8N3NTyf80CaYkD+0PW2ikO2kAZG7/nhwfKeiw15m/Ny6d5tcCLAGWBuj2hFu6f1XvYRfIYQP/phCDtHLuhPSgLz4bbwk30oNgRQxU6YRTNfmoxNR22we06lOePDjflb5g0/vjKixTgO9ytlzJyoUdZ2TBZpTOnQ7Szqu4gKppFBNSwM6SwIj91StukGs/9U+rdnLSxc3N6u4vr94LprsnREQbBusvJwEtjHtvMXOXcebUGwUf30iSR0MkARJKAH8HHpe2otfZixokhai8hCR/HvwkhuN9QDlZUcBmPlvRXhVAFVtuWK8v7YSMdUYADwNE9ugesTNUAXU2mNj0JiRul2nkOUMZdiKydMlR7KVa8Vt9+1yjyOaAqqRpbYnsuduFG+5t6zLH+LsBqTrYNEbAAinWtFP6oCBhI6nXuH6jq2I42xy0IYAE+QA636uBIYsY03ATO0Nsrwi/xE/qSmDHkZCe6TCutXp/dqixGhag==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e717d0-6a78-462f-9bf6-08d85ad8eb6e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 07:11:38.5303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVYhYOytaVsIknKIg9h2GXa0V6QHI2TN+3/1QjvxqEQYQ5VkuW4XsGGwCaOV8tBG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2483
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDkuMjAgdW0gMDg6MjMgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgU2Vw
IDE2LCAyMDIwIGF0IDU6MzEgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxja29lbmlnLmxlaWNodHp1
bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IEFtIDE2LjA5LjIwIHVtIDE3OjI0IHNjaHJpZWIg
RGFuaWVsIFZldHRlcjoKPj4+IE9uIFdlZCwgU2VwIDE2LCAyMDIwIGF0IDQ6MTQgUE0gQ2hyaXN0
aWFuIEvDtm5pZwo+Pj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4+Pj4gQW0g
MTYuMDkuMjAgdW0gMTY6MDcgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4+Pj4+IE9uIFdlZCwg
U2VwIDE2LCAyMDIwIGF0IDExOjUzOjU5QU0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+
Pj4+Cj4+Pj4+PiBCdXQgd2l0aGluIHRoZSBkcml2ZXIsIHdlIGdlbmVyYWxseSBuZWVkIHRob3Vz
YW5kcyBvZiB0aGVzZSwgYW5kIHRoYXQKPj4+Pj4+IHRlbmRzIHRvIGJyaW5nIGZkIGV4aGF1c3Rp
b24gcHJvYmxlbXMgd2l0aCBpdC4gVGhhdCdzIHdoeSBhbGwgdGhlIHByaXZhdGUKPj4+Pj4+IGJ1
ZmZlciBvYmplY3RzIHdoaWNoIGFyZW4ndCBzaGFyZWQgd2l0aCBvdGhlciBwcm9jZXNzIG9yIG90
aGVyIGRyaXZlcnMgYXJlCj4+Pj4+PiBoYW5kbGVzIG9ubHkgdmFsaWQgZm9yIGEgc3BlY2lmaWMg
ZmQgaW5zdGFuY2Ugb2YgdGhlIGRybSBjaGFyZGV2IChlYWNoCj4+Pj4+PiBvcGVuIGdldHMgdGhl
aXIgb3duIG5hbWVzcGFjZSksIGFuZCBvbmx5IGZvciBpb2N0bHMgZG9uZSBvbiB0aGF0IGNoYXJk
ZXYuCj4+Pj4+PiBBbmQgZm9yIG1tYXAgd2UgYXNzaWduIGZha2UgKGJ1dCB1bmlxdWUgYWNyb3Nz
IGFsbCBvcGVuIGZkIG9uIGl0KSBvZmZzZXRzCj4+Pj4+PiB3aXRoaW4gdGhlIG92ZXJhbGwgY2hh
cmRldi4gSGVuY2UgYWxsIHRoZSBwZ29mZiBtYW5nbGluZyBhbmQgcmUtbWFuZ2xpbmcuCj4+Pj4+
IEFyZSB0aGV5IHN0aWxsIHVuaXF1ZSBzdHJ1Y3QgZmlsZXM/IEp1c3Qgd2l0aG91dCBhIGZkbm8/
Cj4+Pj4gWWVzLCBleGFjdGx5Lgo+Pj4gTm90IGVudGlyZWx5LCBzaW5jZSBkbWEtYnVmIGhhcHBl
bmVkIGFmdGVyIGRybSBjaGFyZGV2LCBzbyBmb3IgdGhhdAo+Pj4gaGlzdG9yaWNhbCByZWFzb24g
dGhlIHVuZGVybHlpbmcgc3RydWN0IGZpbGUgaXMgc2hhcmVkLCBzaW5jZSBpdCdzIHRoZQo+Pj4g
ZHJtIGNoYXJkZXYuIEJ1dCBzaW5jZSB0aGF0J3MgcGVyLWRldmljZSB3ZSBkb24ndCBoYXZlIGEg
cHJvYmxlbSBpbgo+Pj4gcHJhY3RpY2Ugd2l0aCBkaWZmZXJlbnQgdm1fb3BzLCBzaW5jZSB0aG9z
ZSBhcmUgYWxzbyBwZXItZGV2aWNlLiBCdXQKPj4+IHllYWggd2UgY291bGQgZmlzaCBvdXQgc29t
ZSBlbnRpcmVseSBoaWRkZW4gcGVyLW9iamVjdCBzdHJ1Y3QgZmlsZSBpZgo+Pj4gdGhhdCdzIHJl
cXVpcmVkIGZvciBzb21lIG1tIGludGVybmFsIHJlYXNvbnMuCj4+IEh1aT8gT2sgdGhhdCBpcyBq
dXN0IHRoZSBoYW5kbGluZyBpbiBpOTE1LCBpc24ndCBpdD8KPj4KPj4gQXMgZmFyIGFzIEkga25v
dyB3ZSBjcmVhdGUgYW4gdW5pcXVlIHN0cnVjdCBmaWxlIGZvciBlYWNoIERNQS1idWYuCj4gWWVz
IGRtYS1idWYsIGJ1dCB0aGF0IGdldHMgZm9yd2FyZGVkIHRvIHRoZSBvcmlnaW5hbCBkcm0gY2hh
cmRldiB3aGljaAo+IG9yaWdpbmFsbHkgZXhwb3J0ZWQgdGhlIGJ1ZmZlci4gSXQncyBvbmx5IHRo
ZXJlIHdoZXJlIHRoZSBmb3J3YXJkaW5nCj4gY2hhaW4gc3RvcHMuIFRoZSBvdGhlciB0aGluZyBp
cyB0aGF0IGlpcmMgd2UgaGF2ZSBhIHNpbmdsZXRvbgo+IGFub25faW5vZGUgYmVoaW5kIGFsbCB0
aGUgZG1hLWJ1Ziwgc28gdGhleSdkIHNoYXJlIGFsbCB0aGUgc2FtZQo+IGFkZHJlc3Nfc3BhY2Ug
YW5kIHNvIHdvdWxkIGFsbCBhbGlhcyBmb3IgdW5tYXBfbWFwcGluZ19yYW5nZSAoSSB0aGluawo+
IGF0IGxlYXN0KS4KCkFtZGdwdSB3b3JrcyBieSB1c2luZyB0aGUgYWRkcmVzc19zcGFjZSBvZiB0
aGUgZHJtIGNoYXJkZXYgaW50byB0aGUgCnN0cnVjdCBmaWxlIG9mIERNQS1idWYgaW5zdGVhZC4K
CkkgdGhpbmsgdGhhdCB0aGlzIGlzIGNsZWFuZXIsIGJ1dCBvbmx5IGJ5IGEgbGl0dGxlIGJpdCA6
KQoKQW55d2F5IEknbSBhIGJpdCBjb25jZXJuZWQgdGhhdCB3ZSBoYXZlIHNvIG1hbnkgZGlmZmVy
ZW50IGFwcHJvYWNoZXMgZm9yIAp0aGUgc2FtZSBwcm9ibGVtLgoKQ2hyaXN0aWFuLgoKPiAtRGFu
aWVsCj4KPj4gUmVnYXJkcywKPj4gQ2hyaXN0aWFuLgo+Pgo+Pgo+Pj4gLURhbmllbAo+Pj4KPj4+
Pj4+IEhlbmNlIHdoeSB3ZSdkIGxpa2UgdG8gYmUgYWJsZSB0byBmb3J3YXJkIGFsaWFzaW5nIG1h
cHBpbmdzIGFuZCBhZGp1c3QgdGhlCj4+Pj4+PiBmaWxlIGFuZCBwZ29mZiwgd2hpbGUgaG9wZWZ1
bGx5IGV2ZXJ5dGhpbmcga2VlcHMgd29ya2luZy4gSSB0aG91Z2h0IHRoaXMKPj4+Pj4+IHdvdWxk
IHdvcmssIGJ1dCBDaHJpc3RpYW4gbm90aWNlZCBpdCBkb2Vzbid0IHJlYWxseS4KPj4+Pj4gSXQg
c2VlbXMgcmVhc29uYWJsZSB0byBtZSB0aGF0IHRoZSBkbWEgYnVmIHNob3VsZCBiZSB0aGUgb3du
ZXIgb2YgdGhlCj4+Pj4+IFZNQSwgb3RoZXJ3aXNlIGxpa2UgeW91IHNheSwgdGhlcmUgaXMgYSBi
aWcgbWVzcyBhdHRhY2hpbmcgdGhlIGN1c3RvbQo+Pj4+PiB2bWEgb3BzIGFuZCB3aGF0IG5vdCB0
byB0aGUgcHJvcGVyIGRtYSBidWYuCj4+Pj4+Cj4+Pj4+IEkgZG9uJ3Qgc2VlIGFueXRoaW5nIG9i
dmlvdXNseSBhZ2FpbnN0IHRoaXMgaW4gbW1hcF9yZWdpb24oKSAtIHdoeSBkaWQKPj4+Pj4gQ2hy
aXRpYW4gbm90aWNlIGl0IGRvZXNuJ3QgcmVhbGx5IHdvcms/Cj4+Pj4gVG8gY2xhcmlmeSBJIHRo
aW5rIHRoaXMgbWlnaHQgd29yay4KPj4+Pgo+Pj4+IEkganVzdCBoYWQgdGhlIHNhbWUgIklzIHRo
YXQgbGVnYWw/IiwgIldoYXQgYWJvdXQgc2VjdXJpdHk/IiwgZXRjLi4KPj4+PiBxdWVzdGlvbnMg
eW91IHJhaXNlZCBhcyB3ZWxsLgo+Pj4+Cj4+Pj4gSXQgc2VlbXMgbGlrZSBhIHNvdXJjZSBvZiB0
cm91YmxlIHNvIEkgdGhvdWdodCBiZXR0ZXIgYXNrIHNvbWVib2R5IG1vcmUKPj4+PiBmYW1pbGlh
ciB3aXRoIHRoYXQuCj4+Pj4KPj4+PiBDaHJpc3RpYW4uCj4+Pj4KPj4+Pj4gSmFzb24KPj4+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+
Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJG
ZHJpLWRldmVsJmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3
Q2Y3MjVkMmViNmE1YTQ5YmQ1MzNmMDhkODVhZDIzMzA4JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFh
ODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzM1OTIwNjE0MjI2Mjk0MSZhbXA7c2RhdGE9cWNMc2w5
UjFnUCUyRkdZMzljdHNRa0l6STk5Qm4lMkY4NDBZUzE3RjR4dWRyQUUlM0QmYW1wO3Jlc2VydmVk
PTAKPj4+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
