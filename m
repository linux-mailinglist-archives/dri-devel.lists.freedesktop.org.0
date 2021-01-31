Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50858309E28
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 18:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C696E093;
	Sun, 31 Jan 2021 17:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2054.outbound.protection.outlook.com [40.107.100.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9496D6E093
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 17:54:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFNifsgP+djBlMV5ai2FepfWXdDFNHbZKJHSq+DWj3r98cZl3rz5uY/romVJMq7BKTqiHnF9HR5B/qUtavXgyUJ7yGgEzRe2dHOgBJ/Rms0fJaDEzF2NH39kQpF+VK5MTopQQVNDWgSkfyNJowipx/NAroL9OziEAWo83G3SNBZzESN/xyQvVbaRfp2Wd7hUFZj4O4xrhcJceuYUZogf+NM/ebmxBKRAWlbOben5TEZQNMtx4ogXIHZTAoLNxe+zJrVROzdTNTv0QRmphxnGXhYd+nQIqzyQjRSNqDRK5oPdIxLUSmrC/Hzgx6GFWg/nPz/7OOYY/H4w9LcQTyLzbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNQVbBYv/+xW1ahOMYeSDDnRf20eEm8aexPlXXMNbLo=;
 b=RFh2eTTcQ71KbfFG72tGBrSy08FacrFypRMSY6iLK8VCdHuoYx76IL9OncLqHmqT0W2sf0Zoyp8ZS+6i5rWQ2KIK4idyryro6brYyBnIGkcDtQ9qFi257XGpJQtPE21BM4Fbdkio6HSsuZW/MFFhxcgbTft6/NCiRFFI/mEcfyMt0+1poMXfpaFtiTCKS+MhJw6zRKhVvKrA/6kjr6VyohhRyetTc7oD7Z6966FMvjMPC0mSGJvi9tvwczQHWReWrmM8EtYEUZbwZ+2PJf8uwGoSp4tdvrzAROfSDDHlnyNEdXaXFqaRPFunkI3dd4C+NrHKwigmf5puG6MdA525iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNQVbBYv/+xW1ahOMYeSDDnRf20eEm8aexPlXXMNbLo=;
 b=a+21mEGmPirs9SNRZdvEYzqdd+cXGmFYggFbOZh5stnGyi7wDh60x8qx2+rqzcK+/Gfq9Q3DOc4fc134ZTuC8qzRzGqnCSDQPcMx5ApWfaNmXGeW4Kbgx+zKNlcgVDc8d85AsacK46nyfcslaNeTqP+iErf1haw3OqLA4WbnTFM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.23; Sun, 31 Jan
 2021 17:54:03 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3805.024; Sun, 31 Jan 2021
 17:54:03 +0000
Subject: Re: [PATCH 08/29] dma-buf: Avoid comma separated statements
To: Joe Perches <joe@perches.com>, Jiri Kosina <trivial@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <cover.1598331148.git.joe@perches.com>
 <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
 <a87b95d11c22d997ebc423bba71cabef15ca0bac.camel@perches.com>
 <4d5891b7-ea87-974e-d260-f78c3af326bc@amd.com>
 <004fa2c0c74bb26d6144198552c8bae33a57be2e.camel@perches.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cc136d2e-687f-3b82-ae67-8206bd3a860f@amd.com>
Date: Sun, 31 Jan 2021 18:53:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <004fa2c0c74bb26d6144198552c8bae33a57be2e.camel@perches.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0902CA0021.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0902CA0021.eurprd09.prod.outlook.com (2603:10a6:200:9b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend
 Transport; Sun, 31 Jan 2021 17:54:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2627e0b2-306d-4538-c157-08d8c61131f4
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-Microsoft-Antispam-PRVS: <MN2PR12MB367851EE41F6CC5DDAA3770783B79@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d3C5IW+/Xn6ciC7tTebSRlBnBQgV5JnmR3ANw7NPx9MZTCBL/GqUtNFN4+XEUk78Cw9zqmzdcCLK7abMZ24DkoM5ml+KvehFg9cIAm8hxoBZ5PnWCpI+k/HcNGVKH6yzx/bu/BRg4XOPYRQV8KrKgy54n6o9mWikLvA7BJu/8HJJbSbVbEa5CKmYlWFPPgGoBuwcpgI5nAg87g5wXwZ9nmpC3pd8s209zsE8mCXJgJs/phjROX0xO21Ia05uBDjRNTJEJAaGoWzQycoglHp+4h3r/NaHxpbEFDeoteTdue11as/m8o8yPP4u9FWI6Z5qtVhrPFgHN8vPZ/Xg9AOdbSERkaLiN2vb+Nbw1nERBqAhcys9ZMG97w+NFnpWlYYkza/eeNz4BfTatfqEisR1gPkKtSDW3rkQVKd+/+hCRvfewsWUEndEzjeQOeeOQYOlttFlIo7xuO7aJt/deq4Lk3K9sVIquBKPcpo3KXKinAibBxm4lhpXhFRlfQRS6sD4U8ES4TqYfSsSyThb8J0m9FjKgJjMifEefWZ62bhGfrI7F5XYCIdaVnyDXW4RSGlZrA+KtBAkXhHuvgfzfr4H+nrOHmJD9vAyGjbQqaiZ8pE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39850400004)(376002)(366004)(346002)(5660300002)(6666004)(66946007)(66476007)(66556008)(16526019)(316002)(110136005)(83380400001)(186003)(2616005)(52116002)(86362001)(31696002)(4326008)(478600001)(8936002)(8676002)(31686004)(36756003)(6486002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QVVva1ZoekJmUkdldmhVUEROQ3I2VFJpQjhYaVp6T0tXTS9mbVVzYlhuaU5n?=
 =?utf-8?B?dFhwUGxKYVNoVWtMdm1oaXBHNERLRi8vdlg3ZTA3ZS9WaTBGQzB0R1R2M0lt?=
 =?utf-8?B?WEc2TzZxbnBnaTBadlhpM2hZOTFNSWt0ZkQwY3RlbTQwdENlWDNjVmF5aVJI?=
 =?utf-8?B?SXRSWFBzaWdYN3hiQXFhaG1RSThneVlUSzR5eWFVNUY4N1VCZUpPTTU3UWZn?=
 =?utf-8?B?STBUNXZ4SUhlbkc0TzVYK3kyVVhST202YStwaG4vQW1TSTNyMUdlaVJYR1Ez?=
 =?utf-8?B?S1ozNjlGVmYwbERVOE9oMEJDRlFEcGxseVd1S0tXOEU5dTBYYVVDVlBrUGh6?=
 =?utf-8?B?SWgxSmxTNFNTRzBCcENxM3BLVEF6QmtmemlEZ2o0TDFGR1JBZ2MwdWpyb2pr?=
 =?utf-8?B?Q2UrRXYreFFMR3IrTzNGTFpkRnpmZ0F0NkYrNE9CR1VRK1VvUDBjdWxIbTJ2?=
 =?utf-8?B?ODBRZDUxeG5zaEo3Sk1LT1JvZmhsaHFEQXdqSGMrRFVNVStMSE1WTmt0MW1y?=
 =?utf-8?B?V2dyTTl2YWZzT3BPdnhLd0dRNUk4K3lnK2luaFZjb1VtanE5SkZuQ1VTNGtt?=
 =?utf-8?B?UGhyRmNNM0xNR2RpREN6alJKV1g3RUNiWlg3N0FxcG5sRldlMHNDTllGSnpn?=
 =?utf-8?B?bFp4ZWpjTjhkd3pOWGVqQi91RjMyNnJIZHptRk9CbUsrckIyT0hxdDhWSHht?=
 =?utf-8?B?dGZmTWkzQlB3MGtVMk50bVBIdjZyMFpvSUZteWI1NlpLMUliOG1pQ0JoVmRF?=
 =?utf-8?B?SVZpK1dFYlhLRXpvckRaNGlQUkEzQmhUakIyMjdRRG9veEFwS09XTFczcnFT?=
 =?utf-8?B?ZllCNkx6V0NoVjloem5SSUFqbGphQ1dKRk15ak13WHo5UHRldmkzZVF6V1p4?=
 =?utf-8?B?ZG05QWpGRkZCWkhJVFVDaHZXc3JXNjg2SUJPQ2xxZ1g2VjdiTDUzUXh0Sisv?=
 =?utf-8?B?Q3RqS3c4dUxNN1JUSjBpQTFDVFRpNzAwdEZoMW5LY0RUVDlJTjNqVFlUZG4x?=
 =?utf-8?B?TGZhclorNVJONUlKNHdZbnR1NXRDMldWTDRnZEgzMGZwdWtFYzlQZnlIWERS?=
 =?utf-8?B?THRoQUhSS2RWdEN0djlQa3AvdGJuZ092WllZVVNHb1VFcnVkU2V5NVB1KzE0?=
 =?utf-8?B?T0lNVVhPZS8rdkFSY2trNlp6K3FrelZvYTVWL1pSNWFQYWlXd205dEpLQ011?=
 =?utf-8?B?aUV0Kzh2dURpQVpUN0tGeXpWclB6S3R5WDRXdDNiTWxMWHZ4NHdzS09yV041?=
 =?utf-8?B?WUU0SkFabE1SK1JCUEVqYXdvVVdGSEQ0UnB1SUNOT0V6UktTMU1rL3crejl0?=
 =?utf-8?B?elJ6d1U2Szk4bnpDdGlKOXpuNUdpeDdjNVFNcDFmYWQ4UXhTb0dxOFFSdlZP?=
 =?utf-8?B?RlZGeUF2MnozWmxrTDU2bktHRGM1V0dPOUhlY1NyQXpDQU0ySlc3WFVxSm44?=
 =?utf-8?B?eU1zdkpyMlh1ZGRSYXlMdUVpT2JVZndlSjh1L0dQbFNjWU5CTFRGWFd3WG0z?=
 =?utf-8?Q?BnvDsZTf5JozZ6qHk7y1SYa0Hjo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2627e0b2-306d-4538-c157-08d8c61131f4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2021 17:54:02.9501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4pmBHcin/s9CK/O6Y9IXSOk6K6ydcRju6L/5PvDevM2lABZqlx4mxhmo+JEEI8O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzEuMDEuMjEgdW0gMTg6Mzkgc2NocmllYiBKb2UgUGVyY2hlczoKPiBPbiBXZWQsIDIwMjEt
MDItMDMgYXQgMTQ6MjYgKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDMwLjAx
LjIxIHVtIDE5OjQ3IHNjaHJpZWIgSm9lIFBlcmNoZXM6Cj4+PiBPbiBNb24sIDIwMjAtMDgtMjQg
YXQgMjE6NTYgLTA3MDAsIEpvZSBQZXJjaGVzIHdyb3RlOgo+Pj4+IFVzZSBzZW1pY29sb25zIGFu
ZCBicmFjZXMuCj4+PiBQaW5nPwo+Pj4+IFNpZ25lZC1vZmYtYnk6IEpvZSBQZXJjaGVzIDxqb2VA
cGVyY2hlcy5jb20+Cj4+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cj4+Cj4+IERvIHlvdSBoYXZlIGNvbW1pdCByaWdodHMgdG8gZHJtLW1p
c2MtbmV4dD8KPiBOby4KClB1c2hlZC4KClRoYW5rcyBmb3IgdGhlIGhlbHAsCkNocmlzdGlhbi4K
Cj4KPj4+PiAtLS0KPj4+PiAgwqDCoGRyaXZlcnMvZG1hLWJ1Zi9zdC1kbWEtZmVuY2UuYyB8IDcg
KysrKystLQo+Pj4+ICDCoMKgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvc3QtZG1hLWZl
bmNlLmMgYi9kcml2ZXJzL2RtYS1idWYvc3QtZG1hLWZlbmNlLmMKPj4+PiBpbmRleCBlNTkzMDY0
MzQxYzguLmM4YTEyZDdhZDcxYSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvc3Qt
ZG1hLWZlbmNlLmMKPj4+PiArKysgYi9kcml2ZXJzL2RtYS1idWYvc3QtZG1hLWZlbmNlLmMKPj4+
PiBAQCAtNDcxLDggKzQ3MSwxMSBAQCBzdGF0aWMgaW50IHRocmVhZF9zaWduYWxfY2FsbGJhY2so
dm9pZCAqYXJnKQo+Pj4+ICDCoMKgCQkJZG1hX2ZlbmNlX3NpZ25hbChmMSk7Cj4+Pj4KPj4+PiAg
wqDCoAkJc21wX3N0b3JlX21iKGNiLnNlZW4sIGZhbHNlKTsKPj4+PiAtCQlpZiAoIWYyIHx8IGRt
YV9mZW5jZV9hZGRfY2FsbGJhY2soZjIsICZjYi5jYiwgc2ltcGxlX2NhbGxiYWNrKSkKPj4+PiAt
CQkJbWlzcysrLCBjYi5zZWVuID0gdHJ1ZTsKPj4+PiArCQlpZiAoIWYyIHx8Cj4+Pj4gKwkJICAg
IGRtYV9mZW5jZV9hZGRfY2FsbGJhY2soZjIsICZjYi5jYiwgc2ltcGxlX2NhbGxiYWNrKSkgewo+
Pj4+ICsJCQltaXNzKys7Cj4+Pj4gKwkJCWNiLnNlZW4gPSB0cnVlOwo+Pj4+ICsJCX0KPj4+Pgo+
Pj4+ICDCoMKgCQlpZiAoIXQtPmJlZm9yZSkKPj4+PiAgwqDCoAkJCWRtYV9mZW5jZV9zaWduYWwo
ZjEpOwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
