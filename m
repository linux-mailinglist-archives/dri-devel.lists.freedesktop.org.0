Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCE41DAB19
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 08:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF796E578;
	Wed, 20 May 2020 06:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392EA6E3E3;
 Wed, 20 May 2020 06:54:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TovAAStFr6dQ37cf/MQD+bY7blxvs/dUFrClVDj58fM/LXWE+2+V1U56eqk4HnE5W52d1YEyG39k57Gk6IXNXYZZxcxMUMmFhCRF3L8CA1j1nW/rELLBhlskP+T4YEf9tb2q8PvjsY4UFMjKA8foVo8j6kEPcjBQF2tdHw/h28eY9pJ/QTLbwGFL8mAMnWo2GQfWkhwq7IYZnetgK1eSrWEa4Ose6WwfBtPQ7lfj8dzQE9QTQK7JY9oH5SQloGct9HCvLFoGawZy/cdu/yh8YStIl2dw6xgYqkfiT2AiU0Ox10v4zhRCl8WzDT515X7IahgrJT+YCOSHOehwWG8EBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdaCuSPmEN2mL3/eYXoPsSxKryrFjyMCDnrvwYZBEME=;
 b=ZZAEsLSs9LVeeqr0P4zT8UoIdlOUuYnVPniuIUCJTnfDXMPoxJe0RfbyiCEZ9VOZ8eBITOrD8PbHMTsOASg6NQO2n8QHK+yPo7vTH/oKRxMtv4WaQXwwTe5KmCVFJATAsANu6iUw+HHq5KSmvzPZFlUMgHHmt5+5wJWvj3UAs1QK2iyfqB0ERLAa+wuE8H2yLJ6hAaMwPMpxSluChPRD8/L5QD5iDug2WALm1GuS46X0sKWGb02tYBuyzybG1Bwu/CJeaK9iKu+7zcENqI4gO3FbT0NL3+Cp3aEg8MpitnmEYoLvugEQ9zd4pWOB15BKJ22SO2BfS1t9OuEHo00gYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdaCuSPmEN2mL3/eYXoPsSxKryrFjyMCDnrvwYZBEME=;
 b=ZdLONIhUxC0l8fYW5/3KrPj36fYxyozyAWkrv/CHW5JlGIy4RjLM5B/r3tI/b8KbHswqEEZb4MvZxMvDg+Ze93QXJLw1RlqGuE+lxTQBHnWjPr1tSK+dMJ64zPUSiXysnUgJX073gMvsJIR0sYA7yrf00rjOe9ShCHNJrr9QYj4=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3260.namprd12.prod.outlook.com (2603:10b6:5:183::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Wed, 20 May
 2020 06:54:43 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3021.020; Wed, 20 May 2020
 06:54:43 +0000
Subject: Re: [PATCH] dma-fence: add might_sleep annotation to _wait()
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200519132756.682888-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <be86b73c-2fb3-a6c0-5a12-004af051210f@amd.com>
Date: Wed, 20 May 2020 08:54:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200519132756.682888-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::22) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0081.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Wed, 20 May 2020 06:54:40 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3edeaee0-4091-4114-3eaf-08d7fc8aacd2
X-MS-TrafficTypeDiagnostic: DM6PR12MB3260:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3260EEC5E50B9A746401F5E983B60@DM6PR12MB3260.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04097B7F7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wdMPcZpomRbJjgCjDgCCUUZya90n7J1+9UkWattp/9IEasATIGqpxoSqxQoeit81uNco0lHslCBaGSB7cK3RKiI18D/vtolrL7Fpd77R1VtsqK3Jg+jepvrL4M5kzIXZ6i1Vq/XVLl0F8z/eg4WTuMInnCs4IN6Yq9f8uEu9LVrJma/0Vi8ByfDNHEqAGfAR3UwG33Q//7pG86y8Ph/bJJHWbEr4WbGM4O6IkPAZ2PhtGdfLcoLMIBFcCaRbEcpxH6gAJKW+2OlA8Mwg+WiUpE6/mHXHObuIGfn+L790APf7Ww+bydhDT0kGjUF2NCx5FTT8Mj/9r+U58LR4muBCynl62DU0UVrXAHcvwtvI4YBadIHH9EpAli1VxgJvmcBoV40fiWiAnIl2vGVN1hwyyWMXNsn1K7y3K+5KnQsvMS+SihdljPyoP/P0VWcyp2C7WRbv0sUKiwkOf8cLxZwwf1seX2ya4qEote9GYgqCd+V6R8sriUMIX3rfuJCsuJZC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(366004)(396003)(136003)(346002)(86362001)(66574014)(66556008)(31696002)(66946007)(36756003)(54906003)(110136005)(8936002)(8676002)(2616005)(66476007)(316002)(478600001)(5660300002)(6666004)(31686004)(52116002)(6486002)(2906002)(4326008)(16526019)(7416002)(186003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: /V/rnfUwvEvDmZLV6qlOAhuH5H1zplobp8r10KdpsMacdqzT5BPNffDK2iJnJWxuBkh6t4+zrCADfkH+0KZMGvR/hSatCm6qK98Pk4sGeScWGo2OWXvvPf+DW1T1s7hAVimWUJpi9wF+37c3x4EjT9q5R1KOxIAAZ23GeylDig6nS925R1qE3ZhzV5boCS1Hsgg4JU8jdasJNWZU/pBx7MmhI1fbVcFNbO2pKGCNcsqnlmKwZ63QDPW/keKAhsmkUb/1sm3UYCPfi0gw1E6QQfEARkUk3Q8xeAk7zP+Ja0QZXEuXT6WrfvUKl1xQCrlIS/OKA0OcHGL/sKqqFUAUXMIFpWdKFbom867K2JM0XCJnbpHwESb2oJsxzNTeHrC6HwDA20vVg6dpTMl7Ln+75rnTrJPJW7JG4Glu242z+YJ6F/ubQXPTOiJLH5220tKaieWkP555dgqrZNsO/gtDBD9mmslWMk962nME5rUTve1svCA29ofYSz4Wqnra3YOp4JvGOTGX7nYACmBcdQ22qZ1C1ObBs+ZZOFCPZ9qldljC5F+nmyrQiTYu4njytz/H
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3edeaee0-4091-4114-3eaf-08d7fc8aacd2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 06:54:43.3172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2iG+D4zLjAeN5gfBpiIKu8PsRzrVGpBLaDRcRCsKqRRuP+jS5A/aJ/qjMEeReL+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3260
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
Cc: amd-gfx@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTkuMDUuMjAgdW0gMTU6Mjcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IERvIGl0IHVuY29u
dGlvbmFsbHksIHRoZXJlJ3MgYSBzZXBhcmF0ZSBwZWVrIGZ1bmN0aW9uIHdpdGgKPiBkbWFfZmVu
Y2VfaXNfc2lnbmFsbGVkKCkgd2hpY2ggY2FuIGJlIGNhbGxlZCBmcm9tIGF0b21pYyBjb250ZXh0
Lgo+Cj4gdjI6IENvbnNlbnN1cyBjYWxscyBmb3IgYW4gdW5jb25kaXRpb25hbCBtaWdodF9zbGVl
cCAoQ2hyaXMsCj4gQ2hyaXN0aWFuKQo+Cj4gRnVsbCBhdWRpdDoKPiAtIGRtYS1mZW5jZS5oOiBV
c2VzIE1BWF9TQ0hFRFVMRV9USU1PVVQsIGdvb2QgY2hhbmNlIHRoaXMgc2xlZXBzCj4gLSBkbWEt
cmVzdi5jOiBUaW1lb3V0IGFsd2F5cyBhdCBsZWFzdCAxCj4gLSBzdC1kbWEtZmVuY2UuYzogU2F2
ZSB0byBzbGVlcCBpbiB0ZXN0Y2FzZXMKPiAtIGFtZGdwdV9jcy5jOiBCb3RoIGNhbGxlcnMgYXJl
IGZvciB2YXJpYW50cyBvZiB0aGUgd2FpdCBpb2N0bAo+IC0gYW1kZ3B1X2RldmljZS5jOiBUd28g
Y2FsbGVycyBpbiB2cmFtIHJlY292ZXIgY29kZSwgYm90aCByaWdodCBuZXh0Cj4gICAgdG8gbXV0
ZXhfbG9jay4KPiAtIGFtZGdwdV92bS5jOiBVc2UgaW4gdGhlIHZtX3dhaXQgaW9jdGwsIG5leHQg
dG8gX3Jlc2VydmUvdW5yZXNlcnZlCj4gLSByZW1haW5pbmcgZnVuY3Rpb25zIGluIGFtZGdwdTog
QWxsIGZvciB0ZXN0X2liIGltcGxlbWVudGF0aW9ucyBmb3IKPiAgICB2YXJpb3VzIGVuZ2luZXMs
IGNhbGxlciBmb3IgdGhhdCBsb29rcyBhbGwgc2FmZSAoZGVidWdmcywgZHJpdmVyCj4gICAgbG9h
ZCwgcmVzZXQpCj4gLSBldG5hdml2OiBhbm90aGVyIHdhaXQgaW9jdGwKPiAtIGhhYmFuYWxhYnM6
IGFub3RoZXIgd2FpdCBpb2N0bAo+IC0gbm91dmVhdV9mZW5jZS5jOiBoYXJkY29kZWQgMTUqSFog
Li4uIGdsb3Jpb3VzCj4gLSBub3V2ZWF1X2dlbS5jOiBoYXJkY29kZWQgMipIWiAuLi4gc28gbm90
IGV2ZW4gc3VwZXIgY29uc2lzdGVudCwgYnV0Cj4gICAgdGhpcyBvbmUgZG9lcyBoYXZlIGEgV0FS
Tl9PTiA6LS8gQXQgbGVhc3QgdGhpcyBvbmUgaXMgb25seSBhCj4gICAgZmFsbGJhY2sgcGF0aCBm
b3Igd2hlbiBrbWFsbG9jIGZhaWxzLiBNYXliZSB0aGlzIHNob3VsZCBiZSBwdXQgb250bwo+ICAg
IHNvbWUgd29ya2VyIGxpc3QgaW5zdGVhZCwgaW5zdGVhZCBvZiBhIHdvcmsgcGVyIHVuYW1wIC4u
Lgo+IC0gaTkxNS9zZWxmdGVzdHM6IEhhcmRlY29kZWQgSFogLyA0IG9yIEhaIC8gOAo+IC0gaTkx
NS9ndC9zZWxmdGVzdHM6IEdvaW5nIHVwIHRoZSBjYWxsY2hhaW4gbG9va3Mgc2FmZSBsb29raW5n
IGF0Cj4gICAgbmVhcmJ5IGNhbGxlcnMKPiAtIGk5MTUvZ3QvaW50ZWxfZ3RfcmVxdWVzdHMuYy4g
V3JhcHBlZCBpbiBhIG11dGV4X2xvY2sKPiAtIGk5MTUvZ2VtX2k5MTVfZ2VtX3dhaXQuYzogVGhl
IGk5MTUtdmVyc2lvbiB3aGljaCBpcyBjYWxsZWQgaW5zdGVhZAo+ICAgIGZvciBpOTE1IGZlbmNl
cyBhbHJlYWR5IGhhcyBhIG1pZ2h0X3NsZWVwKCkgYW5ub3RhdGlvbiwgc28gYWxsIGdvb2QKPgo+
IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6IEx1Y2Fz
IFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5u
aWt1bGFAbGludXguaW50ZWwuY29tPgo+IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0
aW5lbkBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGlu
dGVsLmNvbT4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+IENjOiAiVk13
YXJlIEdyYXBoaWNzIiA8bGludXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdhcmUuY29tPgo+IENj
OiBPZGVkIEdhYmJheSA8b2RlZC5nYWJiYXlAZ21haWwuY29tPgo+IENjOiBsaW51eC1tZWRpYUB2
Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gQ2M6
IGxpbnV4LXJkbWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9kbWEtYnVm
L2RtYS1mZW5jZS5jIHwgMiArKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYyBiL2RyaXZlcnMvZG1h
LWJ1Zi9kbWEtZmVuY2UuYwo+IGluZGV4IDkwZWRmMmIyODFiMC4uNjU2ZTlhYzJkMDI4IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYwo+ICsrKyBiL2RyaXZlcnMvZG1h
LWJ1Zi9kbWEtZmVuY2UuYwo+IEBAIC0yMDgsNiArMjA4LDggQEAgZG1hX2ZlbmNlX3dhaXRfdGlt
ZW91dChzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSwgYm9vbCBpbnRyLCBzaWduZWQgbG9uZyB0aW1l
b3V0KQo+ICAgCWlmIChXQVJOX09OKHRpbWVvdXQgPCAwKSkKPiAgIAkJcmV0dXJuIC1FSU5WQUw7
Cj4gICAKPiArCW1pZ2h0X3NsZWVwKCk7Cj4gKwo+ICAgCXRyYWNlX2RtYV9mZW5jZV93YWl0X3N0
YXJ0KGZlbmNlKTsKPiAgIAlpZiAoZmVuY2UtPm9wcy0+d2FpdCkKPiAgIAkJcmV0ID0gZmVuY2Ut
Pm9wcy0+d2FpdChmZW5jZSwgaW50ciwgdGltZW91dCk7CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
