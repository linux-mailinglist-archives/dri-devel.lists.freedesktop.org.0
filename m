Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8630D9254D5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 09:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B4710E74D;
	Wed,  3 Jul 2024 07:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Dig3kYqm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD9E10E731
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 05:58:36 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4634Yn2b010616;
 Wed, 3 Jul 2024 05:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=2bCbwj31Jqvp01Ij45V+38
 DSdGH4QBJ4EfdMmc5rl+g=; b=Dig3kYqmOsPT2BTpKGIMJvFn9cFT/+m5SQNM4D
 zKJHCTVmYuTgTrs8os/g6OLdMGXTm13cvJhcyMbLJL6DqC93tVLdfIevh9Sk4a4b
 lj7ByhjnQanjqt9WxdMVvMUcaI/CHNwe/xLt5wGmWEPm9dtwq2aC7kp5p8L1jGlE
 3o1oUE7Hwg2013NZ33c3SJNEElF0Gm8kh30RTuRgfSF6MITf1699rceqcc9IIcv1
 99xV9RNkgN2aU8xY4dhvmXz94ZHFaGZSUK736D6KfT/3765k7C6fMp08FKmfwlZ+
 IDLmqkVH04Lifpp8mHx1RJ9MNuXPt+QJdPmO3LjLZjx4iK6A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404yr984d0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jul 2024 05:58:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4635wV1X008878
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Jul 2024 05:58:31 GMT
Received: from hu-azarrabi-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 2 Jul 2024 22:58:30 -0700
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Subject: [PATCH RFC 0/3] Implement Qualcomm TEE IPC and ioctl calls
Date: Tue, 2 Jul 2024 22:57:35 -0700
Message-ID: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE/ohGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcwMj3cLk/FzdktRU3fykrNTkEt3EvBTdzPzkkpxiXbM0U6O0lFQDYxM
 LUyWgAQVFqWmZFWDDo5WC3JyVYmtrAeTmQadxAAAA
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 "Amirreza Zarrabi" <quic_azarrabi@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7O4WY9ZCbdTvL_HRAaIGxYzG58P6xYQ2
X-Proofpoint-ORIG-GUID: 7O4WY9ZCbdTvL_HRAaIGxYzG58P6xYQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_02,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030042
X-Mailman-Approved-At: Wed, 03 Jul 2024 07:41:52 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Qualcomm TEE hosts Trusted Applications (TAs) and services that run in
the secure world. Access to these resources is provided using MinkIPC.
MinkIPC is a capability-based synchronous message passing facility. It
allows code executing in one domain to invoke objects running in other
domains. When a process holds a reference to an object that lives in
another domain, that object reference is a capability. Capabilities
allow us to separate implementation of policies from implementation of
the transport.

As part of the upstreaming of the object invoke driver (called SMC-Invoke
driver), we need to provide a reasonable kernel API and UAPI. The clear
option is to use TEE subsystem and write a back-end driver, however the
TEE subsystem doesn't fit with the design of Qualcomm TEE.

Does TEE subsystem fit requirements of a capability based system?
-----------------------------------------------------------------
In TEE subsystem, to invoke a function:
   - client should open a device file "/dev/teeX",
   - create a session with a TA, and
   - invoke the functions in that session.

1. The privilege to invoke a function is determined by a session. If a
   client has a session, it cannot share it with other clients. Even if
it does, it is not fine-grained enough, i.e. either all accessible
functions/resources in a session or none. Assume a scenario when a client
wants to grant a permission to invoke just a function that it has the rights,
to another client.

The "all or nothing" for sharing sessions is not in line with our
capability system: "if you own a capability, you should be able to grant
or share it".

2. In TEE subsystem, resources are managed in a context. Every time a
   client opens "/dev/teeX", a new context is created to keep track of
the allocated resources, including opened sessions and remote objects. Any
effort for sharing resources between two independent clients requires
involvement of context manager, i.e. the back-end driver. This requires
implementing some form of policy in the back-end driver.

3. The TEE subsystem supports two type of memory sharing:
   - per-device memory pools, and
   - user defined memory references.
User defined memory references are private to the application and cannot
be shared. Memory allocated from per-device "shared" pools are accessible
using a file descriptor. It can be mapped by any process if it has
access to it. This means, we cannot provide the resource isolation
between two clients. Assume a scenario when a client wants to allocate a
memory (which is shared with TEE) from an "isolated" pool and share it
with another client, without the right to access the contents of memory.

4. The kernel API provided by TEE subsystem does not support a kernel
   supplicant. Adding support requires an execution context (e.g. a
kernel thread) due to the TEE subsystem design. tee_driver_ops supports
only "send" and "receive" callbacks and to deliver a request, someone
should wait on "receive".

We need a callback to "dispatch" or "handle" a request in the context of
the client thread. It should redirect a request to a kernel service or
a user supplicant. In TEE subsystem such requirement should be implemented
in TEE back-end driver, independent from the TEE subsystem.

5. The UAPI provided by TEE subsystem is similar to the GPTEE Client
   interface. This interface is not suitable for a capability system.
For instance, there is no session in a capability system which means
either its should not be used, or we should overload its definition.

Can we use TEE subsystem?
-------------------------
There are workarounds for some of the issues above. The question is if we
should define our own UAPI or try to use a hack-y way of fitting into
the TEE subsystem. I am using word hack-y, as most of the workaround
involves:

- "diverging from the definition". For instance, ignoring the session
  open and close ioctl calls or use file descriptors for all remote
resources (as, fd is the closet to capability) which undermines the
isolation provided by the contexts,

- "overloading the variables". For instance, passing object ID as file
  descriptors in a place of session ID, or

- "bypass TEE subsystem". For instance, extensively rely on meta
  parameters or push everything (e.g. kernel services) to the back-end
driver, which means leaving almost all TEE subsystem unused.

We cannot take the full benefits of TEE subsystem and may need to
implement most of the requirements in the back-end driver. Also, as
discussed above, the UAPI is not suitable for capability-based use cases.
We proposed a new set of ioctl calls for SMC-Invoke driver.

In this series we posted three patches. We implemented a transport
driver that provides qcom_tee_object. Any object on secure side is
represented with an instance of qcom_tee_object and any struct exposed
to TEE should embed an instance of qcom_tee_object. Any, support for new
services, e.g. memory object, RPMB, userspace clients or supplicants are
implemented independently from the driver.

We have a simple memory object and a user driver that uses
qcom_tee_object.

Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
---
Amirreza Zarrabi (3):
      firmware: qcom: implement object invoke support
      firmware: qcom: implement memory object support for TEE
      firmware: qcom: implement ioctl for TEE object invocation

 drivers/firmware/qcom/Kconfig                      |   36 +
 drivers/firmware/qcom/Makefile                     |    2 +
 drivers/firmware/qcom/qcom_object_invoke/Makefile  |   12 +
 drivers/firmware/qcom/qcom_object_invoke/async.c   |  142 +++
 drivers/firmware/qcom/qcom_object_invoke/core.c    | 1139 ++++++++++++++++++
 drivers/firmware/qcom/qcom_object_invoke/core.h    |  186 +++
 .../qcom/qcom_object_invoke/qcom_scm_invoke.c      |   22 +
 .../firmware/qcom/qcom_object_invoke/release_wq.c  |   90 ++
 .../qcom/qcom_object_invoke/xts/mem_object.c       |  406 +++++++
 .../qcom_object_invoke/xts/object_invoke_uapi.c    | 1231 ++++++++++++++++++++
 include/linux/firmware/qcom/qcom_object_invoke.h   |  233 ++++
 include/uapi/misc/qcom_tee.h                       |  117 ++
 12 files changed, 3616 insertions(+)
---
base-commit: 74564adfd3521d9e322cfc345fdc132df80f3c79
change-id: 20240702-qcom-tee-object-and-ioctls-6f52fde03485

Best regards,
-- 
Amirreza Zarrabi <quic_azarrabi@quicinc.com>

