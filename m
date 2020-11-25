Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E53A2C3D77
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 11:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27766E895;
	Wed, 25 Nov 2020 10:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA0D6E88F;
 Wed, 25 Nov 2020 10:13:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eB4KlmHWD4/8pGUI0488trDWogEowCJL/3pMxbtiT7DBYGs9ByroqizdlbqsOol5JSpDvA9RsFADr4Nnlbm1Rnyib636NaAkyo25MHzqWCaeLNseX2DSzIzDM0/1SF4p44u2+qlrvsEVRAwvfxl2Sx58fe99igRzKstfp+qIRnT0PG3gnC7HAjdHtvqvrMBlrrNokkZuB+udKf5r/joeUHO7ZGAcEuLe7p8EyBEf6ZUJtijSa8aL0Djv51qOnPjvCT8+67Lv8opJu9onBC5D52tssE9/QuGoSz6wPCPVKsGm4H0tDBHH/hHHY4OkQSPd1IcqWefLX02gzI7Niqby+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPafxTVAsQyhGOLvN90Hw9hMFQsNPN84bt3trl09qGE=;
 b=aULcHlIz1XgZoJacxreHxG+qRDMMB5rHTFnsRqnqLJbUzDT2NLGknrmePprA+czA4FwBzFvFVg1E+NTx8pXUi3CFamRQ54JbBD6P2jyx/wWweGxYYmSUpPevNTkZYlut4WfG8Iu5Gr2JdAZDQBF7lxnoLIWIHqbPwKdcrOjTSaWGDBMnz6myR5i4gtdT97OddWQm361A9pL4BKEeQHsyVBMbqug93LYc2+vHzlAMVlTeLdjv5/5Ojb8p2j5tz+BGJCPMCpLNJVrgXwp12zMVCeRQz2MjIj5ulLznA0FZhUNpY5V65YXKVwIOm5airjTa4UlyCqQbsRpvtYxajUCfIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPafxTVAsQyhGOLvN90Hw9hMFQsNPN84bt3trl09qGE=;
 b=XWJVufQuqP1RSODixzJMYJOi3SzT5ZfhWufdS1rueeyG1l9SYQRGK0En6QYzect1jB5p5TxPia3+FelKOvjwSdPTORFTjK8+eAMWj9lFPJSEWEqofOgA1FocRSdJ1PuhxQntBzwIB4K3sEArUPIFX3KpGDYwlbdmsNV4rdhnpmQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Wed, 25 Nov
 2020 10:13:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 10:13:19 +0000
Subject: Re: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
References: <3daf9b24-034a-9791-ce30-9f5eba66e7c1@amd.com>
 <516877c4-3718-1415-9901-62bffdbf26c8@suse.de>
 <f5cfbae9-ba51-dce0-4398-2969971ffc99@amd.com>
 <94fa26eb-d899-8c83-9325-84532639d438@suse.de>
 <6319ba4d-f45f-77ec-8752-33f3cad443fd@amd.com>
 <d1508c4f-df3e-fa3c-3071-d8a58295e674@suse.de>
 <cbfa3e8d-81a3-5620-d4fc-72188cfb42ee@amd.com>
 <6d2ee787-0bf5-de1d-73af-7c87bad63cda@suse.de>
 <2431a0e1-7159-b3e7-e1ca-3e7f55c38d8a@amd.com>
 <b356ee3d-64bd-30c9-23f6-dea3a1b87bea@suse.de>
 <20201124140937.GK401619@phenom.ffwll.local>
 <278a4498-bdde-402a-1cea-668e9683f7eb@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2f8a252a-5413-4b75-a367-f6233121e36e@amd.com>
Date: Wed, 25 Nov 2020 11:13:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <278a4498-bdde-402a-1cea-668e9683f7eb@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0022.eurprd04.prod.outlook.com
 (2603:10a6:208:122::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0022.eurprd04.prod.outlook.com (2603:10a6:208:122::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24 via Frontend
 Transport; Wed, 25 Nov 2020 10:13:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ad9a739e-953b-4d4b-0335-08d8912abb12
X-MS-TrafficTypeDiagnostic: MN2PR12MB4319:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB431957A9E7F5A5883BE50A8A83FA0@MN2PR12MB4319.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1o1Pw6e79UKRNzihQO1+hkobFNOqERDyZgC+x3zso2O1txMpnewUDO78KwNc3I9pFdj6kxEIRm7TcjpReLfINHShSp2Y0PFXewA2Xbmq8GMoOE48l/ptjQCmVudpUZr2s2jahorgGXeo6yPKafI/YLKkwm50QaNU94gwh0M49HElgv9P5Ayq13PKnLnKEfOiH8pO08kFswawNs499zUdYlJCdZtqfc1xLPgRD6Priye2jz6csILE0KIYsrGnWnv3eEe5mOI9JDbJEeLhS+/U42AxZ0wIlo28ooEMj/mqmsIfr6c1syCEsjuEezVAftxyd30MyDlHRAbp3lLsOIMunKfY3eS//Ol4EFYqq2zbT38G4bf0B9hXNUqm4a1LXh8I2d+xDor82axgfJ3RBaVNtH24h6RwGiDN5NfAsKVBod8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(346002)(136003)(366004)(376002)(8936002)(66574015)(316002)(86362001)(5660300002)(2906002)(110136005)(186003)(6666004)(66476007)(66556008)(52116002)(16526019)(83380400001)(8676002)(6486002)(36756003)(966005)(2616005)(4326008)(31696002)(478600001)(31686004)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eWNzRXpKSXJldFVTS2dnb3RaWHFTRFFHMVROaWltWTlLenExeXhVR3VqSXBa?=
 =?utf-8?B?emZTbDVpSU9SYXNSei9uTklPQ0NRekJENi9WV05Ka3BqQjg4L0VNY0J2aDhs?=
 =?utf-8?B?TnNHalVzNEdIK3RYdTVUUTAyUkFwRjhNcmN1aHN5RytSd3phSzdJNUM5VW5s?=
 =?utf-8?B?TzJEWmhySlc0YzU1MHdrZ2VZeUtBckNFTzIxMGZmSWhPakllajNRQ1pwOHFK?=
 =?utf-8?B?UlVSemdPMWFjNG5iZUNKZXArTHVhTHRibkd0Wm9BbjVZcCtncStPRVcxNEVY?=
 =?utf-8?B?TXNZTWNBWC80bTVkNTJRY0VBWk4vZFFiQTluUGMySVp0dzV0UXZDQ1RWYlg0?=
 =?utf-8?B?dkpsa0p6ZUNIWUFhb0IyaHB2MVkxa0NpZGpXUERqNlBveUpDbGJ4T0dHMnFU?=
 =?utf-8?B?cjk2UVBpWXFEaHhWQWNoLzFWSjlNc0xDWEVDN3kyVDkrdzNISmJleUNYaXhU?=
 =?utf-8?B?NkE3bEovU3JwdFRpSU1peWFiREZWTml2ZjZwaFl5enJKQmNneENxdGtoaEFW?=
 =?utf-8?B?Z1g1U2hhVTVmOEY5VVQycE1vejhuV1puakZST204YWMzSXdLN2krMS9WdWty?=
 =?utf-8?B?bjUwcU9lWUhmTE5udE5aZ0tDVDdydWZPSzFTQUVRRFJoZFh0Y05aVUQxQnQ5?=
 =?utf-8?B?ZldBSTBDd01may81VzRvamQ4SVUzYTNrUnYzS2FPU2pMYUNHYkkvVDVaUUxV?=
 =?utf-8?B?YzFHeWhGb1M3SGlQTGFKQ1NQUXRmMi9wUzlXdktxdU9kaHlweCt2bmNmaERI?=
 =?utf-8?B?VFNGNjM2K0NSQjVHdWRYNW9WUTcvTzRkNlM3TUdVUzBjaTBKb21pSHF0c2Zk?=
 =?utf-8?B?VlYwUzBrZzlxWmVZbFFMcENPWlJiS290Vm9zUjkxcGMyVTQwZWs3TFNtNjBO?=
 =?utf-8?B?Y2VxTE15NUpUVngxV1ExMlhmbndEZ0I0bk5VQzJQWmFEblVJUDFZa21vc3dm?=
 =?utf-8?B?dnJNTWhTUitTNUx0NU5qZTFJSW56WDNrTmtZK0NKVFkrRkE4NUVBZHFDMkxJ?=
 =?utf-8?B?WUpOS2RTMDJ3V29sNjE4OW84M3p3cE8zTUVPcHlrQUkyWUg4Nm9keU9rUE5C?=
 =?utf-8?B?c0VwQVZOM20yelIxaU9RdXFFZ0xPc3NkUUZFcU5jTGFBbVlFWlFLM1ZoV2Za?=
 =?utf-8?B?eXpwajM1TnBWams0Vyt5SHpxMUhUdDRsbDJEN1JNdGQ1MUUxcmhOcEk1d25F?=
 =?utf-8?B?cWJNQlE3dHM0dWtwY0E0MU82ZGpkalpPRkFLZmRWbEdFa3pDbC92cFFBcmVS?=
 =?utf-8?B?M2owWnZOenBPVXlyTkZxY1M1STJLWHRNRUthcGhDOHJ4NzBaaVJrNXNRYmZo?=
 =?utf-8?B?bTdneCtRRm9zL2NFMjRzOUh0OWNUSXF6NERRdFFiN3lQQk1MMzhVV2o1NG5l?=
 =?utf-8?B?cEpaeFh1RVlsa3Vta0o5c1UvcmwwSDNmTzBOY1lINmUvTnk2QmhQWHNtaGQ5?=
 =?utf-8?Q?Y70aYW5C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9a739e-953b-4d4b-0335-08d8912abb12
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 10:13:19.0176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/XoVayf4L+H7sYOeem4IL+SevTLNizv5t2PhhrZBr7C9ykGkFT0JqTeAdfG0L48
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319
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
Cc: airlied@linux.ie, alexander.deucher@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMTEuMjAgdW0gMDk6Mzcgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaQo+Cj4g
QW0gMjQuMTEuMjAgdW0gMTU6MDkgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+PiBPbiBUdWUsIE5v
diAyNCwgMjAyMCBhdCAwMjo1Njo1MVBNICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToK
Pj4+IEhpCj4+Pgo+Pj4gQW0gMjQuMTEuMjAgdW0gMTQ6MzYgc2NocmllYiBDaHJpc3RpYW4gS8O2
bmlnOgo+Pj4+IEFtIDI0LjExLjIwIHVtIDEzOjE1IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46
Cj4+Pj4+IFtTTklQXQo+Pj4+Pj4+Pj4gRmlyc3QgSSB3YW50ZWQgdG8gcHV0IHRoaXMgaW50bwo+
Pj4+Pj4+Pj4gZHJtX2dlbV90dG1fdm1hcC92dW5tYXAoKSwgYnV0IHRoZW4gd29uZGVyZWQgd2h5
Cj4+Pj4+Pj4+PiB0dG1fYm9fdm1hcCgpIGRvZSBub3QgYWNxdWlyZSB0aGUgbG9jayBpbnRlcm5h
bGx5Pwo+Pj4+Pj4+Pj4gSSdkIGV4cGVjdCB0aGF0IHZtYXAvdnVubWFwIGFyZSBjbG9zZSB0b2dl
dGhlciBhbmQKPj4+Pj4+Pj4+IGRvIG5vdCBvdmVybGFwIGZvciB0aGUgc2FtZSBCTy4KPj4+Pj4+
Pj4KPj4+Pj4+Pj4gV2UgaGF2ZSB1c2UgY2FzZXMgbGlrZSB0aGUgZm9sbG93aW5nIGR1cmluZyBj
b21tYW5kIHN1Ym1pc3Npb246Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IDEuIGxvY2sKPj4+Pj4+Pj4gMi4g
bWFwCj4+Pj4+Pj4+IDMuIGNvcHkgcGFydHMgb2YgdGhlIEJPIGNvbnRlbnQgc29tZXdoZXJlIGVs
c2Ugb3IgcGF0Y2gKPj4+Pj4+Pj4gaXQgd2l0aCBhZGRpdGlvbmFsIGluZm9ybWF0aW9uCj4+Pj4+
Pj4+IDQuIHVubWFwCj4+Pj4+Pj4+IDUuIHN1Ym1pdCBCTyB0byB0aGUgaGFyZHdhcmUKPj4+Pj4+
Pj4gNi4gYWRkIGhhcmR3YXJlIGZlbmNlIHRvIHRoZSBCTyB0byBtYWtlIHN1cmUgaXQgZG9lc24n
dCBtb3ZlCj4+Pj4+Pj4+IDcuIHVubG9jawo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGF0IHVzZSBjYXNl
IHdvbid0IGJlIHBvc3NpYmxlIHdpdGggdm1hcC92dW5tYXAgaWYgd2UKPj4+Pj4+Pj4gbW92ZSB0
aGUgbG9jay91bmxvY2sgaW50byBpdCBhbmQgSSBob3BlIHRvIHJlcGxhY2UgdGhlCj4+Pj4+Pj4+
IGttYXAva3VubWFwIGZ1bmN0aW9ucyB3aXRoIHRoZW0gaW4gdGhlIG5lYXIgdGVybS4KPj4+Pj4+
Pj4KPj4+Pj4+Pj4+IE90aGVyd2lzZSwgYWNxdWlyaW5nIHRoZSByZXNlcnZhdGlvbiBsb2NrIHdv
dWxkCj4+Pj4+Pj4+PiByZXF1aXJlIGFub3RoZXIgcmVmLWNvdW50aW5nIHZhcmlhYmxlIG9yIHBl
ci1kcml2ZXIKPj4+Pj4+Pj4+IGNvZGUuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEh1aSwgd2h5IHRoYXQ/
IEp1c3QgcHV0IHRoaXMgaW50bwo+Pj4+Pj4+PiBkcm1fZ2VtX3R0bV92bWFwL3Z1bm1hcCgpIGhl
bHBlciBhcyB5b3UgaW5pdGlhbGx5Cj4+Pj4+Pj4+IHBsYW5uZWQuCj4+Pj4+Pj4KPj4+Pj4+PiBH
aXZlbiB5b3VyIGV4YW1wbGUgYWJvdmUsIHN0ZXAgb25lIHdvdWxkIGFjcXVpcmUgdGhlIGxvY2ss
Cj4+Pj4+Pj4gYW5kIHN0ZXAgdHdvIHdvdWxkIGFsc28gYWNxdWlyZSB0aGUgbG9jayBhcyBwYXJ0
IG9mIHRoZSB2bWFwCj4+Pj4+Pj4gaW1wbGVtZW50YXRpb24uIFdvdWxkbid0IHRoaXMgZmFpbCAo
QXQgbGVhc3QgZHVyaW5nIHVubWFwIG9yCj4+Pj4+Pj4gdW5sb2NrIHN0ZXBzKSA/Cj4+Pj4+Pgo+
Pj4+Pj4gT2gsIHNvIHlvdSB3YW50IHRvIG5lc3QgdGhlbT8gTm8sIHRoYXQgaXMgYSByYXRoZXIg
YmFkIG5vLWdvLgo+Pj4+Pgo+Pj4+PiBJIGRvbid0IHdhbnQgdG8gbmVzdC9vdmVybGFwIHRoZW0u
IE15IHF1ZXN0aW9uIHdhcyB3aGV0aGVyIHRoYXQKPj4+Pj4gd291bGQgYmUgcmVxdWlyZWQuIEFw
cGFyZW50bHkgbm90Lgo+Pj4+Pgo+Pj4+PiBXaGlsZSB0aGUgY29uc29sZSdzIEJPIGlzIGJlaW5n
IHNldCBmb3Igc2Nhbm91dCwgaXQncyBwcm90ZWN0ZWQgZnJvbQo+Pj4+PiBtb3ZlbWVudCB2aWEg
dGhlIHBpbi91bnBpbiBpbXBsZW1lbnRhdGlvbiwgcmlnaHQ/Cj4+Pj4KPj4+PiBZZXMsIGNvcnJl
Y3QuCj4+Pj4KPj4+Pj4gVGhlIGRyaXZlciBkb2VzIG5vdCBhY3F1aXJlIHRoZSByZXN2IGxvY2sg
Zm9yIGxvbmdlciBwZXJpb2RzLiBJJ20KPj4+Pj4gYXNraW5nIGJlY2F1c2UgdGhpcyB3b3VsZCBw
cmV2ZW50IGFueSBjb25zb2xlLWJ1ZmZlciB1cGRhdGVzIHdoaWxlCj4+Pj4+IHRoZSBjb25zb2xl
IGlzIGJlaW5nIGRpc3BsYXllZC4KPj4+Pgo+Pj4+IENvcnJlY3QgYXMgd2VsbCwgd2Ugb25seSBo
b2xkIHRoZSBsb2NrIGZvciB0aGluZ3MgbGlrZSBjb21tYW5kCj4+Pj4gc3VibWlzc2lvbiwgcGlu
bmluZywgdW5waW5uaW5nIGV0YyBldGMuLi4uCj4+Pj4KPj4+Cj4+PiBUaGFua3MgZm9yIGFuc3dl
cmluZyBteSBxdWVzdGlvbnMuCj4+Pgo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFlvdSBuZWVkIHRvIG1h
a2Ugc3VyZSB0aGF0IHRoZSBsb2NrIGlzIG9ubHkgdGFrZW4gZnJvbSB0aGUgRkIKPj4+Pj4+IHBh
dGggd2hpY2ggd2FudHMgdG8gdm1hcCB0aGUgb2JqZWN0Lgo+Pj4+Pj4KPj4+Pj4+IFdoeSBkb24n
dCB5b3UgbG9jayB0aGUgR0VNIG9iamVjdCBmcm9tIHRoZSBjYWxsZXIgaW4gdGhlIGdlbmVyaWMK
Pj4+Pj4+IEZCIGltcGxlbWVudGF0aW9uPwo+Pj4+Pgo+Pj4+PiBXaXRoIHRoZSBjdXJyZW50IGJs
aXR0ZXIgY29kZSwgaXQgYnJlYWtzIGFic3RyYWN0aW9uLiBpZiB2bWFwL3Z1bm1hcAo+Pj4+PiBo
b2xkIHRoZSBsb2NrIGltcGxpY2l0bHksIHRoaW5ncyB3b3VsZCBiZSBlYXNpZXIuCj4+Pj4KPj4+
PiBEbyB5b3UgaGF2ZSBhIGxpbmsgdG8gdGhlIGNvZGU/Cj4+Pgo+Pj4gSXQncyB0aGUgZGFtYWdl
IGJsaXR0ZXIgaW4gdGhlIGZiZGV2IGNvZGUuIFsxXSBXaGlsZSBpdCBmbHVzaGVzIHRoZSAKPj4+
IHNoYWRvdwo+Pj4gYnVmZmVyIGludG8gdGhlIEJPLCB0aGUgQk8gaGFzIHRvIGJlIGtlcHQgaW4g
cGxhY2UuIEkgYWxyZWFkeSAKPj4+IGNoYW5nZWQgaXQgdG8KPj4+IGxvY2sgc3RydWN0IGRybV9m
Yl9oZWxwZXIubG9jaywgYnV0IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBlbm91Z2guIAo+Pj4gVFRN
IGNvdWxkCj4+PiBzdGlsbCBldmljdCB0aGUgQk8gY29uY3VycmVudGx5Lgo+Pgo+PiBTbyBJJ20g
bm90IHN1cmUgdGhpcyBpcyBhY3R1YWxseSBhIHByb2JsZW06IHR0bSBjb3VsZCB0cnkgdG8gCj4+
IGNvbmN1cnJlbnRseQo+PiBldmljdCB0aGUgYnVmZmVyIHdlIHBpbm5lZCBpbnRvIHZyYW0sIGFu
ZCB0aGVuIGp1c3Qgc2tpcCB0byB0aGUgbmV4dCAKPj4gb25lLgo+Pgo+PiBQbHVzIGF0bSBnZW5l
cmljIGZiZGV2IGlzbid0IHVzZWQgb24gYW55IGNoaXAgd2hlcmUgd2UgcmVhbGx5IGNhcmUgYWJv
dXQKPj4gdGhhdCBsYXN0IGZldyBtYiBvZiB2cmFtIGJlaW5nIHVzZWFibGUgZm9yIGNvbW1hbmQg
c3VibWlzc2lvbiAod2VsbCBhdG0KPj4gdGhlcmUncyBubyBkcml2ZXIgdXNpbmcgaXQpLgo+Cj4g
V2VsbCwgdGhpcyBpcyB0aGUgcGF0Y2hzZXQgZm9yIHJhZGVvbi4gSWYgaXQgd29ya3Mgb3V0LCBh
bWRncHUgYW5kIAo+IG5vdXZlYXUgYXJlIG5hdHVyYWwgbmV4dCBjaG9pY2VzLiBFc3BlY2lhbGx5
IHJhZGVvbiBhbmQgbm91dmVhdSAKPiBzdXBwb3J0IGNhcmRzIHdpdGggbG93LSB0byBtZWRpdW0t
c2l6ZWQgVlJBTS4gVGhlIE1pQnMgd2FzdGVkIG9uIGZiZGV2IAo+IGNlcnRhaW5seSBtYXR0ZXIu
Cj4KPj4KPj4gSGF2aW5nIHRoZSBidWZmZXIgcGlubmVkIGludG8gc3lzdGVtIG1lbW9yeSBhbmQg
dHJ5aW5nIHRvIGRvIGEgCj4+IGNvbmN1cnJlbnQKPj4gbW9kZXNldCB0aGF0IHRyaWVzIHRvIHB1
bGwgaXQgaW4gaXMgdGhlIGhhcmQgZmFpbHVyZSBtb2RlLiBBbmQgaG9sZGluZwo+PiBmYl9oZWxw
ZXIubG9jayBmdWxseSBwcmV2ZW50cyB0aGF0Lgo+Pgo+PiBTbyBub3QgcmVhbGx5IGNsZWFyIG9u
IHdoYXQgZmFpbHVyZSBtb2RlIHlvdSdyZSBzZWVpbmcgaGVyZT8KPgo+IEltYWdpbmUgdGhlIGZi
ZGV2IEJPIGlzIGluIFZSQU0sIGJ1dCBub3QgcGlubmVkLiAoTWF5YmUgWG9yZyBvciAKPiBXYXls
YW5kIGlzIHJ1bm5pbmcuKSBUaGUgZmJkZXYgQk8gaXMgYSBmZXcgTWlCcyBhbmQgbm90IGluIHVz
ZSwgc28gVFRNIAo+IHdvdWxkIHdhbnQgdG8gZXZpY3QgaXQgaWYgbWVtb3J5IGdldHMgdGlnaHQu
Cj4KPiBXaGF0IEkgaGF2ZSBpbiBtaW5kIGlzIGEgY29uY3VycmVudCBtb2Rlc2V0IHRoYXQgcmVx
dWlyZXMgdGhlIG1lbW9yeS4gCj4gSWYgd2UgZG8gYSBjb25jdXJyZW50IGRhbWFnZSBibGl0IHdp
dGhvdXQgcHJvdGVjdGluZyBhZ2FpbnN0IGV2aWN0aW9uLCAKPiB0aGluZ3MgZ28gYm9vbS4gU2Ft
ZSBmb3IgY29uY3VycmVudCAzZCBncmFwaGljcyB3aXRoIHRleHR1cmVzLCBtb2RlbCAKPiBkYXRh
LCBldGMuCgpDb21wbGV0ZWx5IGFncmVlLgoKVGhpcyBuZWVkcyBwcm9wZXIgbG9jayBwcm90ZWN0
aW9uIG9mIHRoZSBtZW1vcnkgbWFwcGVkIGJ1ZmZlci4gUmVseWluZyAKb24gdGhhdCBzb21lIG90
aGVyIGNvZGUgaXNuJ3QgcnVuIGJlY2F1c2Ugd2UgaGF2ZSBzb21lIHRoaXJkIHBhcnQgbG9ja3Mg
CnRha2VuIGlzIG5vdCBzdWZmaWNpZW50IGhlcmUuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4g
QmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPj4KPj4+IFRoZXJlJ3Mgbm8gcmVjdXJzaW9uIHRha2lu
ZyBwbGFjZSwgc28gSSBndWVzcyB0aGUgcmVzZXJ2YXRpb24gbG9jayAKPj4+IGNvdWxkIGJlCj4+
PiBhY3F1aXJlZC9yZWxlYXNlIGluIGRybV9jbGllbnRfYnVmZmVyX3ZtYXAvdnVubWFwKCksIG9y
IGEgc2VwYXJhdGUgCj4+PiBwYWlyIG9mCj4+PiBEUk0gY2xpZW50IGZ1bmN0aW9ucyBjb3VsZCBk
byB0aGUgbG9ja2luZy4KPj4KPj4gR2l2ZW4gaG93IHRoaXMgImRvIHRoZSByaWdodCBsb2NraW5n
IiBpcyBhIGNhbiBvZiB3b3JtcyAoYW5kIEkgdGhpbmsgCj4+IGl0J3MKPj4gd29yc2UgdGhhbiB3
aGF0IHlvdSBkdWcgb3V0IGFscmVhZHkpIEkgdGhpbmsgdGhlIGZiX2hlbHBlci5sb2NrIGhhY2sg
aXMKPj4gcGVyZmVjdGx5IGdvb2QgZW5vdWdoLgo+Pgo+PiBJJ20gYWxzbyBzb21ld2hhdCB3b3Jy
aWVkIHRoYXQgc3RhcnRpbmcgdG8gdXNlIGRtYV9yZXN2IGxvY2sgaW4gZ2VuZXJpYwo+PiBjb2Rl
LCB3aGlsZSBtYW55IGhlbHBlcnMvZHJpdmVycyBzdGlsbCBoYXZlIHRoZWlyIGhhbmQtcm9sbGVk
IGxvY2tpbmcsCj4+IHdpbGwgbWFrZSBjb252ZXJzaW9uIG92ZXIgdG8gZG1hX3Jlc3YgbmVlZGxl
c3NseSBtb3JlIGNvbXBsaWNhdGVkLgo+PiAtRGFuaWVsCj4+Cj4+Pgo+Pj4gQmVzdCByZWdhcmRz
Cj4+PiBUaG9tYXMKPj4+Cj4+PiBbMV0gCj4+PiBodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3Jn
L2RybS9kcm0tdGlwL3RyZWUvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYz9pZD1hYzYw
ZjNmMzA5MDExNWQyMWYwMjhiZmZhMmRjZmI2N2Y2OTVjNGYyI24zOTQKPj4+Cj4+Pj4KPj4+PiBQ
bGVhc2Ugbm90ZSB0aGF0IHRoZSByZXNlcnZhdGlvbiBsb2NrIHlvdSBuZWVkIHRvIHRha2UgaGVy
ZSBpcyBwYXJ0IG9mCj4+Pj4gdGhlIEdFTSBvYmplY3QuCj4+Pj4KPj4+PiBVc3VhbGx5IHdlIGRl
c2lnbiB0aGluZ3MgaW4gdGhlIHdheSB0aGF0IHRoZSBjb2RlIG5lZWRzIHRvIHRha2UgYSBsb2Nr
Cj4+Pj4gd2hpY2ggcHJvdGVjdHMgYW4gb2JqZWN0LCB0aGVuIGRvIHNvbWUgb3BlcmF0aW9ucyB3
aXRoIHRoZSBvYmplY3QgYW5kCj4+Pj4gdGhlbiByZWxlYXNlIHRoZSBsb2NrIGFnYWluLgo+Pj4+
Cj4+Pj4gSGF2aW5nIGluIHRoZSBsb2NrIGluc2lkZSB0aGUgb3BlcmF0aW9uIGNhbiBiZSBkb25l
IGFzIHdlbGwsIGJ1dAo+Pj4+IHJldHVybmluZyB3aXRoIGl0IGlzIGtpbmQgb2YgdW51c3VhbCBk
ZXNpZ24uCj4+Pj4KPj4+Pj4gU29ycnkgZm9yIHRoZSBub29iIHF1ZXN0aW9ucy4gSSdtIHN0aWxs
IHRyeWluZyB0byB1bmRlcnN0YW5kIHRoZQo+Pj4+PiBpbXBsaWNhdGlvbnMgb2YgYWNxdWlyaW5n
IHRoZXNlIGxvY2tzLgo+Pj4+Cj4+Pj4gV2VsbCB0aGlzIGlzIHRoZSByZXNlcnZhdGlvbiBsb2Nr
IG9mIHRoZSBHRU0gb2JqZWN0IHdlIGFyZSB0YWxraW5nIAo+Pj4+IGFib3V0Cj4+Pj4gaGVyZS4g
V2UgbmVlZCB0byB0YWtlIHRoYXQgZm9yIGEgY291cGxlIG9mIGRpZmZlcmVudCBvcGVyYXRpb25z
LAo+Pj4+IHZtYXAvdnVubWFwIGRvZXNuJ3Qgc291bmQgbGlrZSBhIHNwZWNpYWwgY2FzZSB0byBt
ZS4KPj4+Pgo+Pj4+IFJlZ2FyZHMsCj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Cj4+Pj4+Cj4+Pj4+IEJl
c3QgcmVnYXJkcwo+Pj4+PiBUaG9tYXMKPj4+Pgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+PiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+Pj4KPj4+IC0tIAo+Pj4gVGhv
bWFzIFppbW1lcm1hbm4KPj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKPj4+IFNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSAo+Pj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55Cj4+PiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCj4+PiBHZXNjaMOk
ZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCj4+Cj4+Cj4+Cj4+Cj4+Cj4+Cj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
