Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940D56A68B4
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 09:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D30310E08B;
	Wed,  1 Mar 2023 08:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76AC610E08B;
 Wed,  1 Mar 2023 08:17:42 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3216cId3005693; Wed, 1 Mar 2023 08:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=CQScUIGKtlT2TiYrhL0qWZOdCO7inGQ1+LIQ9FVpMUU=;
 b=F2wKH1aSn7MN8Lut2zHXN0CkIjlpYMO9XT/ZYgrEU6Q5OSSnxtYQgq4ENgURB0ROiqlv
 cQrzbih6sqVOC7daYF6ipbMdTZ63tWNfuTbb3GWSVhOiOio5YTWmKfv1+VmwwrQlGCNB
 v77u6389dck6nHR1d+chtNe05HMkgf19o+Zy+6NCHSnnJEcA9au/8CksOb7GQAxt19e1
 JQyJh4jZvjgGfSdI3Wr1QW7xienFxVSNmWv9mkEG+wypaopmw+CCFHrUapA2zKgOe32R
 YQ2FZyBCXDFFMcUcue58JFSvrTr/NCdptw8hm+o6T/e1QLIZynY95Csxs0A+xLw7uRlB tg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p1csvusex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Mar 2023 08:17:37 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3218HaCn028858
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 1 Mar 2023 08:17:36 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 1 Mar 2023 00:17:36 -0800
Received: from nalasex01a.na.qualcomm.com ([fe80::96c7:affa:94e1:ece3]) by
 nalasex01a.na.qualcomm.com ([fe80::96c7:affa:94e1:ece3%4]) with mapi id
 15.02.0986.041; Wed, 1 Mar 2023 00:17:35 -0800
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
Subject: RE: [RFC PATCH 0/2] drm/msm/dp: refactor the msm dp driver resources
Thread-Topic: [RFC PATCH 0/2] drm/msm/dp: refactor the msm dp driver resources
Thread-Index: AQHZR461gXZWymBL0UKWfrJhDV1p1K7dK0OAgAhxVDA=
Date: Wed, 1 Mar 2023 08:17:35 +0000
Message-ID: <811d80e37e69485aa5b7bbe0a2fce3f0@quicinc.com>
References: <20230223135635.30659-1-quic_sbillaka@quicinc.com>
 <CAA8EJppZ+Hyhb9MacaFX6xTrJ9XyYbbCRrBvO+yE0=-Bztk7CQ@mail.gmail.com>
In-Reply-To: <CAA8EJppZ+Hyhb9MacaFX6xTrJ9XyYbbCRrBvO+yE0=-Bztk7CQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.216.29.118]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 81f5vgjDNv8uP5wIkfJbyGp47VbM5WN8
X-Proofpoint-ORIG-GUID: 81f5vgjDNv8uP5wIkfJbyGp47VbM5WN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_04,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 mlxlogscore=734
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303010066
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Bjorn Andersson \(QUIC\)" <quic_bjorande@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pj4gVGhlIERQIGRyaXZlciByZXNvdXJjZXMgYXJlIGN1cnJlbnRseSBlbmFibGVkIGFuZCBkaXNh
YmxlZCBkaXJlY3RseSBiYXNlZA0KPm9uIGNvZGUgZmxvdy4NCj4+IEFzIG1lbnRpb25lZCBpbiBi
dWcgMjMwNjMxNjAyLCB3ZSB3YW50IHRvIGRvIHRoZSBmb2xsb3dpbmc6DQo+DQo+cHJpdmF0ZSBi
dWcgdHJhY2tlcg0KPg0KDQpXaWxsIHJlbW92ZSB0aGUgcmVmZXJlbmNlIGZvciB0aGlzLg0KDQo+
Pg0KPj4gMSkgUmVmYWN0b3IgdGhlIGRwL2VkcCBwYXJzaW5nIGNvZGUgdG8gbW92ZSBpdCB0byBw
cm9iZSAoaXQgaXMgY3VycmVudGx5IGRvbmUNCj5pbiBiaW5kKS4NCj4NCj5UaGlzIGlzIGdvb2Qu
IEknZCBzdWdnZXN0IHNwbGl0dGluZyB0aGlzIGludG8gc21hbGxlciBjaHVua3MuIEZpcnN0LCBt
b3ZlIGFsbA0KPnJlc291cmNlIGJpbmRpbmcsIHRoZW4gbW92ZSB0aGUgYWN0dWFsIGRwX2F1eCBo
YW5kbGluZy4gSXQgd291bGQgYmUgZWFzaWVyIHRvDQo+cmV2aWV3IGl0IHRoaXMgd2F5Lg0KPg0K
DQpPa2F5LCB3aWxsIG1vdmUgdGhlIHJlc291cmNlIGJpbmRpbmcgcGF0Y2ggZmlyc3QuDQoNCj4+
IDIpIFRoZW4gYmluZCBhbGwgdGhlIHBvd2VyIHJlc291cmNlcyBuZWVkZWQgZm9yIEFVWCBpbiBw
bV9ydW50aW1lX29wcy4NCj4+DQo+PiAzKSBIYW5kbGUgRVBST0JFX0RFRkVSIGNhc2VzIG9mIHRo
ZSBwYW5lbC1lRFAgYXV4IGRldmljZS4NCj4NCj5UaGlzIGlzIG5vdCBoYW5kbGVkIHByb3Blcmx5
LiBUaGUgZURQIGF1eCBwcm9iaW5nIGlzIGFzeW5jaHJvbm91cywgc28geW91DQo+c2hvdWxkIG1v
dmUgdGhlIHNlY29uZCBzdGFnZSBpbnRvIHRoZSBkb25lX3Byb2JpbmcoKSBwYXJ0LCByYXRoZXIg
dGhhbg0KPnJlbHlpbmcgb24gdGhlIC1FUFJPQkVfREVGRVIuIFRoZXJlIGNhbiBiZSBjYXNlcywg
d2hlbiB0aGUgcGFuZWwgZHJpdmVyIGlzDQo+bm90IGF2YWlsYWJsZSBhdCB0aGUgRFAncyBwcm9i
ZSB0aW1lLiBJbiBzdWNoIGNhc2VzIHdlIHNob3VsZCBsZWF2ZSB0aGUgRFANCj5kcml2ZXIgcHJv
YmVkLCB0aGVuIHdhaXQgZm9yIHRoZSBwYW5lbCBiZWZvcmUgYmluZGluZyB0aGUgY29tcG9uZW50
Lg0KPg0KDQpPa2F5LCBJIHdpbGwgZXhwbG9yZSB0aGlzLg0KDQo+PiA0KSBWZXJpZnkgRFAgZnVu
Y3Rpb25hbGl0eSBpcyB1bmFmZmVjdGVkLg0KPj4NCj4+IFRoZXNlIGNvZGUgY2hhbmdlcyB3aWxs
IHBhcnNlIHRoZSByZXNvdXJjZXMgYW5kIGdldCB0aGUgZWRwIHBhbmVsIGR1cmluZw0KPnByb2Jl
Lg0KPj4gQWxsIHRoZSBuZWNlc3NhcnkgcmVzb3VyY2VzIHJlcXVpcmVkIGZvciB0aGUgYXV4IHRy
YW5zYWN0aW9ucyBhcmUgbW92ZWQgdG8NCj5wbV9ydW50aW1lIG9wcy4NCj4+IFRoZXkgYXJlIGVu
YWJsZWQgb3IgZGlzYWJsZWQgdmlhIGdldC9wdXQgc3luYyBmdW5jdGlvbnMuDQo+Pg0KPj4gVGhp
cyBpcyBhIFJGQyB0byB2ZXJpZnkgd2l0aCB0aGUgY29tbXVuaXR5IGlmIHRoZSBhcHByb2FjaCB3
ZSBhcmUgdGFraW5nIGlzDQo+Y29ycmVjdC4NCj4+DQo+PiBodHRwczovL3BhcnRuZXJpc3N1ZXRy
YWNrZXIuY29ycC5nb29nbGUuY29tL2lzc3Vlcy8yMzA2MzE2MDINCj4NCj5UaGlzIGxpbmsgaXMg
dXNlbGVzcywgc2luY2UgaXRzIGNvbnRlbnRzIGFyZSBub3QgcHVibGljLg0KPg0KDQoNCk9rYXks
IEkgd2lsbCByZW1vdmUgaXQuDQoNCj4+DQo+PiBTYW5rZWVydGggQmlsbGFrYW50aSAoMik6DQo+
PiAgIGRybS9tc20vZHA6IGVudW1lcmF0ZSBlZHAgcGFuZWwgZHVyaW5nIGRyaXZlciBwcm9iZQ0K
Pj4gICBkcm0vbXNtL2RwOiBlbmFibGUgcG1fcnVudGltZSBzdXBwb3J0IGZvciBkcCBkcml2ZXIN
Cj4+DQo+PiAgZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9hdXguYyAgICAgfCAxNTUgKysrKysr
KysrKysrKysrKysrKysrLS0NCj4+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2NhdGFsb2cu
YyB8ICAxMiArKw0KPj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfY2F0YWxvZy5oIHwgICAx
ICsNCj4+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYyB8IDE4NSArKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tDQo+PiAgZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9wb3dl
ci5jICAgfCAgIDcgLS0NCj4+ICA1IGZpbGVzIGNoYW5nZWQsIDI1MCBpbnNlcnRpb25zKCspLCAx
MTAgZGVsZXRpb25zKC0pDQo+Pg0KPj4gLS0NCj4+IDIuMzkuMA0KPj4NCj4NCj4NCj4tLQ0KPldp
dGggYmVzdCB3aXNoZXMNCj5EbWl0cnkNCg==
