Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B6C27AFBD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 16:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDFA89DEC;
	Mon, 28 Sep 2020 14:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC07489DEC;
 Mon, 28 Sep 2020 14:11:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRiCcLtFvszSu52qNlxZNqGzkvCA9O/7Pn2WdKUGD36Jk4es0qtzG38ILW95Tp/HFCBSC9V8+0XVmcT7swBfojknvjp1zYvfVhwvF52lusRrdZMam8UhqV9eriWQ8tamhO2HWeFYYdB1BFpLlkBCsT+OxSW1DwJ4JjTDAG3g0h/cvOoOegJjWzPeeGfaB51uhDxdEBOpJayIkVBWjE5KcWlGoj56Wq2W+CIUtGMY5HNsESBsNS4W5leujTFa+Qh2EAsniEEgPZOn5evcqkxBZRml61jvxJEFBYVQrlYVVZ9VnQ8RMYSoggLZrgGivxN+831FhQGQ9ShN7Qw8HmSO4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8zpmngDowsIU1yMbzTr5CMyXqvzqwfXNTp66/dze1k=;
 b=MGjpJDKYkCcgvry218VoSfX1B6pU3UCIdEKHmpH8iIDILKrrFd8L3pZKrxHlxAXwYH4u3iHnbCN+WH8g8/a6q2btYvhbbboRxsUZzKfaFZUEb9krKHILfVUM7tCC0Cimi9vSP2+aIVn1m/wh+Q0M48luu7HY+Xft2X0IdSGol07Gf3birBX+4le0o2VkNrN8TpdVzZJXxOopgyLGY7Bcd3ifpwTh0icqo+EWEoqNIkxXmyw3aeTm+IAl5D5NsqNYPAvJMG5lo30hgXQ3QcPb1Qn5EWEj0X13wAQl8nY4NlG1Peo4PoIi9zXCmExvml6io7ArQb/51Vl6NSeUWp9X8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8zpmngDowsIU1yMbzTr5CMyXqvzqwfXNTp66/dze1k=;
 b=ymCRxRYbqe82FYtP8B3+b+IQDzzG/dEo6o3hjm7I7xgsvKlhjtq85S4ff9NN/DAE6F4i2jzZ1RXChEEevsccpMFqzj25pT5Dn7njG77HAs6HKgWaL+KHH+AGBFYVrbRFV9vA1MoqC9Hn0Kib9fsfeFaTiMb32fMo3Qnyd68MNFc=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR12MB1293.namprd12.prod.outlook.com (2603:10b6:300:9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Mon, 28 Sep
 2020 14:11:56 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::5dc0:bafc:6040:a8fe]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::5dc0:bafc:6040:a8fe%2]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 14:11:56 +0000
Subject: Re: [PATCH] drm/amd/display: add debugfs entry for trigger_hotplug
To: Jason Yan <yanaijie@huawei.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, mikita.lipski@amd.com, eryk.brol@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20200912022214.3767954-1-yanaijie@huawei.com>
 <8097f391-c62e-5b4d-a1d4-d2661714066e@huawei.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <835292b6-84e5-c4ba-e86a-3c402df91122@amd.com>
Date: Mon, 28 Sep 2020 10:11:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <8097f391-c62e-5b4d-a1d4-d2661714066e@huawei.com>
Content-Language: en-US
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN8PR15CA0024.namprd15.prod.outlook.com
 (2603:10b6:408:c0::37) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.4.135] (165.204.84.11) by
 BN8PR15CA0024.namprd15.prod.outlook.com (2603:10b6:408:c0::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Mon, 28 Sep 2020 14:11:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4c1798ad-f0be-4f7a-c053-08d863b87503
X-MS-TrafficTypeDiagnostic: MWHPR12MB1293:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB12938297F5EAEC0F19C987918C350@MWHPR12MB1293.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rCJIM5/xJ+BnxRT0sP/GCZet/rIOOAVp+Wb1XxjQzi6Vxizp3cjp1D77gzFIwY3VBbplGeKRIwV6u70Cw0LGO3O4izj6FIY9p+OzLYjvixKjtfjnWHAXFOvFTxubn+77jUtTry52qugUWYGDetMGeij5d27SBmNuSqezf3SWbBil5Gd7OppcMGBIp7IjO/4PAF2Kwg+4ocQ0g0ub/1LKVgtXtVAmNZQxuge1XaVll5oYAeGqm0QvwT8sF3lKl1EpzKCRLkfctB5a6VP9bfYScd6Nrxow+L1waQq2SzkpDizoBz9LwQQsNCzIFSQ2HYufEhrH4KY5c5fD3xk2yyelGcILWeTr9mbGP4EwRSUMNivqnaBLKOk2xcgJ5HGbu5pwEE78qVyycg20Asd8CEB2/lklsLa0GGbyeTPlweHsb4qLBXL1fZT9YUBj+als2Y1X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(8936002)(316002)(6486002)(16576012)(86362001)(8676002)(44832011)(66556008)(36756003)(53546011)(52116002)(4326008)(83380400001)(2906002)(66476007)(5660300002)(478600001)(16526019)(31696002)(6666004)(31686004)(956004)(2616005)(66946007)(186003)(26005)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ayGbSU6nLxBa/swkW8zG1Pon5o6Oipxp988Ys+6ZrqfeCJQDXl2LdWU5B+piCg8HmkL1YhwXviK7AvGOTf5krKX8QyCPOFPyNemaLMGwZS8RYLfAmytwh8b7TA8/PPm3btZr+PlMWxdEc3MucEoWiGLxjy14wVUMo8JP20yLoJmFlJxC/tWyzMxn4bV0D6BN4ibSkFwC4dkvTveBFscOcV393PThpT8YLB0GYDQmXkq/qLMQRD5liU/Gb8ak4hNkdsco+DCaK0EOkOCIMbrJv7QXMmlfiQtQ91JRMOQOenpvBJTrkAOhm/5dBfayuMwaCSoeQYU4UDNk+B5bW205g2EDIBURHu9UerQfbOSpSphn1AHKb7iqIgcwPLx4TPWKeVCY1joDICw4LUVSTNWs3/j7QTUdNxu/ghMOD7pBaj0+vL+XHC+NnZJE2NcQxzv6KXpoUO/TOVW0fpP/0ABXVDInI1YBsl/19tqk7t5EfNipjDbiia6xI9IvwipuNKHJpiXE8fzIODOOybDA7iMpzjrKplGs6TsVDA81vqT56YV2PZLQIV96c8ahMtpk0di/E0Zsi1Ay28CAfKgDjgl1oUiz8H5KwIlIaQW7pojvQAgRZ+NevDj3ioTbwZo2edIPUXqTAGLQ7s7m9iCp0Ge6kg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1798ad-f0be-4f7a-c053-08d863b87503
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 14:11:56.3308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3kufXMPcNgCkGkcdZ5u5/8j+fTZWe6ySVT/plh0t6U/Dia8I8cM4FDEIy+ToOH/v3ACUJ+EgySML+SOalRH6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1293
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
Cc: Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOS0yOCAxMDowNiBhLm0uLCBKYXNvbiBZYW4gd3JvdGU6Cj4gcGluZy4uLgo+IAoK
Rml4IGJ5IFl1ZUhhaWJpbmcgaXMgYWxyZWFkeSBtZXJnZWQgZm9yIHRoaXM6Cgpjb21taXQgNzNi
MWFjZDU0ZTEzNjg2ZmJiMDAyYWZkZjg5MmM2NzAxNzdmMGM1NwpBdXRob3I6IFl1ZUhhaWJpbmcg
PHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KRGF0ZTogICBUaHUgU2VwIDEwIDExOjEzOjUyIDIwMjAg
KzA4MDAKCiAgICBkcm0vYW1kL2Rpc3BsYXk6IENyZWF0ZSB0cmlnZ2VyX2hvdHBsdWcgZW50cnkK
CiAgICBBZGQgdHJpZ2dlcl9ob3RwbHVnIGRlYnVnZnMgZW50cnkuCgogICAgRml4ZXM6IDZmNzdi
MmFjNjI4MCAoImRybS9hbWQvZGlzcGxheTogQWRkIGNvbm5lY3RvciBIUEQgdHJpZ2dlcgpkZWJ1
Z2ZzIGVudHJ5IikKICAgIFJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxh
bmRAYW1kLmNvbT4KICAgIFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVh
d2VpLmNvbT4KICAgIFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KCkhhcnJ5Cgo+IOWcqCAyMDIwLzkvMTIgMTA6MjIsIEphc29uIFlhbiDlhpnp
gZM6Cj4+IFRoZSAndHJpZ2dlcl9ob3RwbHVnJyBlbnRyeSBpbiBkZWJ1Z2ZzIGlzIGRlZmluZWQg
YnV0IG5vdCB3aXJlZCB1cC4gVGhpcwo+PiBjYXVzZXMgYSBnY2Mgd2FybmluZyBidWlsZCB3aXRo
IFc9MS4KPj4KPj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtX2RlYnVnZnMuYzoyMDQ1OjM3Ogo+Pgo+PiB3YXJuaW5nOiDigJhkcF90cmln
Z2VyX2hvdHBsdWdfZGVidWdmc19mb3Bz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkCj4+IFstV3Vu
dXNlZC1jb25zdC12YXJpYWJsZT1dCj4+IMKgIDIwNDUgfCBzdGF0aWMgY29uc3Qgc3RydWN0IGZp
bGVfb3BlcmF0aW9ucwo+PiDCoMKgwqDCoMKgwqAgZHBfdHJpZ2dlcl9ob3RwbHVnX2RlYnVnZnNf
Zm9wcyA9IHsKPj4gwqDCoMKgwqDCoMKgIHwKPj4gXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgo+Pgo+PiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IEphc29uIFlhbiA8eWFuYWlqaWVAaHVhd2VpLmNvbT4KPj4gLS0tCj4+
IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVn
ZnMuYyB8IDEgKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X2RlYnVnZnMuYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtX2RlYnVnZnMuYwo+PiBpbmRleCA5NGZjYjA4NjE1NGMuLjk3MmM3ODBiNjI5MyAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1fZGVidWdmcy5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtX2RlYnVnZnMuYwo+PiBAQCAtMjExNSw2ICsyMTE1LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB7ImRzY19waWNfaGVpZ2h0IiwgJmRw
X2RzY19waWNfaGVpZ2h0X2RlYnVnZnNfZm9wc30sCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB7ImRz
Y19jaHVua19zaXplIiwgJmRwX2RzY19jaHVua19zaXplX2RlYnVnZnNfZm9wc30sCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCB7ImRzY19zbGljZV9icGciLCAmZHBfZHNjX3NsaWNlX2JwZ19vZmZzZXRf
ZGVidWdmc19mb3BzfSwKPj4gK8KgwqDCoMKgwqDCoMKgIHsidHJpZ2dlcl9ob3RwbHVnIiwgJmRw
X3RyaWdnZXJfaG90cGx1Z19kZWJ1Z2ZzX2ZvcHN9LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgeyJk
cF9kc2NfZmVjX3N1cHBvcnQiLCAmZHBfZHNjX2ZlY19zdXBwb3J0X2ZvcHN9Cj4+IMKgIH07Cj4+
IMKgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
