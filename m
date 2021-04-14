Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7802135EF8C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 10:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD486E40A;
	Wed, 14 Apr 2021 08:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABF289F8E;
 Wed, 14 Apr 2021 08:37:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2zQ3looqFAz6acx8fW8OBh4DZAc5cE4UCsuldy/orAtboZ/701K9W4ITy1S6GwYuk+4n3wvJMR67B+2wLWgZwCTq3e1WZOjeL3G4/1P9MolThLT1iu+dHqShwm71mxq2uzmzcq/sRcKoXOGsg4yRaCREQ6QchXQOcPOVxZC8yz44hLZz20jH5Sx/7/QegxFK8MXiUUIh5edcT33cRO9d0m5stduafTABTzJpEntsnqfAV8g00VoMdzRAxItRy5p4ADdtzC3hJ1PpXsdwY2gr2YxxBm7B1+6dyCnV/4E/MBKGHiln6y3l+5ErmdMTra7zyAcuERsBVVOKaAqSQngXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QESO8CWqGFC6r5tHiUs8UYIOrNVYWu3NxdLRsWC0RY4=;
 b=Px6ADsZS1UKv0p1fFK22JxiCa/V+R+8bke8QuDB8pcPk1/L0UPEcrsjoH9PpeqGLa0zOucvr4SNRpWOPVo9JYu6vumt0uuC2Y+I53lqLMs7MfucQRhkkJQhzpkzSMSrIPiQxkAKgZo0LVG/mECssMCX9g0+Nz6ygWJuPIV5bTThU6izSpXvHmop3Q6z11U/ZskbI3siWndlZWRhp9KFaVvNELkCzTQV1uXB8vkW9P9SdFMEABAWkw2aI68v7lRDr/NHJXuifrb4C9OPsvnOcHzTyTfCfqDRsO3xAteznTlrfYm07yTioMOEyeG74tJObUUIke34XgAoFrmix41vjPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QESO8CWqGFC6r5tHiUs8UYIOrNVYWu3NxdLRsWC0RY4=;
 b=pTHwVMTO4NNAJC2vURptkUaBXBKXN2O4WXyBp2pGZdk/z4I1XtcX9M7MZtVGMdhNbJlenGT21tc0rGykgmPxKLXD4ATE6s74lL72yuRkz6YbRUJ89I6WyodpowDypRNx/vGwZah9yXdq54LhEHvMPGDGX2VJIw2AjXVlb7yjhpk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3885.namprd12.prod.outlook.com (2603:10b6:208:16c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 14 Apr
 2021 08:37:29 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 08:37:29 +0000
Subject: Re: [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object function
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com, shashank.sharma@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com, nirmoy.das@amd.com
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-4-tzimmermann@suse.de>
 <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>
 <b76d1922-c9a5-8533-657a-2c1149832347@suse.de>
 <9db18654-770f-459b-a89a-c57dc8a21bac@amd.com>
 <573dca0f-d017-3614-5e4f-d8d0b6bc413f@amd.com>
 <780bb477-77c3-2f3c-2417-edeffccd63b9@amd.com>
 <a152c174-c0fe-fc6f-9fa0-9054ffe415a9@amd.com>
 <63c90815-c9d8-68df-daa1-c165215a6b7c@suse.de>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <f2e3ae0d-083c-c919-74bd-8fedbfad7718@amd.com>
Date: Wed, 14 Apr 2021 04:37:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <63c90815-c9d8-68df-daa1-c165215a6b7c@suse.de>
Content-Language: en-US
X-Originating-IP: [142.182.180.233]
X-ClientProxiedBy: YTOPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::39) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.180.233) by
 YTOPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Wed, 14 Apr 2021 08:37:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1f54c61-1784-4e55-6b92-08d8ff208a0d
X-MS-TrafficTypeDiagnostic: MN2PR12MB3885:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB38859901628E0F01156D6453924E9@MN2PR12MB3885.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hRQKZURuQBDJk2fKHiytj2rderYcvgjwAC91C6m9UTcOsamBj3uMu4StKyoqm0bzfD8DAgpAuV1U+wfahJim6uEd16pWhwanbmowXvS3hss5MXlW/z6cI7dpEZtCTlBRBuxUaoPPUyVYV0sfFKA5GdeyvQPflryq5AxPXbO6nO1lKPPNpGqJmKU12jH4sLwSmWl//R/NaXn13HTBmRA3NmaBBFyu2AOjTRFYosk7/4k5HSqdXVao66+CQn0Kb8exSpSlS3bBf5Auh/JKvkS4hBI18Yk+3wtA1PyBPkwW8vTWS+SgY20XQ66V/KrFKStK/GtFdSnYf3yXb++nlKiM3WzaMocIJaCraULTcROf7IfMvP06XU6wl8hyy+Fekms0vs5cridcJgdpmI1K+Qvh4H5uE17h6MZrLq3/I4Ck+Zx+xbM505sLWYsGmGLiwDLDpT1AHaFqOkYVCG+n/Rg04iSjwl1Rguz57r/buq/vWXSg5qeFxzs8+nbwWzECk37aBAFHX62aDZPqwlWAr0KZQFWJqRxnDEonYbEAIEYatYkp/ysezu0ZpNDwJd/ILjBjEOSe6qBcMqcUQB8rGcab/eeW3Ku5a9h6Ajm7nmEo/+xGjroLLbNAZUZCENGfqRI36x/F+55zeeWJA6xZPUFeQP4E+YQ/oWFVycU2V3Q19tK7l+iJxyFbWrUNZn7Uh03sHZW2W6cqv1Axwmky0SQygAfocC07oBK56tlwWjNUfhfU5zU4PwfKMfSD93bbsi92
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39850400004)(396003)(366004)(346002)(44832011)(8936002)(966005)(36756003)(2906002)(4326008)(921005)(7416002)(16576012)(38100700002)(6636002)(6486002)(478600001)(66556008)(66476007)(66946007)(86362001)(16526019)(186003)(31686004)(2616005)(8676002)(66574015)(5660300002)(53546011)(316002)(26005)(31696002)(110136005)(956004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VEEwUkNmck5obGRqTzVYNjhaSnVSdHAwbTVQblYxTG1RRnVCRnlhUExwSTJl?=
 =?utf-8?B?OUtpcWJDVUZ6Lys1ZFR3aCt5K2RRZElZMW01aWRGR0ZzVFBOTFUxUnY5cFhE?=
 =?utf-8?B?MzhXQUU5WU1WOFhUbmVucGdEN3lWMHR2K3Bzc2Noa2lCWG5XUmg1VWxEZSto?=
 =?utf-8?B?bXVMMmJOUWQrL01QWW1SSG9EOTUzb2t0YStwREJOTXYzMUFMMFJjUlh0ci9x?=
 =?utf-8?B?OER2ekV0M0lxTEF4c2o0WnRkZ1k4ek9DekdiR2xrNnh2OFRDVHlHZHlObGVs?=
 =?utf-8?B?bkNnVGoxQ25WUXlDNCtJbVh5cVo3dkIwaWxzcXVrREM0V1FmVlhaNTY1NHJi?=
 =?utf-8?B?Q3FRc1FCbG1kRGlQcXlMSkxmZTg5ejlXOWxyMDhLMEljaHlnb0FHZ0YzNEY5?=
 =?utf-8?B?d2JXOUkyb3RmSlBGdXNGdlZPNVNXRklRcGVJakQ2NmEvUnlaWmxNeEw1bDA0?=
 =?utf-8?B?cTRIZGRzTllQMHB5SzNPbXhTbHo4dEY4c1QwekdiWVRFczBUUzdwUTBhSW5z?=
 =?utf-8?B?WnRpMWJaNTROTklOVjR5RGwrMnVFaGJrN0kyYnJIdXViN3RpUlhoY016RnQx?=
 =?utf-8?B?cmlZd3BLMEgvcjFhOWV3dy9CcDFBVmt6bXhOcmlsWU51anZQbnRqZDdQQVdm?=
 =?utf-8?B?blpKT2ZGVVpGSUhpNU85dlBlei91Q2NQUlNLUTdlaEx3eDlacGhlR21QMm1I?=
 =?utf-8?B?bkRkTHEvbkYxMUlQYUdWOG5vR3RheW8xVUltZmhTTHlwbGlwWEdwK3ROcmcz?=
 =?utf-8?B?SW5yVnJQWVMzUVloS0RqdXVqek4yVENMeVVLbngrWlRLSE1wU05vQVhWMUNO?=
 =?utf-8?B?S0FxZ1gzbzhCOHpWM1VFK094MWUwSnJsY3NxbnZ6RmV3T1dVT2UxekhqN3p1?=
 =?utf-8?B?UUJBUG9panFmNUVoeDh1Y1pseFJyWHg4YzYwRkk2QlQ5ejVIcS81MXp3RWNv?=
 =?utf-8?B?Ly93aE5hdnhKMUJnUlFRa3AxMXJWNHlicE90VU5qdkFDcGEwMGdaRFJVMmkr?=
 =?utf-8?B?dEdhVk0wcnBrSHFqY05QTHNUelg3SFJNa1JqZG53TlJmQzc3Rmk2aVlVN01m?=
 =?utf-8?B?Q1NnWHlVbFRQMVpiWFlDbjRnYVVhQ0l0anFlYXZuQ3E5TjNBWlJQeElNc3lJ?=
 =?utf-8?B?b1RWTlAyUTZMK1pLNzJyYlVrc1ZZb2lsbUt3M2orNEtCYmRMSHVOekl5ZnZO?=
 =?utf-8?B?L2hDRnl5SUUzRllDSHk4L0MrcFYrWVJzbmlwZUYyMnI3K3NsZTgyejV1ZjRj?=
 =?utf-8?B?MjdhYitpSEcyaXFhQ1FjSk01SnhaWG15cVU2WVlZU1E2cEJVMnZaTlNNU2Rn?=
 =?utf-8?B?d2FiSjBOWWIwMDZNeDhnQlhLYVpKNmpSK2U1bVg0ZzZZZkpnNWc4RjdvOFN3?=
 =?utf-8?B?R0VDRWJ0anIvL3hrZkJVZTVFY015elpmMlZjaDJyRmxJcnBzemV6c1dHR1p5?=
 =?utf-8?B?QkdwOUJCNnpQSUhkVCtiR2FvZXI0c2F0SkhGZHpwV3ZSRi9Md0FnMHJGRDAx?=
 =?utf-8?B?UWtZMWt6R2h4ajI1ZkZsa1NYTkVKN3g1QSs4cDBCbmlKMUwyTHJwSnhzWHRz?=
 =?utf-8?B?aEc5dWdFdUU5Smk5ZGp2RTFkaXdxSmZkWjJPTXZqZG11QllSa0pNa0V2dXNl?=
 =?utf-8?B?TVd2VTl4WjZFODFhQkhKbXZhS2dCcDZaaHZDNjdvMUtWcWpBQ3lHU3lRZkVC?=
 =?utf-8?B?eVVobnpCZWRxYzhqblBzc3RTdTB5ZDlnbmpSUGgzeEQwVmdSTitWSWZLYWMy?=
 =?utf-8?B?QURxa0Zad1NiRVNHTXMxQVFPeHlzd1JrMjFsZmErYlFRWDNWZXVyV2p4akJJ?=
 =?utf-8?B?ZVpwalZKS2pKTEowYXpzQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f54c61-1784-4e55-6b92-08d8ff208a0d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 08:37:29.5794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9A9Tuxk28zNa1Rg451aWf4J38s1SHugBnOuPWhPhLPcXTxD1S9I0eLogWTSnxoFR7dT79wCjb1n1grI1745MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3885
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wNC0xNCB1bSAzOjQ0IGEubS4gc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBI
aQo+Cj4gQW0gMDcuMDQuMjEgdW0gMjE6NDkgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPj4gT24g
MjAyMS0wNC0wNyAzOjM0IHAubS4sIEZlbGl4IEt1ZWhsaW5nIHdyb3RlOgo+Pj4gT24gMjAyMS0w
NC0wNyA3OjI1IGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4+ICvCoMKgwqAg
LyoKPj4+Pj4+Pj4gK8KgwqDCoMKgICogRG9uJ3QgdmVyaWZ5IGFjY2VzcyBmb3IgS0ZEIEJPcy4g
VGhleSAKPiBkb24ndCBoYXZlIGEgR0VNCj4+Pj4+Pj4+ICvCoMKgwqDCoCAqIG9iamVjdCBhc3Nv
Y2lhdGVkIHdpdGggdGhlbS4KPj4+Pj4+Pj4gK8KgwqDCoMKgICovCj4+Pj4+Pj4+ICvCoMKgwqAg
aWYgKGJvLT5rZmRfYm8pCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPj4+Pj4+
PiBXaG8gZG9lcyB0aGUgYWNjZXNzIHZlcmlmaWNhdGlvbiBub3c/Cj4+Pj4+PiBUaGlzIGlzIHNv
bWV3aGF0IGNvbmZ1c2luZy4KPj4+Pj4+Cj4+Pj4+PiBJIHRvb2sgdGhpcyBjaGVjayBhcy1pcywg
aW5jbHVkaW5nIHRoZSBjb21tZW50LCBmcm9tIGFtZGdwdSdzCj4+Pj4+PiB2ZXJpZnlfYWNjZXNz
IGZ1bmN0aW9uLiBUaGUgdmVyaWZ5X2FjY2VzcyBmdW5jdGlvbiB3YXMgY2FsbGVkIGJ5Cj4+Pj4+
PiB0dG1fYm9fbW1hcC4gSXQgcmV0dXJuZWQgMCBhbmQgdHRtX2JvX21tYXAgZGlkIHRoZSBtYXBw
aW5nLgo+Pj4+PiBUaGlzIGlzIHByb2JhYmx5IGEgbGVmdC1vdmVyIGZyb20gd2hlbiB3ZSBtYXBw
ZWQgQk9zIHVzaW5nIC9kZXYva2ZkLiAKPiBXZQo+Pj4+PiBjaGFuZ2VkIHRoaXMgdG8gdXNlIC9k
ZXYvZHJpL3JlbmRlckQqIGEgbG9uZyB0aW1lIGFnbyB0byBmaXggQ1BVCj4+Pj4+IG1hcHBpbmcK
Pj4+Pj4gaW52YWxpZGF0aW9ucyBvbiBtZW1vcnkgZXZpY3Rpb25zLiBJIHRoaW5rIHdlIGNhbiBs
ZXQgR0VNIGRvIHRoZQo+Pj4+PiBhY2Nlc3MKPj4+Pj4gY2hlY2suCj4+Pj4KPj4+PiBPaywgZ29v
ZCB0byBrbm93Lgo+Pj4+Cj4+Pj4gVGhvbWFzIGNhbiB5b3UgcmVtb3ZlIHRoZSBleHRyYSBoYW5k
bGluZyBpbiBhIHNlcGFyYXRlIHByZXJlcXVpc2l0ZQo+Pj4+IHBhdGNoPwo+Pj4+Cj4+Pj4gSWYg
YW55Ym9keSB0aGVuIGJpc2VjdHMgdG8gdGhpcyBwYXRjaCB3ZSBhdCBsZWFzdCBrbm93IHdoYXQg
dG8gZG8KPj4+PiB0byBnZXQgaXQgd29ya2luZyBhZ2Fpbi4KPj4+Cj4+PiBGV0lXLCBJIHJhbiBL
RkRUZXN0IHRlc3Qgd2l0aCB0aGlzIHNob3J0Y3V0IHJlbW92ZWQgb24gY3VycmVudAo+Pj4gYW1k
LXN0YWdpbmctZHJtLW5leHQgKyBteSBITU0gcGF0Y2ggc2VyaWVzLCBhbmQgaXQgZGlkbid0IHNl
ZW0gdG8KPj4+IGNhdXNlIGFueSBpc3N1ZXMuCj4+Cj4+IFdhaXQsIEkgY2VsZWJyYXRlZCB0b28g
c29vbi4gSSB3YXMgcnVubmluZyB0aGUgd3Jvbmcga2VybmVsLiBJIGRvIHNlZQo+PiBzb21lIGZh
aWx1cmVzIHdoZXJlIGFjY2VzcyBpcyBiZWluZyBkZW5pZWQuIEkgbmVlZCB0byBkbyBtb3JlIGRl
YnVnZ2luZyAKPgo+PiB0byBmaWd1cmUgb3V0IHdoYXQncyBjYXVzaW5nIHRoYXQuCj4KPiBBbnkg
bmV3cyBoZXJlPyBJIHNhdyB0aGUgcGF0Y2ggYXQgWzFdLCB3aGljaCByZW1vdmVzIHRoZSBrZmRf
Ym8gdGVzdC4KPiBDYW4gSSBhc3N1bWUgdGhhdCB0aGUgc2VyaWVzIGFkZHJlc3NlcyB0aGUgaXNz
dWU/CgpZZXMsIHRoYXQgc2VyaWVzIGZpeGVzIHRoZSBwcm9ibGVtLiBJIG5lZWQgdG8gcGVzdGVy
IG1vcmUgcGVvcGxlIHRvCnJldmlldyBpdC4KClJlZ2FyZHMsCsKgIEZlbGl4CgoKPgo+IEJlc3Qg
cmVnYXJkcwo+IFRob21hcwo+Cj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9wYXRjaC80Mjc1MTYvP3Nlcmllcz04ODgyMiZyZXY9MQo+Cj4+Cj4+IFJlZ2FyZHMsCj4+IMKg
wqAgRmVsaXgKPj4KPj4KPj4+Cj4+PiBSZWdhcmRzLAo+Pj4gwqAgRmVsaXgKPj4+Cj4+Pgo+Pj4+
Cj4+Pj4gUmVnYXJkcywKPj4+PiBDaHJpc3RpYW4uIAo+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
