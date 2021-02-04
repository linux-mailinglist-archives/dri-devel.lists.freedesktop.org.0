Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF6F30FB8B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 19:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7B16EE32;
	Thu,  4 Feb 2021 18:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650236EE31;
 Thu,  4 Feb 2021 18:34:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pcmir63/M9XvbxpQq0sGC6O7VHPRYA0pTcbQXEE1OjLkXUR+CEWRe2IyRgAFtvKZii9TWMkQsHtiHxN6IvcdE+7OeDcPaWBDekfPkXxP1VGbAyJaGnt2spttVoYEr2oELB9nAl0ad8n+UVa3kpwydTduOk1bRqpVuJsm97cNHfxSrRhFozcdjleaS+nAvXmxZRVsGqyNbPVVjeYgiuzoMrVpc+kOI128qYdzNTnbrunSp8bO+SBf2fYu9QKqGRW/9jTlP39W6uhM25XXmtEKu/5QuyzozozVoAs10g3slkgSeqwk4iiSgbFJYFFuZQl7+2vprzoSdz+12ECat7FiuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vk0oX7VUZ4E91Vbk0Skxt42XWJGtk7kzX06FPWa32ec=;
 b=MBV+3fdIAWtW8R0O33mHXrTtPQ6us2GNuhPMX8m/nX2X/7+LQEcV9RFK+0FSDXdSc94RYZUDZqS7cGrZPfkeUG/6P8siA2t1++IWGtb47xMF6oyW23e+ueydixiomwSXdFG5IRjXDVcL9gr1Hg8zrObSEL4wKJMIjJ+UxehxXsNgJa7ddyUStRRP71D0Za935OQvJKyX2eFbZhdmP6nQvhUliBBw11JivTs7+Evo2tib2OlK0FstYQdlJtLSnhc9nsLeY37T/IerNYLYZ2K4J81RcxcAQZ/xzEJjZUzJjXMWiTxyOmP60qLRfstXNEzt11pTx7jXJ1PEPBxJC9S1qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vk0oX7VUZ4E91Vbk0Skxt42XWJGtk7kzX06FPWa32ec=;
 b=BezgeKg2ku8+UiQGf9WH0V1zPtqASot2BaO99K+TSy/t052yN5FGgh/dbY2R8tzG3XB0InfNK966INMH4QblICdZKrgq5qEJ1nhyne8ZuwcsOS1Ht8GglY/oM3oJoty7QQxa05LOhRrNtmDXkWjz53X0uHUatO3V0H1yhQv3HHQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1787.namprd12.prod.outlook.com (2603:10b6:3:113::12)
 by DM6PR12MB4252.namprd12.prod.outlook.com (2603:10b6:5:211::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Thu, 4 Feb
 2021 18:34:36 +0000
Received: from DM5PR12MB1787.namprd12.prod.outlook.com
 ([fe80::d7f:f19c:7565:99b6]) by DM5PR12MB1787.namprd12.prod.outlook.com
 ([fe80::d7f:f19c:7565:99b6%3]) with mapi id 15.20.3805.027; Thu, 4 Feb 2021
 18:34:36 +0000
Subject: Re: [PATCH 3/3] drm/amdgpu: share scheduler score on VCN3 instances
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210204144405.2737-1-christian.koenig@amd.com>
 <20210204144405.2737-3-christian.koenig@amd.com>
From: Leo Liu <leo.liu@amd.com>
Message-ID: <036c900b-df46-5259-dbd2-d882f9a7341b@amd.com>
Date: Thu, 4 Feb 2021 13:34:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210204144405.2737-3-christian.koenig@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:9880:2088:19:8565:bb02:a60e:b824]
X-ClientProxiedBy: YTBPR01CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::27) To DM5PR12MB1787.namprd12.prod.outlook.com
 (2603:10b6:3:113::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:9880:2088:19:8565:bb02:a60e:b824]
 (2607:9880:2088:19:8565:bb02:a60e:b824) by
 YTBPR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Thu, 4 Feb 2021 18:34:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 396d05a6-7b3d-4ca4-2206-08d8c93b85c4
X-MS-TrafficTypeDiagnostic: DM6PR12MB4252:
X-Microsoft-Antispam-PRVS: <DM6PR12MB42520F951171FFB0DFF7A700E5B39@DM6PR12MB4252.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xwKhnQNh2pOuIdqD1BmFRQkGKELsR8tRcV0jH7SDMel6Yi9pTgD+En1/77ODSExw7BKHM9Ux9jdbkFV7I7apLoW8mIqaK0V/jUCanOLQQdepfU2ucU9Tq9oH4vNsDhPC8+ckD4VUlRKUBUAwD4RrRCRnPREQsjskPcs30Vm+/twg12msJwwmo5TLH7eWVMqp3EPtbQ4KAh1E2ZFctsWeiN+2kJ6cBmrgcpMnHckRfqZWFlu64w1obc6sqoCvPyLu0NbLZJZV6zK7WPmlg33mKsy8gGobKzcBXFdVdoMybd5JLzRsJ6womDjhJe9YHz9eLDXppaQEFA/znFeLMQKDuXL2bhkqSi6S3boXyw+AajmDzVZ8KEQOp5lJ+ALQjRRRStCNMEDtaufL0rOPtETgtsu2+pe5Lpt+i44WzvfuBlozJVruGGAlQZ5981xkASVb8Wsk9kad2DSeR6VppuV77vluNi3Qpt1pOZjyWG6dkONZXauNtDlAsKfQ3ra+y/CtRT+e5lijWJMuuOflbjMWf7i4TFrc/XTLBIegphpY34eCWIYTGHd9XF3doubrFeQWPwW8in7wQ9VHVHBP+oHOBfhR9LNyHo+f3zMy/g/Cuyg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1787.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(2906002)(316002)(31686004)(52116002)(478600001)(8676002)(66946007)(2616005)(186003)(5660300002)(83380400001)(16526019)(44832011)(36756003)(66556008)(66476007)(6486002)(8936002)(31696002)(86362001)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VG5LMXBaa0JHV3cvNSs2MHYxK1FVSTJQQ1ovR2t0UnBLc01KSUU3VG9uRXBP?=
 =?utf-8?B?VkRMbGRyS1l4Q0FBaS9UcGlTeklnTU5SdnlNSmd4V2xTYzVMeFpoc2xUWkJG?=
 =?utf-8?B?QXVhOUFhRmRLaWpvQ0c1YjlLQUswMmNzMnBDampoSjNMWlJkMk01TGxTMEhW?=
 =?utf-8?B?TFpwRzBHQTNjTldoQk96aHRua0ltZ0NkM1pQcW45cWU5R0tqYXVoT1JPNlJi?=
 =?utf-8?B?c2hTWHJoNHhPc3M0SjBxMmsvdkZqbGlNa1RwWWk0bWJMR1pKbjA0Rko0eUls?=
 =?utf-8?B?K3BQQmRBQkxiZG5SYVA0ZS9iTXZLbzFFTUdZa2pCUmNKR0xnemZxRWswaERW?=
 =?utf-8?B?TE9lNVJIcDV5YjFiRTJCTHlQTjVMZy9YSUVXM1BndGkwMFNObUJmdldYNW1o?=
 =?utf-8?B?UER4Z09oSC84NUZlZ0ZyTklMMWRzNjFaS3F6enk3UHhUU1I5NWZjdGdrMXl5?=
 =?utf-8?B?WDV0U2FCZnlTbEVscE9QcGcrVlE3dXJFY1UvemlDa2lrMjJEaHljTHVMdXZF?=
 =?utf-8?B?MXlrUlBod3ord0NZN1lCRkdPWmw2d1phZWI3a0RONjJFUHZxaG9pYm5MaGxt?=
 =?utf-8?B?amFGZHVod0tLWTF0dGJHZXVPL1JBYVMzakc5cGczemVMLzFaNks2V2htUzk4?=
 =?utf-8?B?TDJROXdGU1dYZTZTWENEOGF1UEFlV2lJdTFITmxkRGI5R1dUKzVJQ1pTMnFY?=
 =?utf-8?B?c242anBTMk9qNDRxQS9JUG1ub1d1cTcwaHk0QmVFdzIzRGtqRm5WNkpHOWJz?=
 =?utf-8?B?d2k4MjB1YUovbzZJM0dqbGVJWDQ4aitIMk1sTVZINTdOTm9pYXFWdHp4akMv?=
 =?utf-8?B?T1BrenlJSlVyQ1lVTjdJck5maDdkZWxNREszVElWdXgybjRTTVlyRFdWZEc2?=
 =?utf-8?B?NHlXejdqU0ZQMlFLWXV6OFpHbVdzck9POHNlRm5yYVJFOUtteGxNbkY5Umc0?=
 =?utf-8?B?NncwTytETFdrTFZlTWhMMlZMcEtiM2hoV0NKTEtJS0VQUnpEN0kxdzI4ekpX?=
 =?utf-8?B?ZEplSDNZVm5EbW4wdW5VYjZhWGlLRjBqbFhGN0Y4YTJiWDQ0bUt2aThhVGlq?=
 =?utf-8?B?OThCZVkzekJJYTRsZmJ0UUxGWmVJeTY2dnhNaFpLQTZoVytjR3B6aUc2dVRR?=
 =?utf-8?B?RjI1RElUSWFwbWxGR3hYYkcvTnMvTGU2WXQ4RlBvSHpBNHIwVURMc3h4KzYr?=
 =?utf-8?B?Nm9mcVNOa0t5cU44TlVNUlQyQXp0QSs5dDhGZmxZSEJMb1JYZHl4bkJ6TmFR?=
 =?utf-8?B?alZ1UUFXT3k0OTBQb1g2QnI3bU1MY201bUVqQU5nWmk2eVR0MkR5cUJ6bTIv?=
 =?utf-8?B?TXlGWHBkaWx4UFJjaCs3RU9NbitKVnh6bllRaDFYREZhUmVPY3FzU0hVUzFq?=
 =?utf-8?B?OEZSRzMyUCs0Mm1jeVQ5TklMYUJib2pLb3Rid1ZYa1B3TjVHRTdOOHROUS9N?=
 =?utf-8?B?UFN4V2huZ2FUVUpqQlo4RExGcGtEZTUvYUlvS0FFY1dMamJxODBUWDJzWE5t?=
 =?utf-8?Q?dsM7QVWQz8AinDps8R8g7NB39iM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396d05a6-7b3d-4ca4-2206-08d8c93b85c4
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 18:34:35.9341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQUk+wN/3mhj1IUblik/ITEnct03b34qnXsvFve4kJjRJc9xGYjZYBCJMAEZbwnO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4252
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHNlcmllcyBhcmU6CgpSZXZpZXdlZC1hbmQtVGVzdGVkLWJ5OiBMZW8gTGl1IDxsZW8ubGl1
QGFtZC5jb20+CgoKT24gMjAyMS0wMi0wNCA5OjQ0IGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3Jv
dGU6Cj4gVGhlIFZDTjMgaW5zdGFuY2VzIGNhbiBkbyBib3RoIGRlY29kZSBhcyB3ZWxsIGFzIGVu
Y29kZS4KPgo+IFNoYXJlIHRoZSBzY2hlZHVsZXIgbG9hZCBiYWxhbmNpbmcgc2NvcmUgYW5kIHJl
bW92ZSBmaXhpbmcgZW5jb2RlIHRvCj4gb25seSB0aGUgc2Vjb25kIGluc3RhbmNlLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+
IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oIHwgIDEgKwo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YzXzAuYyAgIHwgMTEgKysrKysrKy0t
LS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uaAo+IGluZGV4IDEzYWE0MTdm
NmJlNy4uZDEwYmM0ZjBhMDVmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92Y24uaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92Y24uaAo+IEBAIC0yMTEsNiArMjExLDcgQEAgc3RydWN0IGFtZGdwdV92Y25faW5zdCB7Cj4g
ICAJdm9pZAkJCSpzYXZlZF9ibzsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X3JpbmcJcmluZ19kZWM7Cj4g
ICAJc3RydWN0IGFtZGdwdV9yaW5nCXJpbmdfZW5jW0FNREdQVV9WQ05fTUFYX0VOQ19SSU5HU107
Cj4gKwlhdG9taWNfdAkJc2NoZWRfc2NvcmU7Cj4gICAJc3RydWN0IGFtZGdwdV9pcnFfc3JjCWly
cTsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X3Zjbl9yZWcJZXh0ZXJuYWw7Cj4gICAJc3RydWN0IGFtZGdw
dV9ibwkqZHBnX3NyYW1fYm87Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3Zjbl92M18wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjNfMC5jCj4g
aW5kZXggMjM5YTRlYjUyYzYxLi5iMzNmNTEzZmQyYWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmNuX3YzXzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3Zjbl92M18wLmMKPiBAQCAtMTcxLDYgKzE3MSw3IEBAIHN0YXRpYyBpbnQgdmNuX3Yz
XzBfc3dfaW5pdCh2b2lkICpoYW5kbGUpCj4gICAKPiAgIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+
dmNuLm51bV92Y25faW5zdDsgaSsrKSB7Cj4gICAJCXZvbGF0aWxlIHN0cnVjdCBhbWRncHVfZndf
c2hhcmVkICpmd19zaGFyZWQ7Cj4gKwo+ICAgCQlpZiAoYWRldi0+dmNuLmhhcnZlc3RfY29uZmln
ICYgKDEgPDwgaSkpCj4gICAJCQljb250aW51ZTsKPiAgIAo+IEBAIC0xOTgsNiArMTk5LDggQEAg
c3RhdGljIGludCB2Y25fdjNfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKPiAgIAkJaWYgKHIpCj4g
ICAJCQlyZXR1cm4gcjsKPiAgIAo+ICsJCWF0b21pY19zZXQoJmFkZXYtPnZjbi5pbnN0W2ldLnNj
aGVkX3Njb3JlLCAwKTsKPiArCj4gICAJCXJpbmcgPSAmYWRldi0+dmNuLmluc3RbaV0ucmluZ19k
ZWM7Cj4gICAJCXJpbmctPnVzZV9kb29yYmVsbCA9IHRydWU7Cj4gICAJCWlmIChhbWRncHVfc3Jp
b3ZfdmYoYWRldikpIHsKPiBAQCAtMjA5LDcgKzIxMiw4IEBAIHN0YXRpYyBpbnQgdmNuX3YzXzBf
c3dfaW5pdCh2b2lkICpoYW5kbGUpCj4gICAJCQlyaW5nLT5ub19zY2hlZHVsZXIgPSB0cnVlOwo+
ICAgCQlzcHJpbnRmKHJpbmctPm5hbWUsICJ2Y25fZGVjXyVkIiwgaSk7Cj4gICAJCXIgPSBhbWRn
cHVfcmluZ19pbml0KGFkZXYsIHJpbmcsIDUxMiwgJmFkZXYtPnZjbi5pbnN0W2ldLmlycSwgMCwK
PiAtCQkJCSAgICAgQU1ER1BVX1JJTkdfUFJJT19ERUZBVUxULCBOVUxMKTsKPiArCQkJCSAgICAg
QU1ER1BVX1JJTkdfUFJJT19ERUZBVUxULAo+ICsJCQkJICAgICAmYWRldi0+dmNuLmluc3RbaV0u
c2NoZWRfc2NvcmUpOwo+ICAgCQlpZiAocikKPiAgIAkJCXJldHVybiByOwo+ICAgCj4gQEAgLTIy
NywxMSArMjMxLDEwIEBAIHN0YXRpYyBpbnQgdmNuX3YzXzBfc3dfaW5pdCh2b2lkICpoYW5kbGUp
Cj4gICAJCQl9IGVsc2Ugewo+ICAgCQkJCXJpbmctPmRvb3JiZWxsX2luZGV4ID0gKGFkZXYtPmRv
b3JiZWxsX2luZGV4LnZjbi52Y25fcmluZzBfMSA8PCAxKSArIDIgKyBqICsgOCAqIGk7Cj4gICAJ
CQl9Cj4gLQkJCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9TSUVOTkFfQ0lDSExJRCAmJiBp
ICE9IDEpCj4gLQkJCQlyaW5nLT5ub19zY2hlZHVsZXIgPSB0cnVlOwo+ICAgCQkJc3ByaW50Zihy
aW5nLT5uYW1lLCAidmNuX2VuY18lZC4lZCIsIGksIGopOwo+ICAgCQkJciA9IGFtZGdwdV9yaW5n
X2luaXQoYWRldiwgcmluZywgNTEyLCAmYWRldi0+dmNuLmluc3RbaV0uaXJxLCAwLAo+IC0JCQkJ
CSAgICAgQU1ER1BVX1JJTkdfUFJJT19ERUZBVUxULCBOVUxMKTsKPiArCQkJCQkgICAgIEFNREdQ
VV9SSU5HX1BSSU9fREVGQVVMVCwKPiArCQkJCQkgICAgICZhZGV2LT52Y24uaW5zdFtpXS5zY2hl
ZF9zY29yZSk7Cj4gICAJCQlpZiAocikKPiAgIAkJCQlyZXR1cm4gcjsKPiAgIAkJfQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
