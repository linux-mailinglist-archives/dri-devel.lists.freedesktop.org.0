Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AC534951B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 16:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD656EDA0;
	Thu, 25 Mar 2021 15:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BDC6ED94;
 Thu, 25 Mar 2021 15:15:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFGdgnipvncVDp8tR+0bZ+iFc0Aa/Fe74WExk5Y6kelbZdsoxJ/SIgNIK1ucAqilwPMuLlUFxr19GBq+/nuaHDKo24AHXNcDfIXpt5B57fGOUnismmvaCwBD4xIF9D35A4PEJHINH3od2i3ZQP7JPWOiw2KuPPfkNgt1ddU8bcUr2+g68MgStuGzj2UArk3QcSqsYcLmfCgE576gzRsInXaI3ObIfJRrSwBmpvGv69nCEsApLNpLTNyJFmtp3OuX5dksnjsYR3efEVAF8T9c3zPigQtsXdKe6zJAz1B675dbk1J6/BmP60z9529vPPlx43k367BKD1jaeM9wkhul1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5g8Km8Pg25YFNhsXEHye2rR2PBLTHgsNqdzcWH4TzHw=;
 b=k8ZQmQIKvvdtUPHMPT5sRiSM1Q0ThF/rUN/dHnMzwhvAuXckSQpV09Np+NAK5ZhUWo6orn0Ak5+Lt3EKXvCwIW17DSej7VxgV9Y4OVanVqtLxUOrAtW0ARSTpD+5wDJSdwRqeoFy74mnfT4ddygahLS4mZC/0yHjTKWWv8O6qzjH0JH6LQX+FCtE/c04G8+8kjs3udQrhgkP+g1GigewUK4Xplk5n7+ubUx8PPMyUdUFnQOSXGWACFSlFbs7iKF/3F88K6kTBH8F4Nv7JQ1C3Mp8hn2spyimB3veMgkY4zM5A3LxlUn7S7gYLOLItopiU9wWwT53xGvgMqZGC8mKzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5g8Km8Pg25YFNhsXEHye2rR2PBLTHgsNqdzcWH4TzHw=;
 b=BbUqMdq7pdQNUUBtAwBS479Tdk/e1rJn6O/sEY5bBqdN1ddZBBUi6HnBcAN73EeWkt+8wRO8w1DSF8jW8ZFkDz78PAyVd63JdoYE0TQ98yuPDbQ/P4AeUwYSwAWk1+L/XMF26ove+q+HIPuXgOMFs/4mAnjdA7cRT1UMdSMeLJQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4707.namprd12.prod.outlook.com (2603:10b6:208:8a::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 15:15:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3977.029; Thu, 25 Mar 2021
 15:15:00 +0000
Subject: Re: drm/ttm: switch to per device LRU lock
To: Colin Ian King <colin.king@canonical.com>
References: <22ad0b20-b879-bcad-5c94-80c162a9da74@canonical.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <aaef965f-608a-e77d-9a4a-b91951298836@amd.com>
Date: Thu, 25 Mar 2021 16:14:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <22ad0b20-b879-bcad-5c94-80c162a9da74@canonical.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:72d1:2a48:a80e:e149]
X-ClientProxiedBy: AM0PR10CA0079.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:72d1:2a48:a80e:e149]
 (2a02:908:1252:fb60:72d1:2a48:a80e:e149) by
 AM0PR10CA0079.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Thu, 25 Mar 2021 15:14:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 67f27be6-de8a-4171-8778-08d8efa0c1f3
X-MS-TrafficTypeDiagnostic: BL0PR12MB4707:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4707A0F51772F086D7C926F383629@BL0PR12MB4707.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xanag8VqMuT3tGtaP8gpQd6F5RFEm9xJHf9SnpCg874dq1VRwmiFOPXeMgtRsKVFBNwHkW20ybkA8Zq4ViV5iw96f+if645/CoguXvDOlByo60Dpjyw34uASqTRMr9KEWgAIYg9LQkrNpZsmdknm0WnIPECerxxrWTT9Aeum89t53xWPp2J8/pIxr51nlONmNo4OrqD3sdiQ6oYk08L6I0aBaUCokurTc8T0UD2GzaV8LIAmSgoHxT0Y/vBrc2v1TDxa8zDFM/7IIQsNIvmP7IhApSg2iuhJupEHOpOiQD3l6du92ZnUisuYECZzlUTzLUehVF20+Q4PBOGFiLZUqTlzRFmaX3YTdzHEFDf24iYCM0aFfc2WdBuBpecbg6kqaJxko9ZpE2E/gKjiE0uOzibdEufjFis6ZDB8dmwyoHQpPfGcnZCbljNhvNmQgKdo509kboyzbaDiLHxPEPTO9qsurs7U0La2tDmHjWERSoxEKrqEPY67cde51iGkyk2FZqdYXspJpsot4yuT+ax3obZjQ7/aVfBGo2HHZO+VQ5ANfeiwsUyuHYRc0B0Jb03s/lpWe9MvcS5xsQTr2gTadxjpADVaOhAWmIjiHpSUIcyOvr+HneuNeEtaDHcJfshNH4i0RutcmgxOzSvCDGDEhqmOU8Xotwiqgt8UKRAm9vcxF2Ouy1/lNM+WW95khrxQ8iyNhsR5C+TXRKGTxsoM6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(66556008)(66946007)(2906002)(6666004)(38100700001)(6486002)(31686004)(31696002)(66476007)(52116002)(8676002)(36756003)(6916009)(83380400001)(4326008)(2616005)(54906003)(5660300002)(8936002)(86362001)(66574015)(16526019)(478600001)(316002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZlZTUDVmcEpSMXB4VGZhTmZBSHNwSmJIMWhzQzJ4NW5ibHovTkRmTFF3SW10?=
 =?utf-8?B?dEJMTXF0c2N1Ym9wcncvYXlZcTF1Zy9TSVBwcDcxWldvemFMTDBHUVp0Q3FG?=
 =?utf-8?B?cHByenN2RTVzUWdmZ3ZKaUJwT2hXaGR1cndndXRMUE92dnhWdUVtV1F6dzNM?=
 =?utf-8?B?S0drV3JyTjZQNXNPSFViVWZGeXhicW54RDBLSlRKUG41Yk5MUTg0NCtHZUlE?=
 =?utf-8?B?dERPcnM4bmdSa3EzMjdpN2VJaXp4L2k1a3JKYmQ4N2tWRDFmVlBqdzQ2WkdH?=
 =?utf-8?B?RlY3c2pGZ0FRZ1dBaXhPTUZjcnp4L0pOVzZWdUhyOHI3Yy9BU0N5QTNHY0Zo?=
 =?utf-8?B?Y2NXK1ZobzRwVS84em1randwOWN1UFVsYXFvUmJpa0h3cGovdDNnak9rV1dU?=
 =?utf-8?B?Y2RTUEpQbnFmMjNYVGxNaEg3RlV4aDVwUVdBa3M5WmZ4cTFSS1dXbTFzV3V1?=
 =?utf-8?B?Vjk1UWtWb2ZnUU9VQlhMR2liYkpVUlFIZjVZK2dvMEhhcC83eDBQWTRsWFlE?=
 =?utf-8?B?TDIybW16eUxuVFNKMzVXMlJpb3o2NWg2UFU3eXN2eUo5c1IzTG05WSs1VGNq?=
 =?utf-8?B?b2gxRm9HaHV1VDAzOWRZd2xBdHVtSURDUnVMdlhxQURrbldWaXZTaTR3cDhV?=
 =?utf-8?B?SG94WFNQeXhIVGRRbGphWVlKR3U3MnZNZ2hoSVc5Qzl3VmV3N0lqcm52UVJj?=
 =?utf-8?B?WDJEaDFPN2xGTHZHNi8yQXlIMFBuSEJJb01jakdrSVVBcE1TaVpiQytJaC91?=
 =?utf-8?B?ZlIzbkIrR3Y4YXBzbUwvUkNoMlFna0NrQ1hkVW9QdkVDRzNpVUZEU1NHVGth?=
 =?utf-8?B?MWZPMWxQZEdkQXBpQVVsTTVxRVpUSU1zMlArN2dzZzRhZmNNU095SmNQb3pD?=
 =?utf-8?B?eHJPcG43N01qbUJucHF6Z1lDKzNLWnVlMDNjWVNVSlFvaWpiTXFoZ3FmSkU3?=
 =?utf-8?B?MjcrakJBQ2c4MVFaMTZWdXVWN3VJZG5xS2pteVRaQlFUb0xJSTAyakdKVlpy?=
 =?utf-8?B?K25aMFkzYmRyR2FsU3pUd1pDbnBMeTcwdnVoN2FCcXZ0cmwvbTZCOTJXV2Y0?=
 =?utf-8?B?ODNaaExJcnZrSVNGVm4vYVo1ZjVMOXBlTjh1U2NqSzBSVTlIdUpYNjJRemNu?=
 =?utf-8?B?Mm5MVG15V2cvanZyelJVMW5ZODBCalVFTjE5c3RmcTVNdnFHTU0yMDJXSU9C?=
 =?utf-8?B?WUY3bWdtcnk5WW04VWVJaHUybjkzVEZiUEJOV29YK3djajd1U3lhVlN1K2xR?=
 =?utf-8?B?OHF2cDBhVHBacUdXcGVsK1pldFJucmUxTjJJaXUzbkptVzRzMHc3OFpnRDQ0?=
 =?utf-8?B?KzgvRDcrclVFUmZIUk9pcjlFR2ZjUjZwM1ZOTytPMHpEMmdFTHdIeGZJZE12?=
 =?utf-8?B?K2dSTGRITlg1RVdFNzNneVNPRUJNTFFHeXVvL01vSW9wbmZwd3J2K2g4Zm1P?=
 =?utf-8?B?NkNkNXFrVXhrUmg3UDdSMHA2NW5BNlphb1l1UUk2Wnh4NjFZRE1KZTRkMlYv?=
 =?utf-8?B?ZEJxNk1mQ0lISDRtMjVPZitUTHoxSEVNaHd3Z1VkOVZIOXpDTXFBWVUxZUZ3?=
 =?utf-8?B?REx1OTU1dWhJUjVTYkNiZWNTcUtWWGdjZ3lDMGg1Nlh2ZHpYNUdZN3FSb0Iv?=
 =?utf-8?B?NUR1TnE2cEg0akxqeDBsRC9NV2hyOW9YSzllaEFjL0dHM0tNc2FDRndvNW01?=
 =?utf-8?B?ODdaYkhaaGFkZEdNZUFGVG42dTJFL0Q3aVJKR3VFeThNNEFXendnQkp4UzA2?=
 =?utf-8?B?bDRlYitEYkcxMmp6WVAwSklXcVJRaWhzTlVGZlcybC9EZjFHREJ6KzN6Qkc3?=
 =?utf-8?B?dlJscXdZVHUrUitiN1RSRmZMcnVQOThScEQ1QXppcnRBbThLMkRuWWlGYVJQ?=
 =?utf-8?Q?PP4cAASUWcxGc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f27be6-de8a-4171-8778-08d8efa0c1f3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 15:15:00.3172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vYN0UjV+Je/g0Xll1k2Fj7wTorfjV+R8/+6lWQTJaoBDDeYbzctyZYFfnH3Lr3g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4707
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Huang Rui <ray.huang@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 spice-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzISBKdXN0IGEgY29weSZwYXN0ZSBpc3N1ZS4KClBhdGNoIHRvIGZpeCB0aGlzIGlzIG9u
IHRoZSBtYWlsaW5nIGxpc3QuCgpDaHJpc3RpYW4uCgpBbSAyNS4wMy4yMSB1bSAxNjowMCBzY2hy
aWViIENvbGluIElhbiBLaW5nOgo+IEhpLAo+Cj4gU3RhdGljIGFuYWx5c2lzIHdpdGggQ292ZXJp
dHkgaW4gbGludXgtbmV4dCBoYXMgZGV0ZWN0ZWQgYW4gaXNzdWUgaW4KPiBkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jIHdpdGggdGhlIGZvbGxvdyBjb21taXQ6Cj4KPiBjb21taXQgYTFmMDkx
ZjhlZjJiNjgwYTUxODRkYjA2NTUyNzYxMjI0N2NiNGNhZQo+IEF1dGhvcjogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IERhdGU6ICAgVHVlIE9jdCA2IDE3OjI2
OjQyIDIwMjAgKzAyMDAKPgo+ICAgICAgZHJtL3R0bTogc3dpdGNoIHRvIHBlciBkZXZpY2UgTFJV
IGxvY2sKPgo+ICAgICAgSW5zdGVhZCBvZiBoYXZpbmcgYSBnbG9iYWwgbG9jayBmb3IgcG90ZW50
aWFsbHkgbGVzcyBjb250ZW50aW9uLgo+Cj4KPiBUaGUgYW5hbHlzaXMgaXMgYXMgZm9sbG93czoK
Pgo+IDYxNyBpbnQgdHRtX21lbV9ldmljdF9maXJzdChzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwK
PiA2MTggICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIg
Km1hbiwKPiA2MTkgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdHRtX3BsYWNl
ICpwbGFjZSwKPiA2MjAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdHRtX29wZXJhdGlv
bl9jdHggKmN0eCwKPiA2MjEgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgd3dfYWNxdWly
ZV9jdHggKnRpY2tldCkKPiA2MjIgewo+ICAgICAxLiBhc3NpZ25femVybzogQXNzaWduaW5nOiBi
byA9IE5VTEwuCj4KPiA2MjMgICAgICAgIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSBO
VUxMLCAqYnVzeV9ibyA9IE5VTEw7Cj4gNjI0ICAgICAgICBib29sIGxvY2tlZCA9IGZhbHNlOwo+
IDYyNSAgICAgICAgdW5zaWduZWQgaTsKPiA2MjYgICAgICAgIGludCByZXQ7Cj4gNjI3Cj4KPiAg
ICAgRXhwbGljaXQgbnVsbCBkZXJlZmVyZW5jZWQgKEZPUldBUkRfTlVMTCkyLiB2YXJfZGVyZWZf
b3A6Cj4gRGVyZWZlcmVuY2luZyBudWxsIHBvaW50ZXIgYm8uCj4KPiA2MjggICAgICAgIHNwaW5f
bG9jaygmYm8tPmJkZXYtPmxydV9sb2NrKTsKPiA2MjkgICAgICAgIGZvciAoaSA9IDA7IGkgPCBU
VE1fTUFYX0JPX1BSSU9SSVRZOyArK2kpIHsKPgo+IFRoZSBzcGluX2xvY2sgb24gYm8gaXMgZGVy
ZWZlcmVuY2luZyBhIG51bGwgYm8gcG9pbnRlci4KPgo+IENvbGluCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
