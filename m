Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CF12D7129
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45ABB6EC78;
	Fri, 11 Dec 2020 08:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA25E6EC78
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 08:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIm8ZpsIYjla3KsY3lPfVLG+o9Fh5sHAnpNi1+Z3Euty62WfJSZzB4+J0rWlCfWg4v6R/VmFnjyVrinj0nKzJKclGcXSGmuKOJ9J9PW0+EWmSmBgea8SgXPmpaTD5xyrXXthBQMZrwHcMcAin417+3DI3rcA6Lo2SkdFUrvSTx42/J5FM+tMBEnKpOTZ7gAlOsjBp+Hx8SuB22Ee/ZfW2Lk+Wucr6LBtGF/OmS13F+J8wKhK/aKhJqmK/YctdWAKmFYcidoVhEYWGP5aM3HFvX3MF6ktEtvgWSNetno2Zo4wu3Q/nf7ETGfJA0M/e8HTXRy42LrhZU97UWv3dbJfmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lER1/WoGovLjy84KcxRCj6bJ7dI2TxCZQ93ok2ZRWU=;
 b=VpziYa7j+1ZOM/zgsvXMrUBDNsHn9yDt5GcBv2gNyMpfuxBfumui+5ogq4GQ6USjnO1ORt8Er8GuQg4Bi96xQ0Z1Hl5srE5r0nbLMXO/wca9Ye6pcec6lc5oqRGuBUNPVwybe531wdajxPGHxkmBnxwcjAYhmzxC9CXgndbJon9v3627V4Fz8T+IPz4hCMlbZv7Mmz0Rm7dWNNE5m04t50hFxSiBWBgCh6zt1XQV8sBxmiIvdbSPmJ6CgLXAhUTFX94VESWeoyH1dZp8J1lsj7/nTscQ/0sKfFkAMIXrJf2xJHgKKvNciatIr6ZpUsKwaTmI0hQ1FnhnbAuEr7c54A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lER1/WoGovLjy84KcxRCj6bJ7dI2TxCZQ93ok2ZRWU=;
 b=yrIFXSLW2o6bf7t4qsib/gnrxhwMpqoMS1GdbGte+v48dtWbP02rwBLKon36W3fLvL9l1rzs10Uhp/XjRv+To9/EyVVQFQO+L2rZlgQJVE4LIbP/ESUvksr7acJLzOSrOALGFG2mdCuPC6y8s6L7Jvtf4dbMPnW8koMPwY3f2fs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4946.namprd12.prod.outlook.com (2603:10b6:208:1c5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 08:03:36 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 08:03:36 +0000
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
To: Hridya Valsaraju <hridya@google.com>
References: <20201210044400.1080308-1-hridya@google.com>
 <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com> <X9H0JREcdxDsMtLX@kroah.com>
 <20201210102727.GE401619@phenom.ffwll.local> <X9H+3AP1q39aMxeb@kroah.com>
 <f95ee5dc-62f8-4870-11e4-3513dc8382ef@amd.com>
 <CA+wgaPPtoz_JSAwsVVpFGLrcrO8-tAGD+gdrsWmBA3jpidigzQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e854d168-9299-7326-743e-874882d8073f@amd.com>
Date: Fri, 11 Dec 2020 09:03:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CA+wgaPPtoz_JSAwsVVpFGLrcrO8-tAGD+gdrsWmBA3jpidigzQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 08:03:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 42aceb2b-c9dc-4795-7fda-08d89dab42ed
X-MS-TrafficTypeDiagnostic: BL0PR12MB4946:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4946256B3696ABA6A13FF29683CA0@BL0PR12MB4946.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V2qZXPyTanI4b/u6ZRTv8/tFZ6wt8uqQG40DMKIFkClkzKBuLDqqt1gVkrq1U/zVwWx8doYOqFqtvx4EICXwgRonkXxUsVDxFfSVPECigHshOs8avkquKVesXNJKeIREqC3F5CYosQZHuNq0jEMwrQmjwBuLp5fIcQzy7NUhvtdIQX6eez9qoGVfoHC4gaper6b03g5vkN3Mz9M1DCrL6Ha9Jm2cq21kh6j23MWZY2XEQd2iKGO+k6nG7NdyQyfqUIhiGfN2icQCfYUnP7OiXai26DITtPm+39yBRvmFGYdGsakgxgrViG1E3odxJrC4/v6A2NyzN/3aZm2c4r6ocMY67JeJ0IPK7w6FNsHkud91ktX9uGk6V/64LK0eIfgfPBsZPk8mO2xdnn9lTXnxIOsipwz49Jbmc5pRBnBIrO8vLPj+TnKAA2wCPnSuMEMU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(31696002)(8936002)(16526019)(186003)(6666004)(34490700003)(54906003)(66574015)(66476007)(31686004)(86362001)(2616005)(66556008)(36756003)(8676002)(52116002)(508600001)(2906002)(66946007)(5660300002)(53546011)(6916009)(6486002)(83380400001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UlhzaHdYRnBqY1gwNU5LTW5Gd2NBRUZEZ014MHdqWmVPbjVOTEt4aXpVVSty?=
 =?utf-8?B?M0dqZnNTSjJKbHk0M01mRStkWk8wVWthRS9RM01sOHFmUWVMYmEzYUFWUEtK?=
 =?utf-8?B?SUd0bjBuYyttek5IYTF3b3BmbkhGdWJPU3dTTlJKUVhUVzhVdmFFOENHWE5z?=
 =?utf-8?B?WllFdmR4OUdxZ3g0NzFONmcrUVI3Q1grb0ZEVkRsU2JiaHNWRXVrOUU5K3dC?=
 =?utf-8?B?bG02aS9ZUGNGb1BMYmRONE1GeWVkR0JESjZkdU5iT2JTdkU5cnIwRit1Zjcr?=
 =?utf-8?B?aCtneTFvRFo5Yjg3YWoxaHVMWHpNblhVeEV2STI1cVkvVC9FWGhoTDJ0RGNh?=
 =?utf-8?B?ZDVveWNIYURRcGdjR0ltLzJOZXNSOUpDVUtVSURwaGRoL3k5VDlDeWkyNWNS?=
 =?utf-8?B?L1Z1TFBHOWpOTDU5SlNrc0Q1YmFJSDBtTzMzYkZmbVdLTHpwb3lOb2c0Vzdx?=
 =?utf-8?B?T2JlOUkvTGJCaTR0cHRvMzlTQ3J6UGQ5bmZjTjM4TExCQVZsZHVzc2EyZGsr?=
 =?utf-8?B?Y0VQY1IrQVBsTlB1cVdtUWZBdVZkT0Nqdk5rZmFLbUpHTnJOaUhXcy9ZT1F5?=
 =?utf-8?B?UGgybjBtbWMyYWF6aWVuSXVoWGM1cEg5Z0dycjRPWDdlcVNjdXJaNjZ1cjlM?=
 =?utf-8?B?NHlGYlI3RmhYQXMyZ1ZQZHhRNm9PL3FhMGgra3R2UjNkSnBYenZNaHFiNTF5?=
 =?utf-8?B?bXFZWnBrdXpUWmhCUHdBQzJNQ280ekw0RnJWOFlISHNkR3JBNDJZMVB3MzI1?=
 =?utf-8?B?Ly9uYnBka25XTGJDbFFHMXlGeVYxQkx3TTJMY0hmaHJBaURVMEdMdGl5WXd4?=
 =?utf-8?B?cC9qYytYT3RBcGhtU3dSMitlVzJvVnpUMGg4bG9vR1RGZmpXeE5DSnZsK3dO?=
 =?utf-8?B?VmhHUytoWHJEUnpZOWpPcEhyMmhHRzRqT29aZCtVSlN0amNONWpDdkhBSG41?=
 =?utf-8?B?QllqWmtBb2U1SUdkRnBFeW5tWjVZY2Rpb2RPOEdMbERYb09ZSmpFWndFdWor?=
 =?utf-8?B?S20ySXRhdFVhMzdrUDk2NTJjUVpZYnZyQ0NYODJHUVU2ZGIydFllRFJsbnVB?=
 =?utf-8?B?aUZ6eGNkYTV5UmNXd0gwTlMzOTFxT3hmZUZJeHp5OE5aTm53ZEdSbTd2d0Js?=
 =?utf-8?B?cnEvOFByV1VwUXF4TmpCSmd3SnlwUVBhV2tmb0w4V3RLSnF1NG5YazFqcTVF?=
 =?utf-8?B?bkNXamdpMG55dXpqbzB2VFNyYkRQUm80VnJxUklHZHdGTWNGZkp5a09nZnlF?=
 =?utf-8?B?ekFudDFSTkw2eDF5SDF1Ky8vbEVGU0VKSTRiam5KT2MraEQwYkIxYjZMcG5Y?=
 =?utf-8?B?bmhUbXlRb29WTEl1U3AzTVZxYTA1bUxvNStlWHZxSVVnUU1DeGIvTTBuaWRm?=
 =?utf-8?B?cUF0SFd1VHhURjE3NFY5SUVROE1YcmR3ODlucERHME8xdUdQcDdEOGV2UGRr?=
 =?utf-8?Q?6wH1JQxO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 08:03:35.9295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 42aceb2b-c9dc-4795-7fda-08d89dab42ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FD286cTrPdmpcVDHTBR9Gi2wuuR07aEsaFtWGkCDgywgL7N6riw5Nak7vGczkxTr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4946
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
Cc: Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Suren Baghdasaryan <surenb@google.com>,
 Android Kernel Team <kernel-team@android.com>, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTAuMTIuMjAgdW0gMjM6NDEgc2NocmllYiBIcmlkeWEgVmFsc2FyYWp1Ogo+IFRoYW5rcyBh
Z2FpbiBmb3IgdGhlIHJldmlld3MhCj4KPiBPbiBUaHUsIERlYyAxMCwgMjAyMCBhdCAzOjAzIEFN
IENocmlzdGlhbiBLw7ZuaWcKPiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPj4g
QW0gMTAuMTIuMjAgdW0gMTE6NTYgc2NocmllYiBHcmVnIEtIOgo+Pj4gT24gVGh1LCBEZWMgMTAs
IDIwMjAgYXQgMTE6Mjc6MjdBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+PiBPbiBU
aHUsIERlYyAxMCwgMjAyMCBhdCAxMToxMDo0NUFNICswMTAwLCBHcmVnIEtIIHdyb3RlOgo+Pj4+
PiBPbiBUaHUsIERlYyAxMCwgMjAyMCBhdCAxMDo1ODo1MEFNICswMTAwLCBDaHJpc3RpYW4gS8O2
bmlnIHdyb3RlOgo+Pj4+Pj4gSW4gZ2VuZXJhbCBhIGdvb2QgaWRlYSwgYnV0IEkgaGF2ZSBhIGZl
dyBjb25jZXJuL2NvbW1lbnRzIGhlcmUuCj4+Pj4+Pgo+Pj4+Pj4gQW0gMTAuMTIuMjAgdW0gMDU6
NDMgc2NocmllYiBIcmlkeWEgVmFsc2FyYWp1Ogo+Pj4+Pj4+IFRoaXMgcGF0Y2ggYWxsb3dzIHN0
YXRpc3RpY3MgdG8gYmUgZW5hYmxlZCBmb3IgZWFjaCBETUEtQlVGIGluCj4+Pj4+Pj4gc3lzZnMg
YnkgZW5hYmxpbmcgdGhlIGNvbmZpZyBDT05GSUdfRE1BQlVGX1NZU0ZTX1NUQVRTLgo+Pj4+Pj4+
Cj4+Pj4+Pj4gVGhlIGZvbGxvd2luZyBzdGF0cyB3aWxsIGJlIGV4cG9zZWQgYnkgdGhlIGludGVy
ZmFjZToKPj4+Pj4+Pgo+Pj4+Pj4+IC9zeXMva2VybmVsL2RtYWJ1Zi88aW5vZGVfbnVtYmVyPi9l
eHBvcnRlcl9uYW1lCj4+Pj4+Pj4gL3N5cy9rZXJuZWwvZG1hYnVmLzxpbm9kZV9udW1iZXI+L3Np
emUKPj4+Pj4+PiAvc3lzL2tlcm5lbC9kbWFidWYvPGlub2RlX251bWJlcj4vZGV2X21hcF9pbmZv
Cj4+Pj4+Pj4KPj4+Pj4+PiBUaGUgaW5vZGVfbnVtYmVyIGlzIHVuaXF1ZSBmb3IgZWFjaCBETUEt
QlVGIGFuZCB3YXMgYWRkZWQgZWFybGllciBbMV0KPj4+Pj4+PiBpbiBvcmRlciB0byBhbGxvdyB1
c2Vyc3BhY2UgdG8gdHJhY2sgRE1BLUJVRiB1c2FnZSBhY3Jvc3MgZGlmZmVyZW50Cj4+Pj4+Pj4g
cHJvY2Vzc2VzLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQ3VycmVudGx5LCB0aGlzIGluZm9ybWF0aW9uIGlz
IGV4cG9zZWQgaW4KPj4+Pj4+PiAvc3lzL2tlcm5lbC9kZWJ1Zy9kbWFfYnVmL2J1ZmluZm8uCj4+
Pj4+Pj4gSG93ZXZlciwgc2luY2UgZGVidWdmcyBpcyBjb25zaWRlcmVkIHVuc2FmZSB0byBiZSBt
b3VudGVkIGluIHByb2R1Y3Rpb24sCj4+Pj4+Pj4gaXQgaXMgYmVpbmcgZHVwbGljYXRlZCBpbiBz
eXNmcy4KPj4+Pj4+IE1obSwgdGhpcyBtYWtlcyBpdCBwYXJ0IG9mIHRoZSBVQVBJLiBXaGF0IGlz
IHRoZSBqdXN0aWZpY2F0aW9uIGZvciB0aGlzPwo+Pj4+Pj4KPj4+Pj4+IEluIG90aGVyIHdvcmRz
IGRvIHdlIHJlYWxseSBuZWVkIHRob3NlIGRlYnVnIGluZm9ybWF0aW9uIGluIGEgcHJvZHVjdGlv
bgo+Pj4+Pj4gZW52aXJvbm1lbnQ/Cj4+Pj4+IFByb2R1Y3Rpb24gZW52aXJvbm1lbnRzIHNlZW0g
dG8gd2FudCB0byBrbm93IHdobyBpcyB1c2luZyB1cCBtZW1vcnkgOikKPj4+PiBUaGlzIG9ubHkg
c2hvd3Mgc2hhcmVkIG1lbW9yeSwgc28gaXQgZG9lcyBzbWVsbCBhIGxvdCBsaWtlICRzcGVjaWZp
Y19pc3N1ZQo+Pj4+IGFuZCB3ZSdyZSBkZXNpZ25pbmcgYSBuYXJyb3cgc29sdXRpb24gZm9yIHRo
YXQgYW5kIHRoZW4gaGF2ZSB0byBjYXJyeSBpdAo+Pj4+IGZvcmV2ZXIuCj4+PiBJIHRoaW5rIHRo
ZSAiaXNzdWUiIGlzIHRoYXQgdGhpcyB3YXMgYSBmZWF0dXJlIGZyb20gaW9uIHRoYXQgcGVvcGxl
Cj4+PiAibWlzc2VkIiBpbiB0aGUgZG1hYnVmIG1vdmUuICBUYWtpbmcgYXdheSB0aGUgYWJpbGl0
eSB0byBzZWUgd2hhdCBraW5kCj4+PiBvZiBhbGxvY2F0aW9ucyB3ZXJlIGJlaW5nIG1hZGUgZGlk
bid0IG1ha2UgYSBsb3Qgb2YgZGVidWdnaW5nIHRvb2xzCj4+PiBoYXBweSA6KAo+PiBZZWFoLCB0
aGF0IGlzIGNlcnRhaW5seSBhIHZlcnkgdmFsaWQgY29uY2Vybi4KPj4KPj4+IEJ1dCBIcmlkeWEg
a25vd3MgbW9yZSwgc2hlJ3MgYmVlbiBkZWFsaW5nIHdpdGggdGhlIHRyYW5zaXRpb24gZm9yIGEg
bG9uZwo+Pj4gdGltZSBub3cuCj4gQ3VycmVudGx5LCB0ZWxlbWV0cnkgdG9vbHMgY2FwdHVyZSB0
aGlzIGluZm9ybWF0aW9uKGFsb25nIHdpdGggb3RoZXIKPiBtZW1vcnkgbWV0cmljcykgcGVyaW9k
aWNhbGx5IGFzIHdlbGwgYXMgb24gaW1wb3J0YW50IGV2ZW50cyBsaWtlIGEKPiBmb3JlZ3JvdW5k
IGFwcCBraWxsICh3aGljaCBtaWdodCBoYXZlIGJlZW4gdHJpZ2dlcmVkIGJ5IGFuIExNSykuIFdl
Cj4gd291bGQgYWxzbyBsaWtlIHRvIGdldCBhIHNuYXBzaG90IG9mIHRoZSBzeXN0ZW0gbWVtb3J5
IHVzYWdlIG9uIG90aGVyCj4gZXZlbnRzIHN1Y2ggYXMgT09NIGtpbGxzIGFuZCBBTlJzLgoKVGhh
dCB1c2Vyc3BhY2UgdG9vbHMgYXJlIGdvaW5nIHRvIHVzZSB0aG9zZSBmaWxlcyBkaXJlY3RseSBp
cyB0aGUgCmp1c3RpZmljYXRpb24geW91IG5lZWQgZm9yIHRoZSBzdGFibGUgVUFQSSBwcm92aWRl
ZCBieSBzeXNmcy4KCk90aGVyd2lzZSBkZWJ1Z2ZzIHdvdWxkIGJlIHRoZSB3YXkgdG8gZ28gZXZl
biB3aGVuIHRoYXQgaXMgb2Z0ZW4gZGlzYWJsZWQuCgpQbGVhc2UgY2hhbmdlIHRoZSBjb21taXQg
bWVzc2FnZSB0byByZWZsZWN0IHRoYXQuCgo+Pj4+IEUuZy4gd2h5IGlzIHRoZSBsaXN0IG9mIGF0
dGFjaG1lbnRzIG5vdCBhIHN5c2ZzIGxpbms/IFRoYXQncyBob3cgd2UKPj4+PiB1c3VhbGx5IGV4
cG9zZSBzdHJ1Y3QgZGV2aWNlICogcG9pbnRlcnMgaW4gc3lzZnMgdG8gdXNlcnNwYWNlLCBub3Qg
YXMgYQo+Pj4+IGxpc3Qgb2YgdGhpbmdzLgo+Pj4gVGhlc2UgYXJlbid0IHN0cnVjdCBkZXZpY2Vz
LCBzbyBJIGRvbid0IHVuZGVyc3RhbmQgdGhlIG9iamVjdGlvbiBoZXJlLgo+Pj4gV2hlcmUgZWxz
ZSBjb3VsZCB0aGVzZSBnbyBpbiBzeXNmcz8KPj4gU3VyZSB0aGV5IGFyZSEgSnVzdCB0YWtlIGEg
bG9vayBhdCBhbiBhdHRhY2htZW50Ogo+Pgo+PiBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50IHsK
Pj4gICAgICAgICAgICBzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmOwo+PiAgICAgICAgICAgIHN0cnVj
dCBkZXZpY2UgKmRldjsKPj4KPj4gVGhpcyBpcyB0aGUgc3RydWN0IGRldmljZSB3aGljaCBpcyBp
bXBvcnRpbmcgdGhlIGJ1ZmZlciBhbmQgdGhlIHBhdGNoIGluCj4+IGRpc2N1c3Npb24gaXMganVz
dCBwcmludGluZyB0aGUgbmFtZSBvZiB0aGlzIGRldmljZSBpbnRvIHN5c2ZzLgo+IEkgYWN0dWFs
bHkgZGlkIG5vdCBrbm93IHRoYXQgdGhpcyBpcyBub3Qgb2sgdG8gZG8uIEkgd2lsbCBjaGFuZ2Ug
aXQgaW4KPiB0aGUgbmV4dCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCB0byBiZSBzeXNmcyBsaW5rcyBp
bnN0ZWFkLgoKVGhhbmtzLCB5b3UgbmVlZCB0byByZXN0cnVjdHVyZSB0aGlzIHBhdGNoIGEgYml0
LiBCdXQgSSBhZ3JlZSB3aXRoIApEYW5pZWwgdGhhdCBsaW5rcyB0byB0aGUgZGV2aWNlcyB3aGlj
aCBhcmUgYXR0YWNoZWQgYXJlIG1vcmUgYXBwcm9wcmlhdGUuCgpJJ20ganVzdCBub3Qgc3VyZSBo
b3cgd2Ugd2FudCB0byByZXByZXNlbnQgdGhlIG1hcCBjb3VudCBmb3IgZWFjaCAKYXR0YWNobWVu
dCB0aGVuLCBwcm9iYWJseSBiZXN0IHRvIGhhdmUgdGhhdCBhcyBzZXBhcmF0ZSBmaWxlIGFzIHdl
bGwuCgpSZWdhcmRzLApDaHJpc3RpYW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
