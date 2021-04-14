Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26AA35ED4A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8F86E459;
	Wed, 14 Apr 2021 06:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76ADD6E459;
 Wed, 14 Apr 2021 06:41:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSRhXMyWpv3RqBCJ3SdP+SqLF44WOHiEhgzxtZoxIaadVE0nBqmVNSrlO8CErUo73pykdnr0w5GVXby1QZO8UN8MFB0fPkrSbptAryfG2GsAyGaXjE7OfDRR2VZrizXmUcZ0m2Vr4v0Q7n6jz9Vq4ZkzZICv6ySh8XNttE139ylRf6ww9v4SgIL592SDZv9PwtZW7eJXK1c8iIFA2QhXQ8dqrSy5NVzNM8/6efgTLSLk2wELISOqo3xklfJdaMzlCP0Ou7P8jW6ven87Q/9nnXykgWygyABHoPXmSVIX7antm7FV69VFY5+LArh7RrjwC+ZD2nOEP51sVYOBVt83tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAiUET40OAF35aY0qsKAMN9sTr8csAvCWP0w92wtBzc=;
 b=IQjZo5RMFAUqxuNzIRbMX/v+M/TDj5qRWLsUEbz/KmTbai/AdnFVFcE3KkoKDD5QQU65DJrsyUy7fw/VXdLdfITnchmAAm9FsovTTP+dn0mEbQqL5B0K2ObHnr7fVutlgptEXCQSAPskk4BcXWtFmr2iDjLrWT2YaQkZY9e/yKvRbV+cGEv5WitOwc/2pcb1zETo2lg8p9XvgZ5T6i5PMGOSXg3k2nMzKcc6udfsajiDOSYson5sE8KUE5V4iBSPOJgdfn8HxrniDVogWhNgWkflnerA5bV8odC37iA+SaZFWvnVUPf19XYB4mKJJCxBpW/wZOpVE86K+Ggbe8vAPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAiUET40OAF35aY0qsKAMN9sTr8csAvCWP0w92wtBzc=;
 b=hzXKSOiTYO1CM7oAyGt5jnfck1EcIDmswQM9Xq0WZZ+dBLMR4MCIHB+wxdjK92+75k9ZcS67Dw0MvwgBDg1c6JXjv4KBsCg8Dlh1zTgrctw9vzCersjXRxKTjFpcuI2+OvTb44VmjkXFwCbGdL+sYbpoyvMH+DEH+lJG0IPOgF4=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synaptics.com;
Received: from BY5PR03MB5345.namprd03.prod.outlook.com (2603:10b6:a03:219::16)
 by BYAPR03MB3942.namprd03.prod.outlook.com (2603:10b6:a03:6c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 14 Apr
 2021 06:40:56 +0000
Received: from BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72]) by BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72%8]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 06:40:56 +0000
Date: Wed, 14 Apr 2021 14:40:46 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Fix "mitigations" parsing if i915 is builtin
Message-ID: <20210414144046.7641b845@xhacker.debian>
In-Reply-To: <YHXN9lqtdvisT8gn@intel.com>
References: <20210413170240.0d4ffa38@xhacker.debian>
 <YHXN9lqtdvisT8gn@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: SJ0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::10) To BY5PR03MB5345.namprd03.prod.outlook.com
 (2603:10b6:a03:219::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 SJ0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:a03:33b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.6 via Frontend
 Transport; Wed, 14 Apr 2021 06:40:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f295545c-d48c-4472-8bb3-08d8ff104199
X-MS-TrafficTypeDiagnostic: BYAPR03MB3942:
X-Microsoft-Antispam-PRVS: <BYAPR03MB39425F78A782BBC6056DEB12ED4E9@BYAPR03MB3942.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P1Agdc9ZOk29XArNsBczUrFd6flugjqgyUc6dXcSto9vOGxTDsyd+cXF3uBOreN3fndjtpUftqwK/yFoUUVG/g+wgBYIhOrq9SWFe9aM4t7dWdbpxjFWZLtJNMausLrJcFPMhDasNVNLQ157oPByuFDQrwV44Fg6NaQldqIfZc1ehJYbkcFSNiaGcCXQGExduBGeZ7SahFKKHZT9pdf/PLhnR5ayiNpE9cTL/TNOoxe6qPaJ4UE7hc70Wa/jVgVmwSOsSB2mu8Arm4RiICJHGxrfo4/Z6jRg6WkiEO+qfBReKShbn1TehpbSWwAD44BFX8eHGCAh7571mE0/Ayp+1YujNAGQCWlbMP2aC+9g8loBFr0MgQuQ1UHFXzGL12IanidbyYk4QHip3sWc/wOGurQmiKIReliy+aioy1igZyhAzrtmME3y2ToPXF8/QzLfV/t66eRZY3uUXQNM7JRY0E0qBqj6UcHQdW0PhbHRGUau8MeW/678kfFhu02Z5G0ah+UyXuf6EIaYTqI7UdY3BvDIoHUU+uaLWltJPKzLVOqXitCmESDofhIzK62wD9XfVmhlxvQXjqvERww5L8IFvtZxkMpoCRXXhtW+hCKVQftCDBk6lABeTUQwoPMBgurdL6mC4nthKyF6J74Ay+KvTZQNC0+0aGohxwxvSS0Ctfc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR03MB5345.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(346002)(376002)(396003)(366004)(136003)(83380400001)(1076003)(7696005)(4326008)(9686003)(186003)(86362001)(8936002)(6916009)(55016002)(26005)(316002)(6506007)(956004)(7416002)(66946007)(52116002)(54906003)(66574015)(2906002)(66556008)(38350700002)(66476007)(16526019)(8676002)(478600001)(6666004)(38100700002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VEpWMW43YWI1YS9kai96Mm9zZEUxenAxeGVnZXpUV2RrYjhWSExHOVNRVmM5?=
 =?utf-8?B?ZHVJWFkrTGZyTHYyeFhaV3BlQ3BUTkhIQm16a29KaEh6dVQ4Nmlwc2FGcFZS?=
 =?utf-8?B?RjJJcEVLY1Y0dnB0UmNENFl6NnpybXhVT3Q1ZytnUERZQU9NTkJ6RDJwU3JG?=
 =?utf-8?B?NmdxNWxSWTVrN213dnljM3IxTHhHeWl0cjAwb1ZlL2NNTVloanU3Nnp0bnlU?=
 =?utf-8?B?MXNrR1JlQ3RjQ0FNc2RVQzNuMDUzTTRkSGs4a0tSVHNUeFFLSWREakFZT2p6?=
 =?utf-8?B?MFV3RGZLK2FLY3lsWENhQUJpZUxJWjlUbEpkTmpwNUIySU5WTk9HRFA2ZU1F?=
 =?utf-8?B?UGQxKytJbURGRmM3eHdDRWIyZmJvaHQ4YXo4bXhyV1Z5T1NXODl6U0dqV2tM?=
 =?utf-8?B?STRqRDd1T24wYlBFL04vaTVrZk5pY0V4S1NLS2YxZXdhWkIxd05TOXJCR3BN?=
 =?utf-8?B?Um9yS0drcEx2a05lVDRDaGlCYzlKOTVrUXhhcmpTZmxLV2htd3BJVFkyaVFw?=
 =?utf-8?B?RFJRMVRLZzhvRFZsMlJJbktIREtFeWxEbVM5TUJ1Wm14OFJEcDlQYkZESGpE?=
 =?utf-8?B?T3pmT0luK2E4V2krTURySDhkS0Y3S2NYVGJXeElJdU9oUC9aV0tiZWw0RkYw?=
 =?utf-8?B?ME1jUVFKdktwMWhYaGw5Y200a0wxYnBnbS93SXJUREJpVkc2MUNGQXBoMGJD?=
 =?utf-8?B?WWtCbFRuc3JxTnRjd2hOUThLWU1TaWNkNStOOG81cTRDT0xZNWorSUo2d2I0?=
 =?utf-8?B?dnkxSHNCWlYwVkFFc3FtOHIzRzMxWEhsWlB0U2poV0JtT0dwNFU3NVVGQU4v?=
 =?utf-8?B?a1VHVmFIZTNIRW16cGhIdkcvSXpnNzY3QzlKYngrS2NheFc0R2pnY0N4S2V2?=
 =?utf-8?B?TGsrV1N0RmNBeDF1NTlkMDQ2NFFMN3dqRVk4ZG9oaHhuTFBBOTJyY0dwOW1x?=
 =?utf-8?B?NmUxTW9OSWVzYjAyUUhXWVJvZjRuYjE2NHlDTklBbDIvSUNjakpYMmZqYUZy?=
 =?utf-8?B?TUluTnBYZXFScksvYnd2VmZqS21GamJ4UWFjSk1MSFhJNFZkWDFwVGh2SWd3?=
 =?utf-8?B?V2pabk13UFVYT2lvVlk4cTEvdkxRZzdyNXNiSmlpbThXdmwwZG5XclRuWG1K?=
 =?utf-8?B?aTRteXRzckNhTXJQVjlXMGxmaThoZ3o5TXpKZU9mNE5LclpNUmFXVGJOcE9k?=
 =?utf-8?B?cWFpbWNiazZRUGNpNVlubjl0Y2N3YVRhQXZUVHhVYk0xWDBnM1N0bmpFL3B6?=
 =?utf-8?B?d2cxOFJVS0NRL20rbkhkSVo4VTEyNDlXc0VPVDdIL3ZzMU9RbUpQazIvZzZn?=
 =?utf-8?B?MHZDWHRNZU1Rc2ZIWjk3SlZJNkpweENmNkpRSVFUeVp0WXJ0QTdFQUsrcDFx?=
 =?utf-8?B?OFRwQ0hjTnlvT3ozeEdiWnB4eXRySlFmUmQwd214eTRSQThVWndkMW1jRSsv?=
 =?utf-8?B?NVJNVC8wM00zTDRpSW01WDY2NE51SzBkK3p2aHUxNGpZdk9RY3pkYlllam9H?=
 =?utf-8?B?SHVseTlnd2JIdENscG9IZm91d09JeWhkYWQwMi9MUDY4MTNPbFp1Q28walNE?=
 =?utf-8?B?VTJ0aWRURWMzT1ZlbWdCcWs2OEtPSXNJcW9HZWUxVWVSZjRFTnFSTkVnWWhi?=
 =?utf-8?B?anlTa21oQ3poNDVobzJ3S2hsUndFWkdJQzJmcmJubGZNSk4yMXdtckdvS1R3?=
 =?utf-8?B?MmRmSmthRFN2dE5uNmQ1QWEvWkp0OThFc2h3NWs2Z3FCVFU4N0o2T0EyT3JK?=
 =?utf-8?Q?IyDBNq8HDSp6IZkFHxx635I6UC35m0BYYqx/MTV?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f295545c-d48c-4472-8bb3-08d8ff104199
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5345.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:40:56.0366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+w2LvWvi/f6XVVQQGpqDGwosTuRmGeZ06nEkFLENkPT+R+rGwI1fGlVGbujzx8eN/dEyE8ALqD+f/XKCQUczg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3942
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUsCgpPbiBUdWUsIDEzIEFwciAyMDIxIDE5OjU5OjM0ICswMzAwIFZpbGxlIFN5cmrD
pGzDpCB3cm90ZToKCgo+IAo+IAo+IE9uIFR1ZSwgQXByIDEzLCAyMDIxIGF0IDA1OjAyOjQwUE0g
KzA4MDAsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4gPiBJIG1ldCBiZWxvdyBlcnJvciBkdXJpbmcg
Ym9vdCB3aXRoIGk5MTUgYnVpbHRpbiBpZiBwYXNzCj4gPiAiaTkxNS5taXRpZ2F0aW9ucz1vZmYi
Ogo+ID4gWyAgICAwLjAxNTU4OV0gQm9vdGluZyBrZXJuZWw6IGBvZmYnIGludmFsaWQgZm9yIHBh
cmFtZXRlciBgaTkxNS5taXRpZ2F0aW9ucycKPiA+Cj4gPiBUaGUgcmVhc29uIGlzIHNsYWIgc3Vi
c3lzdGVtIGlzbid0IHJlYWR5IGF0IHRoYXQgdGltZSwgc28ga3N0cmR1cCgpCj4gPiByZXR1cm5z
IE5VTEwuIEZpeCB0aGlzIGlzc3VlIGJ5IHVzaW5nIHN0YWNrIHZhciBpbnN0ZWFkIG9mIGtzdHJk
dXAoKS4KPiA+Cj4gPiBGaXhlczogOTg0Y2FkZWEwMzJiICgiZHJtL2k5MTU6IEFsbG93IHRoZSBz
eXNhZG1pbiB0byBvdmVycmlkZSBzZWN1cml0eSBtaXRpZ2F0aW9ucyIpCj4gPiBTaWduZWQtb2Zm
LWJ5OiBKaXNoZW5nIFpoYW5nIDxKaXNoZW5nLlpoYW5nQHN5bmFwdGljcy5jb20+Cj4gPiAtLS0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X21pdGlnYXRpb25zLmMgfCA3ICsrLS0tLS0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X21pdGlnYXRpb25zLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X21pdGlnYXRpb25zLmMKPiA+IGluZGV4IDg0ZjEy
NTk4ZDE0NS4uN2RhZGY0MTA2NGUwIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9taXRpZ2F0aW9ucy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1
X21pdGlnYXRpb25zLmMKPiA+IEBAIC0yOSwxNSArMjksMTMgQEAgYm9vbCBpOTE1X21pdGlnYXRl
X2NsZWFyX3Jlc2lkdWFscyh2b2lkKQo+ID4gIHN0YXRpYyBpbnQgbWl0aWdhdGlvbnNfc2V0KGNv
bnN0IGNoYXIgKnZhbCwgY29uc3Qgc3RydWN0IGtlcm5lbF9wYXJhbSAqa3ApCj4gPiAgewo+ID4g
ICAgICAgdW5zaWduZWQgbG9uZyBuZXcgPSB+MFVMOwo+ID4gLSAgICAgY2hhciAqc3RyLCAqc2Vw
LCAqdG9rOwo+ID4gKyAgICAgY2hhciBzdHJbNjRdLCAqc2VwLCAqdG9rOwo+ID4gICAgICAgYm9v
bCBmaXJzdCA9IHRydWU7Cj4gPiAgICAgICBpbnQgZXJyID0gMDsKPiA+Cj4gPiAgICAgICBCVUlM
RF9CVUdfT04oQVJSQVlfU0laRShuYW1lcykgPj0gQklUU19QRVJfVFlQRShtaXRpZ2F0aW9ucykp
Owo+ID4KPiA+IC0gICAgIHN0ciA9IGtzdHJkdXAodmFsLCBHRlBfS0VSTkVMKTsKPiA+IC0gICAg
IGlmICghc3RyKQo+ID4gLSAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiA+ICsgICAgIHN0
cm5jcHkoc3RyLCB2YWwsIHNpemVvZihzdHIpIC0gMSk7ICAKPiAKPiBJIGRvbid0IHRoaW5rIHN0
cm5jcHkoKSBndWFyYW50ZWVzIHRoYXQgdGhlIHN0cmluZyBpcyBwcm9wZXJseQo+IHRlcm1pbmF0
ZWQuCj4gCj4gQWxzbyBjb21taXQgYjFiNmJlZDNiNTAzICgidXNiOiBjb3JlOiBmaXggcXVpcmtz
X3BhcmFtX3NldCgpIHdyaXRpbmcgdG8KPiBhIGNvbnN0IHBvaW50ZXIiKSBsb29rcyBicm9rZW4g
YXMgd2VsbCBnaXZlbiB5b3VyIGZpbmRpbmdzLCBhbmQKPiBhcmNoL3VtL2RyaXZlcnMvdmlydGlv
X3VtbC5jIHNlZW1zIHRvIHN1ZmZlciBmcm9tIHRoaXMgYXMgd2VsbC4KPiBrZXJuZWwvcGFyYW1z
LmMgaXRzZWxmIHNlZW1zIHRvIGhhdmUgc29tZSBzbGFiX2lzX2F2YWlsYWJsZSgpIG1hZ2ljCj4g
YXJvdW5kIGttYWxsb2MoKS4KCkp1c3QgdHJpZWQgdGhlICJ1c2Jjb3JlLnF1aXJrcyIgd2l0aCB1
c2IgYnVpbHRpbiwgSSBjYW4ndCByZXByb2R1Y2UgdGhlCmlzc3VlLiBGdXRoZXIgaW52ZXN0aWdh
dGlvbiBzaG93cyB0aGF0IGRldmljZV9wYXJhbV9jYigpIG1hY3JvIGlzIHRoZQprZXksIG9yIHRo
ZSAiNiIgaW4gX19sZXZlbF9wYXJhbV9jYihuYW1lLCBvcHMsIGFyZywgcGVybSwgNikgaXMgdGhl
IGtleS4KV2hpbGUgaTkxNS5taXRpZ2F0aW9ucyB1c2VzIG1vZHVsZV9wYXJhbV9jYl91bnNhZmUo
KSwgaW4gd2hpY2ggdGhlIGxldmVsCndpbGwgYmUgIi0xIgoKYXJjaC91bS9kcml2ZXJzL3ZpcnRp
b191bWwuYyBhbHNvIG1ha2VzIHVzZSBvZiBkZXZpY2VfcGFyYW1fY2IoKQoKdGhhbmtzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
